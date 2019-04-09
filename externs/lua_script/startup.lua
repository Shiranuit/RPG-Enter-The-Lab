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

local clock = lsfml.clock.create()

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
    if clock:getEllapsedTime() > 250000 then
        clock:restart()
        window:clear(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    end
end

-- Called each time we need to update the game-logic
function update()

end

-- Called when an event is produced
function event(...)
    local event = {...}
end