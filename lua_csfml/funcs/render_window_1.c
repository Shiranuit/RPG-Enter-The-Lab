/*
** EPITECH PROJECT, 2019
** render_window
** File description:
** render_window
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int win_clear(lua_State *L)
{
    if (lua_gettop(L) < 4) {
        luaL_error(L, "Needed 4 arguments");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2) && lua_isinteger(L, 3) && lua_isinteger(L, 4)) {
        sfRenderWindow **window = (sfRenderWindow **)lua_touserdata(L, 1);
        sfRenderWindow_clear(*window,
        (sfColor){lua_tointeger(L, 2), lua_tointeger(L, 3), lua_tointeger(L, 4), 255});
    } else {
        luaL_error(L, "Expected window_clear(RenderWindow, Number, Number, Number)");
    }
    return (0);
}