import serial
import serial.tools.list_ports
import threading
import time

# --- SerialService con molti log ---
class SerialService:
    def __init__(self):
        self.ser = None
        self.read_thread = None
        self.running = False
        self.on_data_received = None  # Callback: funzione(data: str)
        self.on_connected = None      # Callback: funzione(port: str)
        self.on_disconnected = None   # Callback: funzione()
    
    # --- Lista delle porte disponibili ---
    def list_ports(self):
        ports = serial.tools.list_ports.comports()
        port_list = [port.device for port in ports]
        print(f"[SerialService] Available ports: {port_list}")
        return port_list

    # --- Connessione alla board ---
    def connect(self, port_name, baudrate=115200):
        print(f"[SerialService] Connecting to port {port_name} at {baudrate} baud")
        if self.ser and self.ser.is_open:
            print("[SerialService] Already connected, disconnecting first")
            self.disconnect()
        
        try:
            self.ser = serial.Serial(port_name, baudrate, timeout=1)
            print("[SerialService] Serial port opened, starting read thread")
            self.running = True
            self.read_thread = threading.Thread(target=self._read_loop, daemon=True)
            self.read_thread.start()
            if self.on_connected:
                self.on_connected(port_name)
            print(f"[SerialService] Connected to {port_name}")
            return True
        except serial.SerialException as e:
            print(f"[SerialService] Error opening serial port: {e}")
            return False

    # --- Loop di lettura dati ---
    def _read_loop(self):
        print("[SerialService] Read thread started")
        while self.running:
            if self.ser and self.ser.in_waiting > 0:
                try:
                    data = self.ser.readline().decode('utf-8', errors='ignore').strip()
                    if data:
                        print(f"[SerialService] Data received: '{data}'")
                        if self.on_data_received:
                            self.on_data_received(data)
                except UnicodeDecodeError:
                    print("[SerialService] Failed to decode received data")
            else:
                time.sleep(0.01)  # evita loop continuo

    # --- Invio dati alla board ---
    def send(self, message):
        if self.ser and self.ser.is_open:
            try:
                msg_to_send = message + '\n'
                print(f"[SerialService] Sending message: '{msg_to_send.strip()}'")
                self.ser.write(msg_to_send.encode('utf-8'))
            except serial.SerialException as e:
                print(f"[SerialService] Error sending serial data: {e}")
        else:
            print("[SerialService] Cannot send, serial port not open")

    # --- Disconnessione ---
    def disconnect(self):
        print("[SerialService] Disconnecting serial port")
        self.running = False
        if self.read_thread and self.read_thread.is_alive():
            self.read_thread.join(timeout=1)
            print("[SerialService] Read thread stopped")
        if self.ser and self.ser.is_open:
            self.ser.close()
            print("[SerialService] Serial port closed")
            self.ser = None
        if self.on_disconnected:
            self.on_disconnected()