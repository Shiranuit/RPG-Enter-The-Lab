-- =========================================
-- =                BUTTON                 =
-- =========================================

button = {}

function button.create(info)
    check(info, "table", 1)

    return setmetatable({}, {
        __index = button,
        __type = "button",
        __sprite = lsfml.sprite.create(),
        __x = info.x,
        __y = info.y,
        __width = info.width,
        __height = info.height,
        __callback = info.callback,
        __idle = info.idle,
        __press = info.press,
        __hover = info.hover,
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

function button.getSize(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__width, meta.__height
end

function button.getPosition(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    return meta.__width, meta.__height
end

function button.setCallback(self, func)
    check(self, "button", 1)
    check(func, "function", 2)

    local meta = getmetatable(self)
    meta.__callback = func
end

function button.event(self, ...)
    check(self, "button", 1)

    local event = {...}
    local meta = getmetatable(self)
    if event[1] == "mouse_pressed" then
        if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
           event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
            meta.__sprite:setTexture(meta.__press)
            meta.__callback(...)
        end
    elseif event[1] == "mouse_released" then
        if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
            event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
            meta.__sprite:setTexture(meta.__idle)
            meta.__callback(...)
        end
    elseif event[1] == "mouse_move" then
        if event[2] >= meta.__x and event[2] <= meta.__x + meta.__width and
            event[3] >= meta.__y and event[3] <= meta.__y + meta.__height then
            meta.__sprite:setTexture(meta.__hover)
            meta.__callback(...)
        end
    end
end

function button.draw(self)
    check(self, "button", 1)

    local meta = getmetatable(self)
    window:draw(meta.__sprite)
end