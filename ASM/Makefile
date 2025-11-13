COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror -no-pie

NASM            =   nasm
NASMFLAGS       =   -f elf64

SRCS_COLLEEN = Colleen.s
OBJS_COLLEEN = $(SRCS_COLLEEN:.s=.o)

SRCS_GRACE = Grace.s
OBJS_GRACE = $(SRCS_GRACE:.s=.o)

SRCS_SULLY = Sully.s
OBJS_SULLY = $(SRCS_SULLY:.s=.o)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $<

$(GRACE):  $(OBJS_GRACE)
	$(CC) $(CFLAGS) -o $@ $^

$(SULLY):  $(OBJS_SULLY)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) $(OBJS_COLLEEN) $(OBJS_GRACE) $(OBJS_SULLY)

fclean: clean
	$(RM) $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all

.PHONY: all clean fclean re
