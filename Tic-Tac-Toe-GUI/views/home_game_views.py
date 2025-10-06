import customtkinter as ctk
from PIL import Image
import re
from service.serial_service import SerialService

class TicTacToeView(ctk.CTkFrame):
    def __init__(self, master, logo_path="logo.png"):
        super().__init__(master)
        self.pack(fill="both", expand=True)
        self.master = master
        master.title("TicTacToe - Let's Play!")

        self.serial_service = SerialService()
        self.serial_service.on_data_received = self.handle_serial_data

        self.current_player = "O"  # Utente sempre O
        self.board_ready = False
        self.resetting_board = False  # Ignora mosse durante reset
        self.game_over = False  # Board non operabile quando gioco finito

        self.buttons = [[None for _ in range(3)] for _ in range(3)]

        self.setup_ui(logo_path)

    # --- UI setup ---
    def setup_ui(self, logo_path):
        # Pulsante Indietro
        self.back_button = ctk.CTkButton(self, text="← Indietro", width=100, command=self.handle_back)
        self.back_button.place(relx=0.02, rely=0.02, anchor="nw")

        # Frame centrale
        self.center_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.center_frame.place(relx=0.5, rely=0.5, anchor="center")

        # Logo
        try:
            logo_img = ctk.CTkImage(light_image=Image.open(logo_path), dark_image=Image.open(logo_path), size=(150,150))
            self.logo_label = ctk.CTkLabel(self.center_frame, image=logo_img, text="")
            self.logo_label.image = logo_img
        except Exception:
            self.logo_label = ctk.CTkLabel(self.center_frame, text="🎲 Tris Game", font=("Arial",36,"bold"), text_color="#4da6ff")
        self.logo_label.pack(pady=(0,30))

        # Griglia
        self.grid_frame = ctk.CTkFrame(self.center_frame, fg_color="transparent")
        self.grid_frame.pack()
        for r in range(3):
            for c in range(3):
                btn = ctk.CTkButton(
                    self.grid_frame, text="", width=120, height=120, font=("Arial",36,"bold"),
                    corner_radius=10, state="disabled",
                    command=lambda row=r, col=c: self.make_move(row,col)
                )
                btn.grid(row=r,column=c,padx=10,pady=10)
                self.buttons[r][c] = btn

        # Turno
        self.turn_label = ctk.CTkLabel(self.center_frame, text=f"Turno: {self.current_player}", font=("Arial",20,"bold"), text_color="#ffffff")
        self.turn_label.pack(pady=20)

        # Porta seriale
        self.port_label = ctk.CTkLabel(self, text="Seleziona Board:")
        self.port_label.place(relx=0.7, rely=0.02, anchor="ne")
        self.available_ports = self.serial_service.list_ports()
        self.selected_port = ctk.StringVar(value=self.available_ports[0] if self.available_ports else "")
        self.port_menu = ctk.CTkOptionMenu(self, values=self.available_ports, variable=self.selected_port, command=self.connect_to_board)
        self.port_menu.place(relx=0.98, rely=0.02, anchor="ne")

    # --- Gestione mosse ---
    def make_move(self, row, col):
        if not self.board_ready or self.resetting_board or self.game_over:
            print("[DEBUG] Board not ready or game over. Cannot make move.")
            return
        if self.buttons[row][col].cget("text") != "":
            print("[DEBUG] Cell already occupied")
            return

        move_str = f"{chr(ord('a')+col)}{row+1}"
        print(f"[DEBUG] Sending move: {move_str}")
        self.serial_service.send(move_str)

        self.set_grid_state(False)
        self.board_ready = False

    # --- Connessione seriale ---
    def connect_to_board(self, port_name):
        if self.serial_service.connect(port_name):
            print(f"[DEBUG] Connected to {port_name}")
            self.port_menu.configure(state="disabled")
            self.port_label.configure(text=f"Board connessa: {port_name}")
        else:
            print("[DEBUG] Failed to connect")
            self.port_label.configure(text="Connessione fallita")

    def set_grid_state(self, enable: bool):
        for row in self.buttons:
            for btn in row:
                btn.configure(state="normal" if enable else "disabled")

    # --- Ricezione dati seriali ---
    def handle_serial_data(self, data):
        self.master.after(0, self._handle_serial_gui_update, data.strip())

    def _handle_serial_gui_update(self, data):
        data = data.strip()

        # --- Board full / nuovo game ---
        if "New Game" in data or "The board is full" in data or "The board is full! Restarting the game." in data:
            print("[DEBUG] Received new game signal, resetting board...")
            self.resetting_board = True
            self.reset_board()
            return

        # Se stiamo resettando la board, ignoriamo tutte le mosse fino a nuovo turno
        if self.resetting_board:
            if "Your turn:" in data or "READY" in data:
                self.resetting_board = False
                self.board_ready = True
                self.set_grid_state(True)
            return

        # --- Turno utente pronto ---
        if "Your turn:" in data or "READY" in data:
            self.board_ready = True
            self.set_grid_state(True)
            return

        # --- Mossa utente confermata ---
        user_match = re.search(r"User's move:\s*([a-cA-C]),?\s*(\d)", data)
        if user_match and not self.resetting_board:
            col_char, row_char = user_match.groups()
            row = int(row_char)-1
            col = ord(col_char.lower())-ord('a')
            self.buttons[row][col].configure(text="O")  # Utente O
            self.current_player = "X"
            self.turn_label.configure(text=f"Turno: {self.current_player}")
            self.set_grid_state(False)
            print(f"[DEBUG] Applied user move at ({row},{col})")
            self.check_game_over()
            return

        # --- Mossa AI ---
        ai_match = re.search(r"AI's move was\s*([a-cA-C]\d)", data)
        if ai_match and not self.resetting_board:
            move = ai_match.group(1)
            col_char = move[0].lower()
            row = int(move[1])-1
            col = ord(col_char)-ord('a')
            self.buttons[row][col].configure(text="X")  # AI X
            self.current_player = "O"
            self.turn_label.configure(text=f"Turno: {self.current_player}")
            self.board_ready = True
            self.set_grid_state(True)
            print(f"[DEBUG] Applied AI move at ({row},{col})")
            self.check_game_over()
            return

    # --- Check fine partita ---
    def check_game_over(self):
        # Controlla righe, colonne e diagonali
        lines = []
        for i in range(3):
            lines.append([self.buttons[i][j].cget("text") for j in range(3)])  # righe
            lines.append([self.buttons[j][i].cget("text") for j in range(3)])  # colonne
        lines.append([self.buttons[i][i].cget("text") for i in range(3)])       # diagonale principale
        lines.append([self.buttons[i][2-i].cget("text") for i in range(3)])     # diagonale secondaria

        for line in lines:
            if line[0] != "" and line.count(line[0]) == 3:
                winner = line[0]
                if winner == "O":
                    self.turn_label.configure(text="Hai vinto!")
                else:
                    self.turn_label.configure(text="Hai perso!")
                print(f"[DEBUG] Game over! Winner: {winner}")
                self.game_over = True
                self.set_grid_state(False)
                return

        # Controlla pareggio
        full = all(self.buttons[r][c].cget("text") != "" for r in range(3) for c in range(3))
        if full:
            self.turn_label.configure(text="Pareggio!")
            print("[DEBUG] Game over! Draw")
            self.game_over = True
            self.set_grid_state(False)

    # --- Reset board ---
    def reset_board(self):
        print("[DEBUG] Resetting board for new game")
        for r in range(3):
            for c in range(3):
                self.buttons[r][c].configure(text="")
        self.current_player = "O"  # Utente inizia sempre
        self.turn_label.configure(text=f"Turno: {self.current_player}")
        self.board_ready = False
        self.game_over = False  # Riabilita la board anche dopo vittoria/sconfitta/pareggio
        self.set_grid_state(False)

    # --- Back ---
    def handle_back(self):
        from app import HomePage
        if self.selected_port.get():
            self.serial_service.disconnect()
        self.destroy()
        HomePage(self.master)
