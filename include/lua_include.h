/*
** EPITECH PROJECT, 2019
** lua_include
** File description:
** lua_include
*/

#ifndef LUA_INCLUDE_H_
#define LUA_INCLUDE_H_

#include "../externs/lua/src/lua.h"
#include "../externs/lua/src/lauxlib.h"
#include "../externs/lua/src/lualib.h"
#include <stdlib.h>
#include <unistd.h>

#define check_type(L, i, t) (lua_type(L, i) == t)
#define userdata_pointer(L, i, type) (*(type **)lua_touserdata(L, i))

#endif /* !LUA_INCLUDE_H_ */
