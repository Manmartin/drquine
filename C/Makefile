COLLEEN = Colleen
GRACE = Grace

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS_COLLEEN = colleen.c
OBJS_COLLEEN = $(SRCS_COLLEEN:.c=.o)

SRCS_GRACE = grace.c
OBJS_GRACE = $(SRCS_GRACE:.c=.o)


%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(COLLEEN) $(GRACE)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $^

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
