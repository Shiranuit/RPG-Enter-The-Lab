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

function check(var, Type)
    if type(var) ~= Type then
        error("Expected "..Type..", Got "..type(var), 3)
    end
end

-- =========================================
-- =            LSFML CLASSES              =
-- =========================================

_G.lsfml = {}
lsfml.clock = {}
lsfml.sprite = {}
lsfml.text = {}
lsfml.font = {}
lsfml.keyboard = {}
lsfml.mouse = {}
lsfml.music = {}

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
    check(clock, "clock")

    local meta = getmetatable(clock)
    olsfml.clock_restart(meta.__ptr)
end

function lsfml.clock.getEllapsedTime(clock)
    check(clock, "clock")

    local meta = getmetatable(clock)
    return olsfml.clock_getEllapsedTime(meta.__ptr)
end

function lsfml.clock.destroy(clock)
    check(clock, "clock")

    local meta = getmetatable(clock)
    olsfml.clock_destroy(meta.__ptr)
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

function lsfml.music.createFromFile(string)
    check(string, "string", 1)

    return setmetatable({}, {
        __index = lsfml.music,
        __type = "music",
        __ptr = olsfml.music_createFromFile(string),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.music_destroy(meta.__ptr)
        end,
    })
end

function lsfml.music.destroy(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    olsfml.music_destroy(meta.__ptr)
end

function lsfml.music.getDuration(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    return olsfml.music_getDuration(meta.__ptr)
end

function lsfml.music.getVolume(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    return olsfml.music_getVolume(meta.__ptr)
end

function lsfml.music.pause(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    olsfml.music_pause(meta.__ptr)
end

function lsfml.music.play(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    olsfml.music_play(meta.__ptr)
end

function lsfml.music.stop(music)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    olsfml.music_stop(meta.__ptr)
end

function lsfml.music.setVolume(music, number)
    check(music, "music", 1)
    check(number, "number", 2)
    
    local meta = getmetatable(music)
    local meta_n = getmetatable(number)
    olsfml.music_setVolume(meta.__ptr, meta_n.__ptr)
end

function lsfml.music.setPosition(music, table)
    check(music, "music", 1)
    check(table, "table", 2)
    
    local meta = getmetatable(music)
    local meta_n = getmetatable(number)
    olsfml.music_setPosition(meta.__ptr, meta_n.__ptr)
end

function lsfml.music.getPosition(music, table)
    check(music, "music", 1)
    
    local meta = getmetatable(music)
    return olsfml.music_setPosition(meta.__ptr)
end

function lsfml.music.setLoop(music, boolean)
    check(music, "music", 1)
    check(boolean, "boolean", 2)
    
    local meta = getmetatable(music)
    local meta_b = getmetatable(boolean)
    return olsfml.music_setLoop(meta.__ptr, meta_b.__ptr)
end
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
    check(sprite, "sprite", 1)
    
    local meta = getmetatable(sprite)
    olsfml.sprite_destroy(meta.__ptr)
end

function lsfml.sprite.setTexture(sprite, texture, boolean)
    check(sprite, "sprite", 1)
    check(texture, "texture", 2)
    check(boolean, "boolean", 3)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(texture)
    local meta_b = getmetatable(boolean)
    olsfml.sprite_setTexture(meta.__ptr, meta_t.__ptr, meta_b.__ptr)
end

function lsfml.sprite.getPosition(sprite)
    check(sprite, "sprite", 1)

    local meta = getmetatable(sprite)
    return olsfml.sprite_getPosition(meta.__ptr)

end

function lsfml.sprite.move(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.setPosition(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.setScale(sprite)
    check(sprite, "sprite", 1)

    local meta = getmetatable(sprite)
    olsfml.sprite_setScale(meta.__ptr)
end

function lsfml.sprite.getScale(sprite)
    check(sprite, "sprite", 1)

    local meta = getmetatable(sprite)
    return olsfml.sprite_getScale(meta.__ptr)
end

function lsfml.sprite.setRotation(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.rotate(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.getRotation(sprite)
    check(sprite, "sprite", 1)

    local meta = getmetatable(sprite)
    return olsfml.sprite_getRotation(meta.__ptr)
end

function lsfml.sprite.getOrigin(sprite)
    check(sprite, "sprite", 1)

    local meta = getmetatable(sprite)
    return olsfml.sprite_getOrigin(meta.__ptr)
end

function lsfml.sprite.scale(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.set_origin(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
end

function lsfml.sprite.setTextureRect(sprite, table)
    check(sprite, "sprite", 1)
    check(table, "table", 2)

    local meta = getmetatable(sprite)
    local meta_t = getmetatable(table)
    olsfml.sprite_move(meta.__ptr, meta.__ptr)
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


function lsfml.text.create()
    return setmetatable({}, {
        __index = lsfml.text,
        __type = "text",
        __ptr = olsfml.text_create(),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.text_destroy(meta.__ptr)
        end,
    })
end

function lsfml.text.destroy(text)
    check(text, "text", 1)
    
    local meta = getmetatable(text)
    olsfml.text_destroy(meta.__ptr)
end

function lsfml.text.getPosition(text)
    check(text, "text", 1)

    local meta = getmetatable(text)
    return olsfml.text_getPosition(meta.__ptr)
end

function lsfml.text.setScale(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.setPosition(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.move(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.rotate(text, number)
    check(text, "text", 1)
    check(rotate, "number", 2)

    local meta = getmetatable(text)
    local meta_n = getmetatable(number)
    olsfml.text_setScale(meta.__ptr, meta_n.__ptr)
end

function lsfml.text.scale(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.setRotation(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.getOrigin(text)
    check(text, "text", 1)

    local meta = getmetatable(text)
    return olsfml.text_getOrigin(meta.__ptr)
end

function lsfml.text.getScale(text)
    check(text, "text", 1)

    local meta = getmetatable(text)
    return olsfml.text_getScale(meta.__ptr)
end

function lsfml.text.setOrigin(text, table)
    check(text, "text", 1)
    check(table, "table", 2)

    local meta = getmetatable(text)
    local meta_t = getmetatable(table)
    olsfml.text_setScale(meta.__ptr, meta_t.__ptr)
end

function lsfml.text.getRotation(text)
    check(text, "text", 1)

    local meta = getmetatable(text)
    return olsfml.text_getRotation(meta.__ptr)
end

function lsfml.text.setString(text, string)
    check(text, "text", 1)
    check(string, "string", 2)

    local meta = getmetatable(text)
    local meta_s = getmetatable(string)
    olsfml.text_setScale(meta.__ptr, meta_s.__ptr)
end

function lsfml.text.setFont(text, font)
    check(text, "text", 1)
    check(font, "font", 2)

    local meta = getmetatable(text)
    local meta_f = getmetatable(font)
    olsfml.text_setScale(meta.__ptr, meta_f.__ptr)
end

function lsfml.text.setCharacterSize(text, number)
    check(text, "text", 1)
    check(number, "number", 2)

    local meta = getmetatable(text)
    local meta_n = getmetatable(number)
    olsfml.text_setScale(meta.__ptr, meta_n.__ptr)
end

function lsfml.text.getString(text)
    check(text, "text", 1)

    local meta = getmetatable(text)
    return olsfml.text_getString(meta.__ptr)
end
-- =======================
-- =        FONT         =
-- =======================

function lsfml.font.createFromFile(string)
    check(string, "string", 1)

    return setmetatable({}, {
        __index = lsfml.font,
        __type = "font",
        __ptr = olsfml.font_createFromFile(string),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.font_destroy(meta.__ptr)
        end,
    })
end

function lsfml.font.destroy(font)
    check(font, "font", 1)
    
    local meta = getmetatable(font)
    olsfml.font_destroy(meta.__ptr)
end


-- =======================
-- =      KEYBOARD       =
-- =======================

function lsfml.keyboard.keyPressed(number)
    check(number, "number", 1)
    
    local meta = getmetatable(font)
    return olsfml.keyboard_keyPressed(meta.__ptr)
end

-- =======================
-- =       MOUSE         =
-- =======================

function lsfml.mouse.getPosition(mouse)
    check(mouse, "mouse", 1)
    
    local meta = getmetatable(mouse)
    return olsfml.mouse_getPosition(meta.__ptr)
end

function lsfml.mouse.setPosition(mouse, x, y)
    check(mouse, "mouse", 1)
    check(x, "number", 2)
    check(y, "number", 3)
    
    local meta = getmetatable(mouse)
    local meta_x = getmetatable(x)
    local meta_y = getmetatable(y)
    olsfml.mouse_setPosition(meta.__ptr, meta_x.__ptr, meta_y.__ptr)
end

function lsfml.mouse.isButtonPressed(mouse, number)
    check(mouse, "mouse", 1)
    check(number, "number", 2)
    
    local meta = getmetatable(mouse)
    local meta_n = getmetatable(number)
    return olsfml.mouse_isButtonPressed(meta.__ptr, meta_n.__ptr)
end