/*
** EPITECH PROJECT, 2019
** lua_include
** File description:
** lua_include
*/

#ifndef LUA_INCLUDE_H_
#define LUA_INCLUDE_H_

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include <stdlib.h>
#include <unistd.h>

#define check_type(L, i, t) (lua_type(L, i) == t)

#endif /* !LUA_INCLUDE_H_ */
