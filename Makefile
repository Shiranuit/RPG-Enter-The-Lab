##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

NAME	= program

CC	= gcc

RM	= rm -f

SRCS	= ./src/main.c \
		  ./src/engine.c \
		  ./src/event.c \

LSFML = ./lua_csfml/lsfml.c \
		  ./lua_csfml/funcs/render_window_1.c \
		  ./lua_csfml/funcs/render_window_2.c \
		  ./lua_csfml/funcs/render_window_3.c \
		  ./lua_csfml/funcs/sprite_1.c \
		  ./lua_csfml/funcs/sprite_2.c \
		  ./lua_csfml/funcs/sprite_3.c \
		  ./lua_csfml/funcs/shader_1.c \
		  ./lua_csfml/funcs/shader_2.c \
		  ./lua_csfml/funcs/shader_3.c \
		  ./lua_csfml/funcs/texture_1.c \
		  ./lua_csfml/funcs/texture_2.c \
		  ./lua_csfml/funcs/texture_3.c \
		  ./lua_csfml/funcs/clock_1.c \
		  ./lua_csfml/funcs/utility.c \
		  ./lua_csfml/funcs/utility_2.c \
		  ./lua_csfml/funcs/text_1.c \
		  ./lua_csfml/funcs/text_2.c \
		  ./lua_csfml/funcs/text_3.c \
		  ./lua_csfml/funcs/text_4.c \
		  ./lua_csfml/funcs/vertexarray_1.c \
		  ./lua_csfml/funcs/vertexarray_2.c \
		  ./lua_csfml/funcs/vertexarray_3.c \
		  ./lua_csfml/funcs/vertex_1.c \
		  ./lua_csfml/funcs/vertex_2.c \
		  ./lua_csfml/funcs/vertex_3.c \
		  ./lua_csfml/funcs/vertex_4.c \
		  ./lua_csfml/funcs/music_1.c \
		  ./lua_csfml/funcs/music_2.c \
		  ./lua_csfml/funcs/music_3.c \
		  ./lua_csfml/funcs/font_1.c \

SRCS += $(LSFML)
OBJS	= $(SRCS:.c=.o)

CFLAGS = -I./include/ -lcsfml-window -lcsfml-graphics -lcsfml-system -lcsfml-audio -L./externs/lua/src -llua -ldl -lm
CFLAGS += -Wall -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	make -C ./externs/lua linux
	 $(CC) $(OBJS) -o $(NAME) $(CFLAGS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

flclean:
	make -C ./externs/lua clean

re: fclean all

rel: fclean flclean all

.PHONY: all clean fclean re
