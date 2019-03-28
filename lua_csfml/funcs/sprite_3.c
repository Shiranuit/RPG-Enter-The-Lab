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