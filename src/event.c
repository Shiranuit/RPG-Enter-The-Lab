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


int get_event(lua_State *L, sfEvent *event)
{
    if (event->type == sfEvtMouseMoved) {
        lua_pushstring(L, "mouse_move");
        lua_pushinteger(L, event->mouseMove.x);
        lua_pushinteger(L, event->mouseMove.y);
        return (3);
    }
    return (0);
}