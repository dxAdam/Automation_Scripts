// Client side C/C++ program to demonstrate Socket
// programming
#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#define PORT 8090

static int run = 1;

void intHandler() {
	run = 0;
}

int main(int argc, char const* argv[])
{
        if(argc < 2){
	    printf("ERROR - client.c requires a server IP address as an agrument\n");
	    exit(-1);
	}

        struct sigaction act;
	act.sa_handler = intHandler;
	sigaction(SIGINT, &act, NULL);

	int sock = 0, valread, client_fd;
	struct sockaddr_in serv_addr;
	char msg[20];
	char buffer[1024] = { 0 };
	int x = 0;
	while(run){
	    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
	         	printf("\n Socket creation error \n");
		    return -1;
	    }

	    serv_addr.sin_family = AF_INET;
	    serv_addr.sin_port = htons(PORT);

	    // Convert IPv4 and IPv6 addresses from text to binary
	    // form
	    if (inet_pton(AF_INET, "192.168.1.31", &serv_addr.sin_addr)
		<= 0) {
		printf(
			"\nInvalid address/ Address not supported \n");
		return -1;
	    }
	    if ((client_fd
		= connect(sock, (struct sockaddr*)&serv_addr,
				sizeof(serv_addr)))
		< 0) {
		printf("\nConnection Failed \n");
		return -1;
	    }
            
            char line[20];
	    fflush(stdin);
	    fflush(stdout);
            fgets(line, sizeof(line), stdin);
            sscanf(line, "%19s", &msg);
	
	    send(sock, msg, strlen(msg), 0);
	    valread = read(sock, buffer, 1024);
	
	// closing the connected socket
	}
	close(client_fd);
	printf("exiting normally\n");
	return 0;
}

