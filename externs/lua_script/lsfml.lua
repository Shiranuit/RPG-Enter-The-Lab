-- =========================================
-- =                 LSFML                 =
-- =========================================

local olsfml = lsfml
local otype = type
function _G.type(var)
    local meta = getmetatable(var)
    if meta then
        if meta["__type"] then
            return meta["__type"]
        end
    end
    return otype(var)
end

-- =========================================
-- =            LSFML CLASSES              =
-- =========================================

_G.lsfml = {}
lsfml.clock = {}


-- =======================
-- =       CLOCK         =
-- =======================

function lsfml.clock.create()
    return setmetatable({}, {
        __index = lsfml.clock,
        __type = "clock",
        __ptr = olsfml.clock_create(),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.clock_destroy(meta.__ptr)
        end,
    })
end

function lsfml.clock.restart(clock)
    if type(clock) == "clock" then
        local meta = getmetatable(clock)
        olsfml.clock_restart(meta.__ptr)
    else
        error("Expected clock, got "..type(clock), 2)
    end
end

function lsfml.clock.getEllapsedTime(clock)
    if type(clock) == "clock" then
        local meta = getmetatable(clock)
        return olsfml.clock_getEllapsedTime(meta.__ptr)
    else
        error("Expected clock, got "..type(clock), 2)
    end
end

function lsfml.clock.destroy(clock)
    if type(clock) == "clock" then
        local meta = getmetatable(clock)
        olsfml.clock_destroy(meta.__ptr)
    else
        error("Expected clock, got "..type(clock), 2)
    end
end

function lsfml.clock.copy(clock)
    if type(clock) == "clock" then
        local meta = getmetatable(clock)
        return setmetatable({}, {
            __index = lsfml.clock,
            __type = "clock",
            __ptr = olsfml.clock_copy(meta.__ptr),
            __gc = function(self)
                local meta = getmetatable(self)
                olsfml.clock_destroy(meta.__ptr)
            end,
        })
    else
        error("Expected clock, got "..type(clock), 2)
    end
end

-- =======================
-- =       WINDOW        =
-- =======================



-- =======================
-- =       SHADER        =
-- =======================



-- =======================
-- =      TEXTURE        =
-- =======================



-- =======================
-- =       MUSIC         =
-- =======================



-- =======================
-- =       SPRITE        =
-- =======================



-- =======================
-- =       VERTEX        =
-- =======================



-- =======================
-- =    VERTEXARRAY      =
-- =======================



-- =======================
-- =        TEXT         =
-- =======================



-- =======================
-- =        FONT         =
-- =======================



-- =======================
-- =      KEYBOARD       =
-- =======================



-- =======================
-- =       MOUSE         =
-- =======================


