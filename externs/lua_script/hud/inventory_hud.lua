-- =========================================
-- =              INVENTORY HUD            =
-- =========================================

local inventory = lsfml.sprite.create()

inventory:scale(0.75, 0.75)
inventory:setPosition(960 - 1337 * 0.75 / 2, 540 - 940 * 0.75 / 2)
inventory:setTexture(assets["inventory_hud"], false)


function load(self)

end

function open(self)

end

function close(self)

end

function draw(self)
    window:draw(inventory)
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
end