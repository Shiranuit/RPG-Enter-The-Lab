/*
** EPITECH PROJECT, 2019
** render_window_3
** File description:
** render_window_3
*/

#include "lua_include.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>

int win_set_framerate_limit(lua_State *L)
{
    sfRenderWindow *window = 0;
    int fps = 0;
    sfRenderStates *state = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Window, Number)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isinteger(L, 2)) {
        window = userdata_pointer(L, 1, sfRenderWindow);
        fps = lua_tointeger(L, 2);
        sfRenderWindow_setFramerateLimit(window, fps);
    } else {
        luaL_error(L, "Expected (Window, Number)");
    }
    return (0);
}

int win_set_mouse_cursor_grabbed(lua_State *L)
{
    sfRenderWindow *window = 0;
    sfRenderStates *state = 0;

    if (lua_gettop(L) < 2) {
        luaL_error(L, "Expected (Window, Boolean)");
        return (0);
    }
    if (lua_isuserdata(L, 1) && lua_isboolean(L, 2)) {
        window = userdata_pointer(L, 1, sfRenderWindow);
        sfRenderWindow_setMouseCursorGrabbed(window, lua_toboolean(L, 2));
    } else {
        luaL_error(L, "Expected (Window, Boolean)");
    }
    return (0);
}