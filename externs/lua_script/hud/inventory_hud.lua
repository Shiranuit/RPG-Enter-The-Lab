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
            slots[#slots + 1] = inv_slot.create(px + (44 + (128 + 24) * x) * 0.75, py + (72 + (144 + 24) * y) * 0.75, 128, 144, 64, 64)
        end
    end
    slots[#slots + 1] = inv_slot.create(px + 44 * 0.75, py + (72 + (144 + 24) * 0) * 0.75, 128, 144, 64, 64, {type="equipement", subtype="helmet"})
    slots[#slots + 1] = inv_slot.create(px + 44 * 0.75, py + (72 + (144 + 24) * 1) * 0.75, 128, 144, 64, 64, {type="equipement", subtype="chestplate"})
    slots[#slots + 1] = inv_slot.create(px + 44 * 0.75, py + (72 + (144 + 24) * 2) * 0.75, 128, 144, 64, 64, {type="equipement", subtype="pant"})
    slots[#slots + 1] = inv_slot.create(px + 44 * 0.75, py + (72 + (144 + 24) * 3) * 0.75, 128, 144, 64, 64, {type="equipement", subtype="boot"})
    for x = 3, 4 do
        local sprite = lsfml.sprite.create()

        slots[#slots + 1] = inv_slot.create(px + (44 + (128 + 24) * x) * 0.75, py + (72 + (144 + 24) * 4) * 0.75, 128, 144, 64, 64)
    end
    local dt = {}
    for k, v in pairs(items) do
        dt[#dt + 1] = k
    end
    for i=1, #slots - 6 do
        if math.random(1, 2) == 1 then
            local item = items[dt[math.random(1, #dt)]]
            slots[i]:setItemStack(itemstack.create(item, math.random(1, item:getMaxStackSize())))
        end
    end
end

function open(self)

end

function close(self)

end

function setItemInSlot(self, slot, itemstack)
    check(slot, "number", 2)
    cassert(type(itemstack) == "nil" and type(itemstack) == "itemstack", "itemstack must be an itemstack", 3)

    if slot > 0 and slot <= #slots then
        slots[slot]:setItemStack(itemstack)
    else
        error("slot must be between 1 and "..#slots, 2)
    end
end

function getItemInSlot(self, slot)
    check(self, "hud", 1)
    check(slot, "number", 2)

    if slot > 0 and slot <= #slots then
        return slots[slot]:getItemStack()
    else
        error("slot must be between 1 and "..#slots, 2)
    end
end

function insertItemStack(self, itemstack)
    if itemstack then
        local found = false
        for i=1, #slots do
            if (slots[i]:getItemStack() and slots[i]:getItemStack() == itemstack) and slots[i]:itemMeetRequirement(itemstack) then
                slots[i]:getItemStack():pack(itemstack)
                slots[i]:setItemStack(slots[i]:getItemStack())
                found = true
            end
        end
        for i=1, #slots do
            if slots[i]:isEmpty() and slots[i]:itemMeetRequirement(itemstack) then
                slots[i]:setItemStack(itemstack)
                return true
            end
        end
        return found
    end
    return false
end

function isIn(self, x, y)
    return x > px and x < px + 1337 * 0.75 and y > py and y < py + 940 * 0.75
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

function event(self, e)
    local event = e:getEvent()
    if event[1] == "key_pressed" and event[2] == controls.inventory then
        if self:isOpen() then
            self:close()
        else
            self:open()
        end
        e:setCanceled(true)
    end
    if self:isOpen() then
        for i=1, #slots do
            slots[i]:event(self, e)
            if e:isCanceled() then
                break
            end
        end
    end
end