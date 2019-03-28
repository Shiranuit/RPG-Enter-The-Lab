/*
** EPITECH PROJECT, 2019
** render_window
** File description:
** render_window
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int win_get_size(lua_State *L)
{
    sfRenderWindow *window = 0;
    sfVector2u vector = {0, 0};

    if (lua_gettop(L) < 1) {
        luaL_error(L, "Expected (Window)");
        return (0);
    }
    if (lua_isuserdata(L, 1)) {
        window = userdata_pointer(L, 1, sfRenderWindow);
        vector = sfWindow_getSize(window);
        lua_pushnumber(L, vector.x);
        lua_pushnumber(L, vector.y);
    } else {
        luaL_error(L, "Expected (Window)");
    }
    return (2);
}