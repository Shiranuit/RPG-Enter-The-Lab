/*
** EPITECH PROJECT, 2019
** utility
** File description:
** utility
*/

#ifndef LSFML_FUNCTION_H_
#define LSFML_FUNCTION_H_

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int get_vector_2f(lua_State *L, sfVector2f *vector, int index);
int get_int_rect(lua_State *L, sfIntRect *rect, int index);

#endif