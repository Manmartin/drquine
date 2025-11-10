COLLEEN = Colleen
GRACE = Grace

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror -no-pie

NASM            =   nasm
NASMFLAGS       =   -f elf64

SRCS_COLLEEN = colleen.s
OBJS_COLLEEN = $(SRCS_COLLEEN:.s=.o)

SRCS_GRACE = grace.s
OBJS_GRACE = $(SRCS_GRACE:.s=.o)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(COLLEEN) $(GRACE)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $<

$(GRACE):  $(OBJS_GRACE)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) $(OBJS_COLLEEN)
	$(RM) $(OBJS_GRACE)

fclean: clean
	$(RM) $(COLLEEN)
	$(RM) $(GRACE)

re: fclean all

.PHONY: all clean fclean re
