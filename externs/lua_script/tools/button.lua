-- =========================================
-- =                BUTTON                 =
-- =========================================

button = {}

local function cassert(cond, msg, lvl)
    if not cond then
        error(msg, lvl)
    end
end

function button.create(info)
    check(info, "table", 1)
    cassert(type(info.x) == "number", "x must be a number", 3)
    cassert(type(info.y) == "number", "y must be a number", 3)
    cassert(type(info.width) == "number", "width must be a number", 3)
    cassert(type(info.height) == "number", "height must be a number", 3)
    cassert(type(info.callback) == "nil" or type(info.callback) == "function", "callback must be a function", 1)
    cassert(type(info.idle) == "texture", "idle must be a texture", 3)
    cassert(type(info.hover) == "texture", "hover must be a texture", 3)
    cassert(type(info.press) == "texture", "press must be a texture", 3)
    cassert(type(info.visible) == "nil" or type(info.visible) == "boolean", "visible must be a boolean", 1)

    local sprite = lsfml.sprite.create()
    sprite:setTexture(info.idle, false)
    sprite:setPosition(info.x, info.y)
    return setmetatable({}, {
        __index = button,
        __type = "button",
        __sprite = sprite,
        __x = info.x,
        __y = info.y,
        __mx = 0,
        __my = 0,
        __width = info.width,
        __height = info.height,
        __callback = info.callback or function() end,
        __idle = info.idle,
        __press = info.press,
        __hover = info.hover,
        __status = "released",
        __visible = type(info.visible) == "nil" and true or info.visible,
        __text = info.text
    })
end

function button.setPosition(self, x, y)
    check(self, "button", 1)
    check(x, "number", 2)
    check(y, "number", 3)

    local meta = getmetatable(self)
    meta.__x = x
    meta.__y = y
    meta.__sprite:setPosition(x, y)
end

function button.setSize(self, width, height)
    check(self, "button", 1)
    check(width, "number", 2)
    check(height, "number", 3)

    local meta = getmetatable(self)
    meta.__width = width
    meta.__height = height
end

function button.getStatus(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__status
end

function button.getSize(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__width, meta.__height
end

function button.getPosition(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__x, meta.__y
end

function button.setCallback(self, func)
    check(self, "button", 1)
    check(func, "function", 2)

    local meta = getmetatable(self)
    meta.__callback = func
end

function button.isVisible(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__visible
end

function button.setVisible(self, boolean)
    check(self, "button", 1)
    check(boolean, "boolean", 2)

    local meta = getmetatable(self)
    meta.__visible = boolean
end


function button.event(self, ...)
    check(self, "button", 1)

    local event = {...}
    local meta = getmetatable(self)
    if meta.__visible then
        if event[1] == "mouse_pressed" then
            if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
            event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
                meta.__sprite:setTexture(meta.__press, false)
                meta.__callback(self, "press", event[4], event[2], event[3])
                meta.__status = "pressed"
                meta.__mx = event[2]
                meta.__my = event[3]
            end
        elseif event[1] == "mouse_released" then
            if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
                event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
                meta.__sprite:setTexture(meta.__hover, false)
                if meta.__status == "pressed" then
                    meta.__callback(self, "click", event[4], event[2], event[3])
                    meta.__status = "released"
                    meta.__callback(self, "released", event[4], event[2], event[3])
                end
            else
                if meta.__status == "pressed" then
                    meta.__sprite:setTexture(meta.__idle, false)
                    meta.__callback(self, "release", event[4], event[2], event[3])
                    meta.__status = "released"
                end
            end
        elseif event[1] == "mouse_move" then
            if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
                event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
                meta.__callback(self, "hover", event[2], event[3])
                if meta.__status == "released" then
                    meta.__status = "hover"
                    meta.__sprite:setTexture(meta.__hover, false)
                    meta.__callback(self, "enter")
                end
                if meta.__status == "pressed" then
                    meta.__callback(self, "drag", event[2], event[3], event[2] - meta.__mx, event[3] - meta.__my)
                    meta.__mx = event[2]
                    meta.__my = event[3]
                end
            else
                if meta.__status == "hover" then
                    meta.__sprite:setTexture(meta.__idle, false)
                    meta.__callback(self, "exit")
                    meta.__status = "released"
                end
            end
        end
    end
end

function button.draw(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    if meta.__visible then
        window:draw(meta.__sprite)
    end
end