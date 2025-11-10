COLLEEN = Colleen

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS_COLLEEN = colleen.c
OBJS_COLLEEN = $(SRCS_COLLEEN:.c=.o)


all: $(COLLEEN)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(OBJS_COLLEEN)

fclean: clean
	$(RM) $(COLLEEN)

re: fclean all

.PHONY: all clean fclean re
