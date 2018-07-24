CC=gcc
CFLAGS= -g -Wall -Wextra -lgumbo -lcurl -lfuse -lcrypto \
-D_FILE_OFFSET_BITS=64 -DHTTPDIRFS_INFO
OBJ = main.o network.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

httpdirfs: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

install:
	cp httpdirfs ${HOME}/bin/

doc:
	doxygen Doxyfile

.PHONY: clean

clean:
	rm -rf *.o httpdirfs html
