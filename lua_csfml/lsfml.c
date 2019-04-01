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
    {"window_draw_circle", win_draw_circle_shape},
    {"window_getSize", win_get_size},
    {"window_drawCircleShape", win_draw_circle_shape},
    {"window_drawConvexShape", win_draw_convex_shape},
    {"window_drawVertexArray", win_draw_vertex_array},
    {"window_drawRectangleShape", win_draw_rectangle_shape},
    {"window_drawShape", win_draw_shape},
    {"window_drawSprite", win_draw_sprite},
    {"window_drawText", win_draw_text},
    {"window_setFramerateLimit", win_set_framerate_limit},
    {"window_setMouseCursorGrabbed", win_set_mouse_cursor_grabbed},

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
    {"sprite_getOrigin", sprite_get_origin},
    {"sprite_scale", sprite_scale},
    {"sprite_set_origin", sprite_set_origin},
    {"sprite_setTextureRect", sprite_set_texture_rect},

    {"text_create", text_create},
    {"text_destroy", text_destroy},
    {"text_getPosition", text_get_position},
    {"text_setScale", text_set_scale},
    {"text_setPosition", text_set_position},
    {"text_move", text_move},
    {"text_rotate", text_rotate},
    {"text_scale", text_scale},
    {"text_setRotation", text_set_rotation},
    {"text_getOrigin", text_get_origin},
    {"text_getScale", text_get_scale},
    {"text_setOrigin", text_set_origin},
    {"text_getRotation", text_get_rotation},
    {"text_setString", text_set_string},
    {"text_setFont", text_set_font},
    {"text_setCharacterSize", text_set_character_size},
    {"text_getString", text_get_string},

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