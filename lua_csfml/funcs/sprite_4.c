/*
** EPITECH PROJECT, 2019
** sprite
** File description:
** sprite
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>
#include "utility.h"

int sprite_set_color(lua_State *L)
{
    sfSprite *sprite = 0;
    sfColor color  = {0, 0, 0, 0};

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Sprite, Red, Green, Blue, Alpha)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2) && lua_isinteger(L, 3) \
    && lua_isinteger(L, 4) && lua_isinteger(L, 5)) {
        sprite = userdata_pointer(L, 1, sfSprite);
        color.r = lua_tointeger(L, 2);
        color.g = lua_tointeger(L, 3);
        color.b = lua_tointeger(L, 4);
        color.a = lua_tointeger(L, 5);
        sfSprite_setColor(sprite, color);
    } else {
        luaL_error(L, "Expected (Sprite, Int, Int, Int, Int)");
        return (0);
    }
    return (0);
}