COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

RM = rm -rf

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS_COLLEEN = Colleen.c
OBJS_COLLEEN = $(SRCS_COLLEEN:.c=.o)

SRCS_GRACE = Grace.c
OBJS_GRACE = $(SRCS_GRACE:.c=.o)

SRCS_SULLY = Sully.c
OBJS_SULLY = $(SRCS_SULLY:.c=.o)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $^

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
