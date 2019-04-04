/*
** EPITECH PROJECT, 2019
** engine
** File description:
** engine
*/

#ifndef ENGINE_H_
#define ENGINE_H_

#include "lsfml.h"
#include "lsfml.h"
#include <SFML/Window.h>
#include <SFML/Graphics.h>
#include <SFML/System.h>

int engine(lua_State *L, sfRenderWindow *window);
int get_event(lua_State *L, sfEvent *event);

#endif /* !ENGINE_H_ */
