/*
** EPITECH PROJECT, 2019
** lsfml
** File description:
** lsfml
*/

#include "lua_include.h"
#include "lsfml_function.h"
#include "lsfml.h"



static const luaL_Reg lsfmllib[] = {
    {"window_clear", win_clear},
    {"window_setCursorVisible", win_cursor_visible},
    {"window_close", win_close},
    {"window_draw_circle", win_draw_circle_shape},
    {NULL, NULL},
};

LUALIB_API int luaopen_lsfml(lua_State *L)
{
  luaL_newlib(L, lsfmllib);
  lua_setglobal(L, "lsfml");
  return (1);
}