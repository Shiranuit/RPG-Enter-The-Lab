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
    {"window_getSize", win_get_size},
    {"sprite_setTexture", sprite_set_texture},
    {"sprite_getPosition", sprite_get_position},
    {"sprite_create", sprite_create},
    {"sprite_destroy", sprite_destroy},
    {"sprite_move", sprite_move},
    {"sprite_setPosition", sprite_set_position},
    {"sprite_setScale", sprite_set_scale},
    {"sprite_getScale", sprite_get_scale},
    {"sprite_setRotation", sprite_set_rotation},
    {"sprite_rotate", sprite_rotate},
    {"sprite_getRotation", sprite_get_rotation},
    {NULL, NULL},
};

LUALIB_API int luaopen_lsfml(lua_State *L)
{
  luaL_newlib(L, lsfmllib);
  lua_setglobal(L, "lsfml");
  return (1);
}