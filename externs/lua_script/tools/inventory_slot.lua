-- =========================================
-- =            INVENTORY SLOT             =
-- =========================================

inv_slot = {}

function inv_slot.create(x, y, w, h, tx, ty)
    check(x, "number", 1)
    check(y, "number", 2)
    check(w, "number", 3)
    check(h, "number", 4)

    local sprite = lsfml.sprite.create()
    local text = lsfml.text.create()
    text:setFont(assets["fsys"])
    text:setCharacterSize(48)
    text:setString("")
    text:setPosition(x + 78 * 0.75, y + 88 * 0.75)
    sprite:setPosition(x, y)
    sprite:scale(w / tx * 0.75, h / ty * 0.75)
    return setmetatable({}, {
        __index = inv_slot,
        __type = "inv_slot",
        __x = x,
        __y = y,
        __w = w,
        __h = h,
        __tx = tx,
        __ty = ty,
        __item = nil,
        __sprite = sprite,
        __text = text,
        __status = "released",
    })
end

function inv_slot.setItemStack(self, item)
    check(self, "inv_slot", 1)
    cassert(type(item) == "nil" or type(item) == "itemstack", "item must be a itemstack")

    local meta = getmetatable(self)
    if item and item:getStackSize() > 0 then
        meta.__sprite:setTextureRect(0, 0, meta.__tx, meta.__ty)
        meta.__sprite:setTexture(item:getItem():getTexture(), false)
    else
        meta.__sprite:setTextureRect(0, 0, 0, 0)
    end
    if item and item:getStackSize() > 0 then
        local count = string.rep("0", 2 - #tostring(item:getStackSize())) .. tostring(item:getStackSize())
        meta.__text:setString(count)
    else
        meta.__text:setString("")
    end
    meta.__item = item
end

function inv_slot.getItemStack(self)
    check(self, "inv_slot", 1)

    local meta = getmetatable(self)
    return meta.__item
end

function inv_slot.isIn(self, x, y)
    check(self, "inv_slot", 1)
    check(x, "number", 2)
    check(y, "number", 3)

    local meta = getmetatable(self)
    return x > meta.__x and x < meta.__x + meta.__w and y > meta.__y and y < meta.__y + meta.__h
end

function inv_slot.draw(self)
    check(self, "inv_slot", 1)

    local meta = getmetatable(self)
    if meta.__sprite and meta.__item and meta.__item:getStackSize() > 0 then
        window:draw(meta.__sprite)
        window:draw(meta.__text)
    end
end

local px = 0
local py = 0
local vx = 0
local vy = 0
function inv_slot.event(self, inventory, ...)
    local event = {...}
    local meta = getmetatable(self)
    if event[1] == "mouse_pressed" and meta.__status ~= "pressed" and self:isIn(event[2], event[3]) then
        meta.__status = "pressed"
        px = event[2]
        py = event[3]
        vx = meta.__x
        vy = meta.__y
    elseif event[1] == "mouse_move" and meta.__status == "pressed" then
        local nx = event[2] - px
        local ny = event[3] - py
        vx = vx + nx
        vy = vy + ny
        meta.__sprite:setPosition(vx, vy)
        meta.__text:setPosition(vx + 78 * 0.75, vy + 88 * 0.75)
        px = event[2]
        py = event[3]
    elseif event[1] == "mouse_released" and meta.__status ~= "released" then
        meta.__status = "released"
        meta.__sprite:setPosition(meta.__x, meta.__y)
        meta.__text:setPosition(meta.__x + 78 * 0.75, meta.__y + 88 * 0.75)
        local slot = inventory:getSlotAt(event[2], event[3])
        if slot then
            local meta_s = getmetatable(slot)
            if meta_s.__x ~= meta.__x or meta_s.__y ~= meta.__y then
                local item1 = self:getItemStack()
                local item2 = slot:getItemStack()
                if item1 and item2 and item1 == item2 then
                    item1:pack(item2)
                    slot:setItemStack(item1)
                    self:setItemStack(item2)
                else
                    slot:setItemStack(item1)
                    self:setItemStack(item2)
                end
            end
        end
    end
end