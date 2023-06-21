#===================================================================
#	Projet 
#
#
#  Name:	"Makefile"
#
# Compiler used:    GNU GCC Compiler
# Documentation:
#               "Makefile" for ch341a gpio example
#
# Author:
#               laurent Epinat <l.epinat@free.fr>
#       2023-06-20
#               create:
#
#===================================================================
    
   CFLAGS += -pipe -Wall -Wextra -D_REENTRANT -fPIC -D_GNU_SOURCE -I./
  #CFLAGS += -O2
   CFLAGS += -O0 -g
     DEPS :=
     DEPS :=
     APPS := ch341a_gpio gpio_list

all: ${APPS}

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)
	
ch341a_gpio: ch341a_gpio.o
	${CC} -o $@ $^ ${CFLAGS}
	
gpio_list: gpio_list.o
	${CC} -o $@ $^ ${CFLAGS}

clean:
	rm -f  ${APPS}

FORCE:

.PHONY: all install clean FORCE prepare

