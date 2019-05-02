/*
** EPITECH PROJECT, 2019
** main
** File description:
** main
*/

#include "lsfml.h"
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include "engine.h"
#include <unistd.h>
#include <SFML/Graphics.h>
#include <SFML/Window.h>
#include <SFML/Audio.h>
#include <SFML/System.h>

lua_State *init_lua(void)
{
    lua_State *L = luaL_newstate();

    luaL_openlibs(L);
    luaopen_lsfml(L);
    return (L);
}

void delete_lua(lua_State *L)
{
    lua_gc(L, LUA_GCCOLLECT, 0);
    lua_close(L);
}

void run_file(lua_State *L, char const *filename)
{
    int len = -1;
    char const *error = 0;

    if (luaL_dofile(L, filename) != LUA_OK) {
        error = lua_tostring(L, -1);
        while (error[++len]);
        write(1, "[ERROR] ", 9);
        write(1,  error, len);
        write(1, "\n", 1);
    }
}

int pcall(lua_State *L, int args, int result)
{
    return lua_pcall(L, args, result, 0);
}

int main(void)
{
    int code = 0;
    lua_State *L = init_lua();
    sfRenderWindow *window = sfRenderWindow_create(
    (sfVideoMode){1920, 1080, 32}, "Lua", sfClose, 0);
    sfRenderWindow **win = (sfRenderWindow **)
    lua_newuserdata(L, sizeof(sfRenderWindow *));

    sfRenderWindow_setKeyRepeatEnabled(window, sfFalse);
    *win = window;
    lua_setglobal(L, "window");
    run_file(L, "./externs/lua_script/startup.lua");
    code = engine(L, window);
    delete_lua(L);
    return (code);
}