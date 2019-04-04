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

int vertex_get_x(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushnumber(L, vertex->position.x);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_y(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushnumber(L, vertex->position.y);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_tx(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushnumber(L, vertex->texCoords.x);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_ty(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushnumber(L, vertex->texCoords.y);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}

int vertex_get_r(lua_State *L)
{
    sfVertex *vertex = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        vertex = userdata_pointer(L, 1, sfVertex);
        lua_pushinteger(L, vertex->color.r);
    } else {
        luaL_error(L, "Expected (Vertex)");
        return (0);
    }
    return (1);
}