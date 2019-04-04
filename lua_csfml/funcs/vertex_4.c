/*
** EPITECH PROJECT, 2019
** vertex
** File description:
** vertex
*/

#include "lua_include.h"
#include "utility.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int vertex_get_g(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushinteger(L, vertex->color.g);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_b(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushinteger(L, vertex->color.b);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_a(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushinteger(L, vertex->color.a);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}