-- =========================================
-- =               description               =
-- =========================================

description = {}

function description.create(texture, font)
    check(texture, "texture", 1)
    check(font, "font", 2)

    local text = lsfml.text.create()
    text:setFont(font)
    text:setCharacterSize(40)
    local sprite = lsfml.sprite.create()
    local size = {texture:getSize()}
    sprite:setTexture(texture, false)
    return setmetatable({}, {
        __type = "description",
        __index = function(self, key)
            check(self, "description", 1)
            local meta = getmetatable(self)
            if description[key] then
                return description[key]
            elseif sprite[key] then
                return function (self, ...)
                    return sprite[key](meta.__sprite, ...)
                end
            elseif text[key] then
                return function (self, ...)
                    return text[key](meta.__text, ...)
                end
            end
        end,
        __sprite = sprite,
        __text = text,
        __visible = true,
    })
end

function description.setPosition(self, x, y)
    check(self, "description", 1)
    check(x, "number", 2)
    check(y, "number", 3)

    local meta = getmetatable(self)
    meta.__sprite:setPosition(x, y)
    meta.__text:setPosition(x + 15, y)
end

function description.show(self)
    check(self, "description", 1)

    local meta = getmetatable(self)
    meta.__visible = true
end

function description.hide(self)
    check(self, "description", 1)

    local meta = getmetatable(self)
    meta.__visible = false
end

function description.draw(self)
    check(self, "description", 1)

    local meta = getmetatable(self)
    if meta.__visible then
        window:draw(meta.__sprite)
        window:draw(meta.__text)
    end
end