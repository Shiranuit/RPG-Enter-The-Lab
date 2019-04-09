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
local owindow = window
dofile("lsfml.lua")

-- =========================================
-- =           MYRPG VARIABLES             =
-- =========================================

assets = {}

-- =========================================
-- =           MYRPG GAME-LOGIC            =
-- =========================================


-- Called at the beginning of the program
function init()
    window = setmetatable({}, {
        __index = lsfml.window,
        __gc = lsfml.window.destroy,
        __ptr = owindow,
        __type = "window",
    })
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