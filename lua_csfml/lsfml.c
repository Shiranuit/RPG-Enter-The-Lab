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
    {"window_setMouseCursorVisible", win_cursor_visible},
    {"window_close", win_close},
    {"window_drawCircleShape", win_draw_circle_shape},
    {"window_drawConvexShape", win_draw_convex_shape},
    {"window_drawVertexArray", win_draw_vertex_array},
    {"window_drawRectangleShape", win_draw_rectangle_shape},
    {"window_drawShape", win_draw_shape},
    {"window_drawSprite", win_draw_sprite},
    {"window_drawText", win_draw_text},
    {"window_setFramerateLimit", win_set_framerate_limit},
    {"window_setMouseCursorGrabbed", win_set_mouse_cursor_grabbed},
    {"shader_bind", shader_bind},
    {"shader_createFromFile", shader_create_from_file},
    {"shader_createFromMemory", shader_create_from_memory},
    {"shader_destroy", shader_destroy},
    {"shader_isAvailable", shader_is_available},
    {"shader_setColorParameter", shader_set_color_parameter},
    {"shader_setTextureParameter", shader_set_texture_parameter},
    {"shader_setFloat2Parameter", shader_set_float2_parameter},
    {"shader_setFloat3Parameter", shader_set_float3_parameter},
    {"shader_setFloat4Parameter", shader_set_float4_parameter},
    {"shader_setFloatParameter", shader_set_float_parameter},
    {"shader_setCurrentTextureParameter", shader_setcurrenttextureparameter},
    {"shader_setTransformParameter", shader_set_transform_parameter},
    {NULL, NULL},
};

LUALIB_API int luaopen_lsfml(lua_State *L)
{
  luaL_newlib(L, lsfmllib);
  lua_setglobal(L, "lsfml");
  return (1);
}