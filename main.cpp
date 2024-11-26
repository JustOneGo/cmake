#include <iostream>
#include <libserialport.h>
#include <cstring>

int main() {
    sp_port* port;
    const char* port_name = "/dev/ttyS3"; // Replace with your serial port name

    // Find and open the port
    if (sp_get_port_by_name(port_name, &port) != SP_OK) {
        std::cerr << "Error: Could not find port " << port_name << std::endl;
        return 1;
    }

    if (sp_open(port, SP_MODE_READ_WRITE) != SP_OK) {
        std::cerr << "Error: Could not open port " << port_name << std::endl;
        sp_free_port(port);
        return 1;
    }

    // Configure the port
    sp_set_baudrate(port, 115200);
    sp_set_bits(port, 8);
    sp_set_parity(port, SP_PARITY_NONE);
    sp_set_stopbits(port, 1);
    sp_set_flowcontrol(port, SP_FLOWCONTROL_NONE);

    // Allocate buffer for reading
    const size_t buffer_size = 256;
    char buffer[buffer_size];

    // Blocking read loop
    while (true)
    {
        int bytes_read = sp_blocking_read(port, buffer, buffer_size - 1, 5000); // 5-second timeout

        if (bytes_read > 0) {
            buffer[bytes_read] = '\0'; // Null-terminate the string
            std::cout << "Received: " << buffer << std::endl;
        } else if (bytes_read == 0) {
            std::cout << "Timeout: No data received within 5 seconds." << std::endl;
        } else {
            std::cerr << "Error reading from port: " << sp_last_error_message() << std::endl;
            break;
        }
    }

    // Close the port
    sp_close(port);
    sp_free_port(port);

    return 0;
}
