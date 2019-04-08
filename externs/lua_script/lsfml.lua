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
lsfml.sprite = {}
lsfml.text = {}

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

function lsfml.sprite.create()
    return setmetatable({}, {
        __index = lsfml.sprite,
        __type = "sprite",
        __ptr = olsfml.sprite_create(),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.sprite_destroy(meta.__ptr)
        end,
    })
end

function lsfml.sprite.destroy(sprite)
    check(sprite, "sprite", 1);
    
    local meta = getmetatable(sprite)
    olsfml.sprite_destroy(meta.__ptr)
end

function lsfml.sprite.sprite_setTexture(sprite, texture, boolean)
    check(sprite, "sprite", 1);
    check(texture, "texture", 2);
    check(boolean, "boolean", 3);

    local meta = getmetatable(sprite)
    olsfml.sprite_setTexture(meta.__ptr)
end

function lsfml.sprite.sprite_getPosition(sprite)
    check(sprite, "sprite", 1);

    local meta = getmetatable(sprite)
    return olsfml.sprite_getPosition(meta.__ptr)

end

function lsfml.sprite.sprite_move(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_move(meta.__ptr)
end

function lsfml.sprite.sprite_setPosition(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_setPosition(meta.__ptr)
end

function lsfml.sprite.sprite_setScale(sprite)
    check(sprite, "sprite", 1);

    local meta = getmetatable(sprite)
    olsfml.sprite_setScale(meta.__ptr)
end

function lsfml.sprite.sprite_getScale(sprite)
    check(sprite, "sprite", 1);

    local meta = getmetatable(sprite)
    return olsfml.sprite_getScale(meta.__ptr)
end

function lsfml.sprite.sprite_setRotation(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_setRotation(meta.__ptr)
end

function lsfml.sprite.sprite_rotate(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_rotate(meta.__ptr)
end

function lsfml.sprite.sprite_getRotation(sprite)
    check(sprite, "sprite", 1);

    local meta = getmetatable(sprite)
    return olsfml.sprite_getRotation(meta.__ptr)
end

function lsfml.sprite.sprite_getOrigin(sprite)
    check(sprite, "sprite", 1);

    local meta = getmetatable(sprite)
    return olsfml.sprite_getOrigin(meta.__ptr)
end

function lsfml.sprite.sprite_scale(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_scale(meta.__ptr)
end

function lsfml.sprite.sprite_set_origin(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_set_origin(meta.__ptr)
end

function lsfml.sprite.sprite_setTextureRect(sprite, table)
    check(sprite, "sprite", 1);
    check(table, "table", 2);

    local meta = getmetatable(sprite)
    olsfml.sprite_setTextureRect(meta.__ptr)
end

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


