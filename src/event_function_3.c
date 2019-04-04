/*
** EPITECH PROJECT, 2019
** event_function
** File description:
** event_function
*/

#include "lsfml.h"
#include <SFML/Window.h>
#include <SFML/Graphics.h>
#include <SFML/System.h>

int event_keyreleased(lua_State *L, sfEvent *event)
{
    lua_pushstring(L, "key_released");
    lua_pushinteger(L, event->key.code);
    lua_pushboolean(L, event->key.control);
    lua_pushboolean(L, event->key.shift);
    lua_pushboolean(L, event->key.alt);
    lua_pushboolean(L, event->key.system);
    return (6);
}