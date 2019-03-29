/*
** EPITECH PROJECT, 2019
** sprite
** File description:
** sprite
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int sprite_rotate(lua_State *L)
{
    sfSprite *sprite = 0;
    double nb = 0.0;

    if (lua_gettop(L) < 3) {
        luaL_error(L, "Expected (Sprite, Float)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isnumber(L, 3)) {
        sprite = userdata_pointer(L, 1, sfSprite);
        nb = lua_tonumber(L, 3);
        sfSprite_rotate(sprite, nb);
    } else {
        luaL_error(L, "Expected (Sprite, Float)");
    }
    return (0);
}

int sprite_get_origin(lua_State *L)
{
    sfSprite *sprite = 0;
    sfVector2f vector = {0, 0};

    if (lua_gettop(L) < 1) {
        luaL_error(L, "Expected (Sprite)");
        return (0);
    }
    if (lua_isuserdata(L, 1)) {
        sprite = userdata_pointer(L, 1, sfSprite);
        vector = sfSprite_getOrigin(sprite);
        lua_pushnumber(L, vector.x);
        lua_pushnumber(L, vector.y);
    } else {
        luaL_error(L, "Expected (Sprite)");
    }
    return (2);
}

int sprite_scale(lua_State *L)
{
    sfSprite *sprite = 0;
    sfVector2f vector = {0, 0};

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Sprite, Table)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_istable(L, 1)) {
        sprite = userdata_pointer(L, 1, sfSprite);
        if (get_vector_2f(L, &vector, 2))
            return (0);
        sfSprite_Scale(sprite, vector);
    } else {
        luaL_error(L, "Expected (Sprite, Table)");
    }
    return (0);
}

int sprite_set_origin(lua_State *L)
{
    sfSprite *sprite = 0;
    sfVector2f vector = {0, 0};

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Sprite, Table)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_istable(L, 1)) {
        sprite = userdata_pointer(L, 1, sfSprite);
        if (get_vector_2f(L, &vector, 2))
            return (0);
        sfSprite_setOrigin(sprite, vector);
    } else {
        luaL_error(L, "Expected (Sprite, Table)");
    }
}