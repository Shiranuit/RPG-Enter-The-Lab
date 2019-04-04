/*
** EPITECH PROJECT, 2019
** main
** File description:
** main
*/

#include "lsfml.h"
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include <SFML/Graphics.h>
#include <SFML/Window.h>
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
    char const *error = 0;
    if (luaL_dofile(L, filename) != LUA_OK) {
        error = lua_tostring(L, -1);
        printf("[ERROR] %s\n", error);
    }
}

int pcall(lua_State *L, int args, int result)
{
    return lua_pcall(L, args, result, 0);
}

int main(void)
{
    lua_State *L = init_lua();
    sfRenderWindow *window = sfRenderWindow_create((sfVideoMode){800, 600, 32}, "Lua", sfClose, 0);
    sfRenderWindow **win = (sfRenderWindow **)lua_newuserdata(L, sizeof(sfRenderWindow *));

    *win = window;
    lua_setglobal(L, "window");
    run_file(L, "./externs/lua_script/startup.lua");
    while (sfRenderWindow_isOpen(window)) {
        lua_getglobal(L, "draw");
        if (pcall(L, 0, 0) != LUA_OK) {
            printf("%s\n", lua_tostring(L, -1));
            return (84);
        }
        sfRenderWindow_display(window);
    }
    delete_lua(L);
    return 0;
}