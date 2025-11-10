COLLEEN = Colleen

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror -no-pie

NASM            =   nasm
NASMFLAGS       =   -f elf64

SRCS_COLLEEN = colleen.s
OBJS_COLLEEN = $(SRCS_COLLEEN:.s=.o)


%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(COLLEEN)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(OBJS_COLLEEN)

fclean: clean
	$(RM) $(COLLEEN)

re: fclean all

.PHONY: all clean fclean re
