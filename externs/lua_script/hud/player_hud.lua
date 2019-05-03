-- =========================================
-- =               PLAYER HUD              =
-- =========================================

local health_bar = lsfml.sprite.create()
local stamina_bar = lsfml.sprite.create()
local empty_bar1 = lsfml.sprite.create()
local empty_bar2 = lsfml.sprite.create()
local sort_bar = lsfml.sprite.create()
local other_item = lsfml.sprite.create()
local empty_bar3 = lsfml.sprite.create()
local mana_bar = lsfml.sprite.create()
local hand1 = lsfml.sprite.create()
local hand2 = lsfml.sprite.create()

health_bar:setPosition(0, 0)
stamina_bar:setPosition(0, 82)
mana_bar:setPosition(0, 164)
empty_bar1:setPosition(0, 0)
empty_bar2:setPosition(0, 82)
empty_bar3:setPosition(0, 164)
sort_bar:setPosition(705, 920-31)
other_item:setPosition(1250, 900)
hand1:setPosition(1250 + 24, 900 + 24)
hand2:setPosition(1250 + 241 * 0.5 + 24, 900 + 24)

health_bar:setTexture(assets["hud_health"], false)
stamina_bar:setTexture(assets["hud_stamina"], false)
mana_bar:setTexture(assets["hud_mana"], false)
empty_bar1:setTexture(assets["hud_empty_health_bar"], false)
empty_bar2:setTexture(assets["hud_empty_stamina_bar"], false)
empty_bar3:setTexture(assets["hud_empty_mana_bar"], false)
sort_bar:setTexture(assets["sort_bar"], false)
other_item:setTexture(assets["other_item"], false)

health_bar:setScale(0.25, 0.25)
mana_bar:setScale(0.25, 0.25)
stamina_bar:setScale(0.25, 0.25)
empty_bar1:setScale(0.25, 0.25)
empty_bar2:setScale(0.25, 0.25)
empty_bar3:setScale(0.25, 0.25)
sort_bar:setScale(0.5, 0.5)
other_item:setScale(0.5, 0.5)

function load(self)

end

function open(self)
    all_sort:open()
    bosshealth:open()
    temp_hud:open()
end

function close(self)
    all_sort:close()
    bosshealth:close()
    temp_hud:close()
end

function draw(self)
    window:draw(empty_bar1)
    window:draw(empty_bar2)
    window:draw(empty_bar3)
    window:draw(health_bar)
    window:draw(mana_bar)
    window:draw(stamina_bar)
    window:draw(sort_bar)
    window:draw(other_item)
    window:draw(hand1)
    window:draw(hand2)
end

function update(self)
    health_bar:setTextureRect(0, 0, math.floor(player.getHealth() / player.getMaximumHealth() * 980), 328)
    stamina_bar:setTextureRect(0, 0, math.floor(player.getStamina() / player.getMaximumStamina() * 980), 328)
    mana_bar:setTextureRect(0, 0, math.floor(player.getMana() / player.getMaximumMana() * 980), 328)
    local item1 = player.getInventory():getItemInSlot(33)
    local item2 = player.getInventory():getItemInSlot(34)
    if item1 and item1:getStackSize() > 0 then
        hand1:setTexture(item1:getItem():getTexture(), false)
        hand1:setTextureRect(0, 0, 64, 64)
    else
        hand1:setTextureRect(0, 0, 0, 0)
    end
    if item2 and item2:getStackSize() > 0 then
        hand2:setTexture(item2:getItem():getTexture(), false)
        hand2:setTextureRect(0, 0, 64, 64)
    else
        hand2:setTextureRect(0, 0, 0, 0)
    end
end

function event(self, e)

end
