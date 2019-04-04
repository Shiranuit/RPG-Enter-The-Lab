/*
** EPITECH PROJECT, 2019
** event
** File description:
** event
*/

#include "lsfml.h"
#include <SFML/Window.h>
#include <SFML/Graphics.h>
#include <SFML/System.h>
#include "engine.h"

int event_mouse_left(lua_State *L, sfEvent *event)
{
    lua_pushstring(L, "mouse_left");
    return (1);
}