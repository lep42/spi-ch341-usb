#===================================================================
#	Projet 
#
#
#  Name:	"Makefile"
#
# Compiler used:    GNU GCC Compiler
# Documentation:
#               "Makefile" for ch341a spi example
#
# Author:
#               laurent Epinat <l.epinat@free.fr>
#       2023-06-20
#               create:
#
#===================================================================


       CC := gcc
      
   CFLAGS += -pipe -Wall -Wextra -D_REENTRANT -fPIC -D_GNU_SOURCE -I./
  #CFLAGS += -O2
   CFLAGS += -O0 -g
     DEPS :=
     APPS := spidev_test spidev_fdx

all: ${APPS}

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)
	
spidev_test: spidev_test.o
	${CC} -o $@ $^ ${CFLAGS}
	
spidev_fdx: spidev_fdx.o
	${CC} -o $@ $^ ${CFLAGS}

clean:
	rm -f  ${APPS}

FORCE:

.PHONY: all install clean FORCE prepare

