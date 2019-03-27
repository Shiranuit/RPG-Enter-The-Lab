/*
** EPITECH PROJECT, 2019
** lsfml_function
** File description:
** lsfml_function
*/

#ifndef LSFML_FUNCTION_H_
#define LSFML_FUNCTION_H_

#include "lua_include.h"

int win_clear(lua_State *L);
int win_cursor_visible(lua_State *L);
int win_close(lua_State *L);
int win_draw_circle_shape(lua_State *L);

#endif /* !LSFML_FUNCTION_H_ */
