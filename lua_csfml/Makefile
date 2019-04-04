NAME	= program

CC	= gcc

RM	= rm -f

SRCS	= ./main.c \
		  ./lsfml.c \
		  ./funcs/render_window_1.c \
		  ./funcs/render_window_2.c \
		  ./funcs/render_window_3.c \
		  ./funcs/sprite_1.c \
		  ./funcs/sprite_2.c \
		  ./funcs/sprite_3.c \
		  ./funcs/shader_1.c \
		  ./funcs/shader_2.c \
		  ./funcs/shader_3.c \
		  ./funcs/texture_1.c \
		  ./funcs/texture_2.c \
		  ./funcs/texture_3.c \
		  ./funcs/clock_1.c \
		  ./funcs/utility.c \
		  ./funcs/text_1.c \
		  ./funcs/text_2.c \
		  ./funcs/text_3.c \
		  ./funcs/text_4.c \
		  ./funcs/font_1.c \
		  ./funcs/music_1.c \
		  ./funcs/music_2.c \
		  ./funcs/music_3.c

OBJS	= $(SRCS:.c=.o)

CFLAGS = -I ./include/ -L./lua/src/ -llua -ldl -lm -lcsfml-window -lcsfml-graphics -lcsfml-system -lcsfml-audio
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
