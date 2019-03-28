/*
** EPITECH PROJECT, 2019
** lsfml_function
** File description:
** lsfml_function
*/

#ifndef LSFML_FUNCTION_H_
#define LSFML_FUNCTION_H_

#include "lua_include.h"
#include <SFML/Graphics.h>

int win_clear(lua_State *L);
int win_cursor_visible(lua_State *L);
int win_close(lua_State *L);
int win_draw_circle_shape(lua_State *L);
int win_get_size(lua_State *L);
int sprite_set_texture(lua_State *L);
int sprite_get_position(lua_State *L);
int sprite_create(lua_State *L);
int sprite_destroy(lua_State *L);
int sprite_move(lua_State *L);
int sprite_set_position(lua_State *L);
int sprite_set_scale(lua_State *L);
int sprite_get_scale(lua_State *L);
int sprite_set_rotation(lua_State *L);
int sprite_rotate(lua_State *L);
int sprite_get_rotation(lua_State *L);
int get_vector_2f(lua_State *L, sfVector2f *vector, int index)

#endif /* !LSFML_FUNCTION_H_ */
