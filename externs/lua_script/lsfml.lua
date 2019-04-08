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

function check(var, Type, index)
    if type(var) ~= Type then
        error("Argument #"..index.." Expected "..Type..", Got "..type(var), 3)
    end
end

-- =========================================
-- =            LSFML CLASSES              =
-- =========================================

_G.lsfml = {}
lsfml.clock = {}
lsfml.window = {}
lsfml.shader = {}
lsfml.texture = {}

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
    check(clock, "clock", 1)

    local meta = getmetatable(clock)
    olsfml.clock_restart(meta.__ptr)
end

function lsfml.clock.getEllapsedTime(clock)
    check(clock, "clock", 1)

    local meta = getmetatable(clock)
    return olsfml.clock_getEllapsedTime(meta.__ptr)
end

function lsfml.clock.destroy(clock)
    check(clock, "clock", 1)

    local meta = getmetatable(clock)
    olsfml.clock_destroy(meta.__ptr)
end

function lsfml.clock.copy(clock)
    check(clock, "clock", 1)

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
end

-- =======================
-- =       WINDOW        =
-- =======================

function lsfml.window.clear(window, r, g, b)
    check(window, "window", 1)
    check(r, "number", 2)
    check(g, "number", 3)
    check(b, "number", 4)

    local meta = getmetatable(window)
    olsfml.window_clear(meta.__ptr)
end

function lsfml.window.setMouseCursorVisible(window, visible)
    check(window, "window", 1)
    check(visible, "boolean", 2)

    local meta = getmetatable(window)
    olsfml.window_setMouseCursorVisible(meta.__ptr, visible)
end

function lsfml.window.close(window)
    check(window, "window", 1)

    local meta = getmetatable(window)
    olsfml.window_close(meta.__ptr)
end

function lsfml.window.draw(window, shape, renderstate)
    check(window, "window", 1)
    if type(renderstate) ~= "renderState" and type(renderstate) ~= "nil" then
        error("Argument #3 Expected [renderState, nil], Got "..type(renderstate), 2)
    end

    local meta = getmetatable(window)
    local render_meta = getmetatable(renderstate)
    if type(shape) == "circleShape" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawConvexShape(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "convexShape" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawConvexShape(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "vertexArray" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawVertexArray(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "shape" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawShape(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "sprite" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawSprite(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "text" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawText(window, shape_meta.__ptr, render_meta.__ptr)
    elseif type(shape) == "rectangleShape" then
        local shape_meta = getmetatable(shape)
        olsfml.window_drawRectangleShape(window, shape_meta.__ptr, render_meta.__ptr)
    else
        error("Argument #2 Expected [circleShape, convexShape, vertexArray, shape, sprite, text, rectangleShape], Got "..type(shape), 2)
    end
end

function lsfml.window.setFramerateLimit(window, framerate)
    check(window, "window", 1)
    check(framerate, "number", 2)

    local meta = getmetatable(window)
    olsfml.window_setFramerateLimit(meta.__ptr, framerate)
end

function lsfml.window.setMouseCursorGrabbed(window, grabbed)
    check(window, "window", 1)
    check(framerate, "boolean", 2)

    local meta = getmetatable(window)
    olsfml.window_setMouseCursorGrabbed(meta.__ptr, grabbed)
end

function lsfml.window.getSize(window)
    check(window, "window", 1)

    local meta = getmetatable(window)
    return olsfml.window_getSize(meta.__ptr)
end

-- =======================
-- =       SHADER        =
-- =======================

function lsfml.shader.bind(shader)
    check(shader, "shader", 1)

    local meta = getmetatable(window)
    return olsfml.shader_bind(meta.__ptr)
end

function lsfml.shader.createFromFile(vertexShader, fragmentShader)
    check(vertexShader, "string", 1)
    check(fragmentShader, "string", 2)

    return setmetatable({}, {
        __index = lsfml.shader,
        __type = "shader",
        __ptr = olsfml.shader_createFromFile(vertexShader, fragmentShader),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.shader_destroy(meta.__ptr)
        end,
    })
end

function lsfml.shader.createFromMemory(vertexShader, fragmentShader)
    check(vertexShader, "string", 1)
    check(fragmentShader, "string", 2)

    return setmetatable({}, {
        __index = lsfml.shader,
        __type = "shader",
        __ptr = olsfml.shader_createFromMemory(vertexShader, fragmentShader),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.shader_destroy(meta.__ptr)
        end,
    })
end

function lsfml.shader.destroy(shader)
    check(shader, "shader", 1)

    local meta = getmetatable(shader)
    olsfml.shader_destroy(meta.__ptr)
end

function lsfml.shader.isAvailable()
    return olsfml.shader_isAvailable()
end

function lsfml.shader.setColorParameter(shader, name, color)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(color, "table", 3)

    local ctable = {}
    for i=1, 4 do
        ctable[i] = tonumber(color[i]) or 255
    end
    local meta = getmetatable(shader)
    olsfml.shader_setColorParameter(meta.__ptr, name, ctable)
end

function lsfml.shader.setTextureParameter(shader, name, texture)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(texture, "texture", 3)

    local meta = getmetatable(shader)
    local meta_t = getmetatable(texture)
    olsfml.shader_setTextureParameter(meta.__ptr, name, meta_t.__ptr)
end

function lsfml.shader.setFloatParameter(shader, name, val)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(val, "number", 3)

    local meta = getmetatable(shader)
    olsfml.shader_setFloatParameter(meta.__ptr, name, val)
end

function lsfml.shader.setFloat2Parameter(shader, name, x, y)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(x, "number", 3)
    check(y, "number", 4)

    local meta = getmetatable(shader)
    olsfml.shader_setFloat2Parameter(meta.__ptr, name, x, y)
end

function lsfml.shader.setFloat3Parameter(shader, name, x, y, z)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(x, "number", 3)
    check(y, "number", 4)
    check(z, "number", 5)

    local meta = getmetatable(shader)
    olsfml.shader_setFloat3Parameter(meta.__ptr, name, x, y, z)
end

function lsfml.shader.setFloat4Parameter(shader, name, x, y, z, w)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(x, "number", 3)
    check(y, "number", 4)
    check(z, "number", 5)
    check(w, "number", 6)

    local meta = getmetatable(shader)
    olsfml.shader_setFloat2Parameter(meta.__ptr, name, x, y, z, w)
end

function lsfml.shader.setCurrentTextureParameter(shader, name)
    check(shader, "shader", 1)
    check(name, "string", 2)

    local meta = getmetatable(shader)
    olsfml.shader_setCurrentTextureParameter(meta.__ptr, name)
end

function lsfml.shader.setTransformParameter(shader, name, transform)
    check(shader, "shader", 1)
    check(name, "string", 2)
    check(transform, "transform", 3)

    local meta = getmetatable(shader)
    local meta_t = getmetatable(transform)
    olsfml.shader_setTransformParameter(meta.__ptr, name, meta_t.__ptr)
end

-- =======================
-- =      TEXTURE        =
-- =======================

function lsfml.texture.bind(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(shader)
    olsfml.texture_bind(meta.__ptr)
end

function lsfml.texture.copy(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(texture)
    return setmetatable({}, {
        __index = lsfml.texture,
        __type = "texture",
        __ptr = olsfml.texture_copy(meta.__ptr),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.texture_destroy(meta.__ptr)
        end,
    })
end

function lsfml.texture.copyFromImage(image)
    check(image, "image", 1)

    local meta = getmetatable(image)
    return setmetatable({}, {
        __index = lsfml.texture,
        __type = "texture",
        __ptr = olsfml.texture_copyFromImage(meta.__ptr),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.texture_destroy(meta.__ptr)
        end,
    })
end

function lsfml.texture.create(width, height)
    check(width, "number", 1)
    check(height, "number", 2)

    return setmetatable({}, {
        __index = lsfml.texture,
        __type = "texture",
        __ptr = olsfml.texture_create(width, height),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.texture_destroy(meta.__ptr)
        end,
    })
end

function lsfml.texture.createFromFile(filename, rect)
    check(filename, "string", 1)
    check(rect, "table", 2)

    return setmetatable({}, {
        __index = lsfml.texture,
        __type = "texture",
        __ptr = olsfml.texture_createFromFile(filename, rect),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.texture_destroy(meta.__ptr)
        end,
    })
end

function lsfml.texture.createFromImage(image, rect)
    check(image, "image", 1)
    check(rect, "table", 2)

    local meta = getmetatable(image)
    return setmetatable({}, {
        __index = lsfml.texture,
        __type = "texture",
        __ptr = olsfml.texture_createFromImage(meta.__ptr, rect),
        __gc = function(self)
            local meta = getmetatable(self)
            olsfml.texture_destroy(meta.__ptr)
        end,
    })
end

function lsfml.texture.destroy(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(texture)
    olsfml.texture_destroy(meta.__ptr)
end

function lsfml.texture.getMaximumSize()
    return olsfml.texture_getMaximumSize()
end

function lsfml.texture.getSize(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(texture)
    return olsfml.texture_getSize(meta.__ptr)
end

function lsfml.texture.isRepeated(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(texture)
    return olsfml.texture_isRepeated(meta.__ptr)
end

function lsfml.texture.isSmooth(texture)
    check(texture, "texture", 1)

    local meta = getmetatable(texture)
    return olsfml.texture_isSmooth(meta.__ptr)
end

function lsfml.texture.setSmooth(texture, bool)
    check(texture, "texture", 1)
    check(bool, "boolean", 2)

    local meta = getmetatable(texture)
    olsfml.texture_setSmooth(meta.__ptr, bool)
end

function lsfml.texture.setRepeated(texture, bool)
    check(texture, "texture", 1)
    check(bool, "boolean", 2)

    local meta = getmetatable(texture)
    olsfml.texture_setRepeated(meta.__ptr, bool)
end

function lsfml.texture.updateFromImage(texture, image)
    check(texture, "texture", 1)
    check(image, "image", 2)

    local meta = getmetatable(texture)
    local meta_i = getmetatable(image)
    olsfml.texture_updateFromImage(meta.__ptr, meta_i.__ptr)
end

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


