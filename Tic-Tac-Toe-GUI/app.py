import customtkinter as ctk
from configuration.tic_tac_toe_configuration import set_app_icon
from configuration.tic_tac_toe_configuration import APP_NAME
from views.home_game_views import TicTacToeView

class HomePage(ctk.CTkFrame):
    def __init__(self, master):
        super().__init__(master)
        self.pack(fill="both", expand=True)
        self.master = master

        master.title(f"{APP_NAME}")
        set_app_icon(master)

        # --- Sfondo principale ---
        self.bg_frame = ctk.CTkFrame(self, fg_color="#1c1c1c", corner_radius=0)
        self.bg_frame.pack(fill="both", expand=True)

        # --- Frame centrale per centrare il contenuto ---
        self.center_frame = ctk.CTkFrame(self.bg_frame, fg_color="transparent")
        self.center_frame.place(relx=0.5, rely=0.5, anchor="center")  # centro esatto

        # --- Logo / titolo stilizzato ---
        self.title_label = ctk.CTkLabel(
            self.center_frame,
            text=f"{APP_NAME}",
            font=("Arial", 48, "bold"),
            text_color="#4da6ff",
        )
        self.title_label.pack(pady=(0, 20))

        # --- Slogan ---
        self.subtitle_label = ctk.CTkLabel(
            self.center_frame,
            text="Sfida l'Intelligenza Artificiale col gioco del Tris!",
            font=("Arial", 18, "italic"),
            text_color="#aaaaaa",
        )
        self.subtitle_label.pack(pady=(0, 50))  # più spazio prima del pulsante

        # --- Pulsante Let's Play centrato ---
        self.play_btn = ctk.CTkButton(
            self.center_frame,
            text="🎮 Let's Play",
            font=("Arial", 20, "bold"),
            width=260,
            height=70,
            corner_radius=30,
            fg_color="#33cc33",
            hover_color="#45e645",
            command=self.go_to_tictactoe,
        )
        self.play_btn.pack(pady=20)

    # Let's Play command
    def go_to_tictactoe(self):
        self.destroy()
        TicTacToeView(self.master)


if __name__ == "__main__":
    ctk.set_appearance_mode("dark")
    ctk.set_default_color_theme("blue")

    root = ctk.CTk()

    # Ottieni le dimensioni dello schermo
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Imposta la finestra alla dimensione massima dello schermo
    root.geometry(f"{screen_width}x{screen_height}+0+0")
    root.minsize(800, 600)

    # Rimuovi margini interni
    root.grid_rowconfigure(0, weight=1)
    root.grid_columnconfigure(0, weight=1)

    # Avvia HomePage
    homepage = HomePage(root)
    homepage.grid(row=0, column=0, sticky="nsew")

    root.mainloop()
