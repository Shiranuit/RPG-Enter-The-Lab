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
        return (0);
    }
    vector->x = lua_tonumber(L, -1);
    lua_pushstring(L, "y");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "y must be a number");
        return (0);
    }
    vector->y = lua_tonumber(L, -1);
    return (1);
}

int get_int_rect_2(lua_State *L, sfIntRect *rect, int index)
{
    lua_pushstring(L, "width");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "width must be a number");
        return (0);
    }
    rect->width = lua_tonumber(L, -1);
    lua_pushstring(L, "height");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "height must be a number");
        return (0);
    }
    rect->height = lua_tonumber(L, -1);
    return (1);
}

int get_int_rect(lua_State *L, sfIntRect *rect, int index)
{
    lua_pushstring(L, "x");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "x must be a number");
        return (0);
    }
    rect->left = lua_tonumber(L, -1);
    lua_pushstring(L, "y");
    lua_gettable(L, index);
    if (lua_isnumber(L, -1)) {
        luaL_error(L, "y must be a number");
        return (0);
    }
    rect->top = lua_tonumber(L, -1);
    if (get_int_rect_2(L, rect, index))
        return (0);
    return (1);
}
