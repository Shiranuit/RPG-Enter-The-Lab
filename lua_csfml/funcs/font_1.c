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

int font_create_from_file(lua_State *L)
{
    sfFont *font = 0;
    sfFont **font_p = 0;
    const char *str = NULL;

    if (lua_gettop(L) < 1) {
        luaL_error(L, "Expected (FileName)");
        return (0);
    }
    if (lua_isuserdata(L, 1)) {
        str = lua_tostring(L, 1);
        font = sfFont_createFromFile(str);
        font_p = (sfFont **)lua_newuserdata(L, sizeof(sfFont *));
        *font_p = font;
    } else {
        luaL_error(L, "Expected (String)");
        return (0);
    }
    return (1);
}

int font_destroy(lua_State *L)
{
    sfFont *font = 0;

    if (lua_gettop(L) < 1) {
        luaL_error(L, "Expected (Font)");
        return (0);
    }
    if (lua_isuserdata(L, 1)) {
        font = userdata_pointer(L, 1, sfFont);
        sfFont_destroy(font);
    } else {
        luaL_error(L, "Expected (Font)");
        return (0);
    }
    return (0);
}