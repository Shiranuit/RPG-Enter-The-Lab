-- =========================================
-- =              INVENTORY HUD            =
-- =========================================

local inventory = lsfml.sprite.create()
local slots = {}

local px = 960 - 1337 * 0.75 / 2
local py = 540 - 940 * 0.75 / 2

inventory:scale(0.75, 0.75)
inventory:setPosition(px, py)
inventory:setTexture(assets["inventory_hud"], false)


function load(self)
    for y = 0, 3 do
        for x = 1, 7 do
            slots[#slots + 1] = inv_slot.create(px + (44 + (128 + 24) * x) * 0.75, py + (72 + (144 + 24) * y) * 0.75, 128, 144, 142, 142)
        end
    end
    for y = 0, 3 do
        slots[#slots + 1] = inv_slot.create(px + 44 * 0.75, py + (72 + (144 + 24) * y) * 0.75, 128, 144, 142, 142)
    end
    for x = 3, 4 do
        local sprite = lsfml.sprite.create()

        slots[#slots + 1] = inv_slot.create(px + (44 + (128 + 24) * x) * 0.75, py + (72 + (144 + 24) * 4) * 0.75, 128, 144, 142, 142)
    end
    for i=1, #slots do
        if math.random(1, 2) == 1 then
            slots[i]:setItemStack(itemstack.create(items["item"..math.random(1, 4)], math.random(1, 64)))
        end
    end
end

function open(self)

end

function close(self)

end

function getSlotAt(self, x, y)
    for i=1, #slots do
        if slots[i]:isIn(x, y) then
            return slots[i]
        end
    end
end

function draw(self)
    window:draw(inventory)
    for i=1, #slots do
        slots[i]:draw()
    end
end

function update(self)

end

function event(self, ...)
    local event = {...}
    if event[1] == "key_pressed" and event[2] == controls.inventory then
        if self:isOpen() then
            self:close()
        else
            self:open()
        end
    end
    if self:isOpen() then
        for i=1, #slots do
            slots[i]:event(self, ...)
        end
    end
end