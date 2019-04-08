-- =========================================
-- =                 LOADING               =
-- =========================================

local odofile = dofile
function dofile(filename)
    if filename then
        return odofile("./externs/lua_script/"..filename)
    else
        return odofile()
    end
end
dofile("lsfml.lua")

-- =========================================
-- =           MYRPG VARIABLES             =
-- =========================================


-- =========================================
-- =           MYRPG GAME-LOGIC            =
-- =========================================


-- Called at the beginning of the program
function init()

end

-- Called each time we need to draw a frame
function draw()

end

-- Called each time we need to update the game-logic
function update()

end

-- Called when an event is produced
function event(...)
    local event = {...}
end