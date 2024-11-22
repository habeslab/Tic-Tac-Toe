import serial
import serial.tools.list_ports

def list_com_ports():
    ports = serial.tools.list_ports.comports()
    return [port.device for port in ports]

def select_com_port():
    ports = list_com_ports()
    if not ports:
        print("No COM ports found.")
        return None
    
    print("Available COM ports:")
    for i, port in enumerate(ports):
        print(f"{i + 1}: {port}")

    while True:
        try:
            choice = int(input("Select a COM port by number: ")) - 1
            if 0 <= choice < len(ports):
                return ports[choice]
            else:
                print("Invalid selection. Try again.")
        except ValueError:
            print("Invalid input. Enter a number.")

def open_serial_connection(port):
    try:
        ser = serial.Serial(port, 115200, timeout=1)
        return ser
    except serial.SerialException as e:
        print(f"Error opening serial port: {e}")
        return None

def read_from_serial(ser):
    while True:
        if ser.in_waiting > 0:
            try:
                data = ser.readline().decode('utf-8', errors='ignore').strip()
                if data:
                    print(data)
                    return data
            except UnicodeDecodeError:
                print("Failed to decode the received data.")

def write_to_serial(ser, message):
    ser.write(message.encode('utf-8'))

def play_tictactoe():
    port = select_com_port()
    if not port:
        return
    
    ser = open_serial_connection(port)
    if not ser:
        return
    
    print("Connected to", port)
    
    try:
        while True:
            data = read_from_serial(ser)
            if "Your turn:" in data:
                user_input = input("Enter your move (e.g., a1): ").strip()
                write_to_serial(ser, user_input)
            elif "The AI took" in data or "AIs turn was" in data:
                # Read additional lines if needed
                continue

    except KeyboardInterrupt:
        print("Game interrupted.")
    finally:
        ser.close()
        print("Serial connection closed.")

if __name__ == "__main__":
    play_tictactoe()
