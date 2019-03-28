NAME	= program

CC	= gcc

RM	= rm -f

SRCS	= ./main.c \
		  ./lsfml.c \
		  ./funcs/render_window_1.c \
		  ./funcs/render_window_3.c \
		  ./funcs/sprite_1.c \
		  ./funcs/sprite_2.c \
		  ./funcs/sprite_3.c \
		  ./funcs/utility.c

OBJS	= $(SRCS:.c=.o)

CFLAGS = -I ./include/ -L./lua/src/ -llua -ldl -lm -lcsfml-window -lcsfml-graphics -lcsfml-system
CFLAGS += -Wall -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	 $(CC) $(OBJS) -o $(NAME) $(CFLAGS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
