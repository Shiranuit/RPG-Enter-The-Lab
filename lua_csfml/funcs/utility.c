/*
** EPITECH PROJECT, 2019
** sprite
** File description:
** sprite
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int get_vector_2f(lua_State *L, sfVector2f *vector, int index)
{
    lua_pushstring(L, "x");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "x must be a number");
        return (1);
    }
    vector->x = lua_tonumber(L, -1);
    lua_pushstring(L, "y");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "y must be a number");
        return (1);
    }
    vector->y = lua_tonumber(L, -1);
    return (0);
}