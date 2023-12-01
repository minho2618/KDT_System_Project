TARGET = toy_project

SYSTEM = ./system
UI = ./ui
WEB = ./web_server

HEADER = -I$(SYSTEM) -I$(UI) -I$(WEB)

CC = gcc

objects = main.o system_server.o gui.o web_server.o input.o

.PHONY: clean

$(TARGET): clean $(objects)
	$(CC) -o $(TARGET) $(objects)

main.o: main.c
	$(CC) -c main.c $(HEADER)

system_server.o: $(SYSTEM)/system_server.h $(SYSTEM)/system_server.c
	$(CC) -c $(SYSTEM)/system_server.c $(HEADER)

gui.o: $(UI)/gui.h $(UI)/gui.c
	$(CC) -c $(UI)/gui.c $(HEADER)
	
web_server.o: $(WEB)/web_server.h $(WEB)/web_server.c
	$(CC) -c $(WEB)/web_server.c $(HEADER)

input.o: $(UI)/input.h $(UI)/input.c
	$(CC) -c $(UI)/input.c $(HEADER)

clean:
	rm -rf *.o
