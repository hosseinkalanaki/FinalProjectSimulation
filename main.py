import json
import random
import time
import schedule
import socket
import threading

# Load configuration from JSON file
def load_config(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

# Generate a new value within the constraints
def generate_value(prev_value, min_value=20, max_value=38, max_change=1):
    delta = random.uniform(-max_change, max_change)
    new_value = prev_value + delta
    new_value = max(min(new_value, max_value), min_value)
    return round(new_value, 2)

# Simulate sensor readings
def simulate_sensors(config, previous_values):
    results = {}
    for sensor in config:
        sensor_type = sensor['type']
        module_id = sensor['module']

        if sensor_type not in results:
            results[sensor_type] = {}

        if module_id not in previous_values[sensor_type]:
            previous_values[sensor_type][module_id] = random.uniform(-10, 10)

        prev_value = previous_values[sensor_type][module_id]
        new_value = generate_value(prev_value)
        results[sensor_type][module_id] = new_value
        previous_values[sensor_type][module_id] = new_value

    return results

# TCP Server to broadcast messages to clients
class TCPServer:
    def __init__(self, host='0.0.0.0', port=80):
        self.host = host
        self.port = port
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen(5)
        self.clients = []
        self.running = True

    def start(self):
        print(f"TCP Server started on {self.host}:{self.port}")
        threading.Thread(target=self.accept_clients, daemon=True).start()

    def accept_clients(self):
        while self.running:
            client_socket, client_address = self.server_socket.accept()
            print(f"New client connected: {client_address}")
            self.clients.append(client_socket)

    def broadcast(self, message):
        for client in self.clients[:]:
            try:
                client.sendall(message.encode('utf-8'))
            except Exception as e:
                print(f"Error sending to client: {e}")
                self.clients.remove(client)

    def stop(self):
        self.running = False
        self.server_socket.close()
        print("TCP Server stopped.")

# Main simulation function
def run_simulation():
    global previous_values, tcp_server

    # Load configuration from JSON
    config = load_config('sensors_config.json')

    # If previous values are not initialized, initialize them
    if not previous_values:
        previous_values = {sensor['type']: {} for sensor in config}

    # Simulate sensors
    results = simulate_sensors(config, previous_values)

    # Convert results to JSON and broadcast via TCP
    results_json = json.dumps(results, indent=4)
    print("Broadcasting sensor readings...")
    tcp_server.broadcast(results_json)

# Global variables
previous_values = {}
tcp_server = TCPServer()

# Schedule the simulation to run every 10 seconds
schedule.every(10).seconds.do(run_simulation)

# Run the scheduler and TCP server
if __name__ == "__main__":
    print("Starting temperature and humidity simulation...")
    tcp_server.start()  # Start the TCP server
    run_simulation()  # Run once at startup
    try:
        while True:
            schedule.run_pending()
            time.sleep(1)
    except KeyboardInterrupt:
        print("Shutting down...")
        tcp_server.stop()
