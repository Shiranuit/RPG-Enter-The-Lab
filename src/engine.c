/*
** EPITECH PROJECT, 2019
** engine
** File description:
** engine
*/

#include "lsfml.h"
#include <SFML/Window.h>
#include <SFML/Graphics.h>
#include <SFML/System.h>
#include "engine.h"

int pcall(lua_State *L, int args, int result)
{
    return lua_pcall(L, args, result, 0);
}

int init(lua_State *L)
{
    lua_getglobal(L, "init");
    if (pcall(L, 0, 0) != LUA_OK) {
        printf("%s\n", lua_tostring(L, -1));
        return (84);
    }
    return (1);
}

int draw(lua_State *L)
{
    lua_getglobal(L, "draw");
    if (pcall(L, 0, 0) != LUA_OK) {
        printf("%s\n", lua_tostring(L, -1));
        return (84);
    }
    return (1);
}

int update(lua_State *L)
{
    lua_getglobal(L, "update");
    if (pcall(L, 0, 0) != LUA_OK) {
        printf("%s\n", lua_tostring(L, -1));
        return (84);
    }
    return (1);
}

int event(lua_State *L, sfRenderWindow *window)
{
    sfEvent event;
    int args = 0;
    lua_getglobal(L, "event");
    if (!lua_isfunction(L, -1)) return (84);
    lua_pop(L, 1);
    while (sfRenderWindow_pollEvent(window, &event)) {
        lua_getglobal(L, "event");
        args = get_event(L, &event);
        if (pcall(L, args, 0) != LUA_OK) {
            printf("%s\n", lua_tostring(L, -1));
            return (84);
        }
    }
    return (1);
}

int engine(lua_State *L, sfRenderWindow *window)
{
    sfClock *update_clock = sfClock_create();

    if (init(L) == 84) return (84);
    sfRenderWindow_setFramerateLimit(window, 60);
    while (sfRenderWindow_isOpen(window)) {
        if (event(L, window) == 84) return (84);
        if (sfClock_getElapsedTime(update_clock).microseconds / 1000000 > 20) {
            if (update(L) == 84) return (84);
            sfClock_restart(update_clock);
        }
        if (draw(L) == 84) return (84);
        sfRenderWindow_display(window);
    }
    return (0);
}