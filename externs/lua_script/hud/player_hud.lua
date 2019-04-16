-- =========================================
-- =               PLAYER HUD              =
-- =========================================

local health_bar = lsfml.sprite.create()
local stamina_bar = lsfml.sprite.create()
local empty_bar1 = lsfml.sprite.create()
local empty_bar2 = lsfml.sprite.create()
local sort_bar = lsfml.sprite.create()
local other_item = lsfml.sprite.create()

health_bar:setPosition(0, 0)
stamina_bar:setPosition(0, 82)
empty_bar1:setPosition(0, 0)
empty_bar2:setPosition(0, 82)
sort_bar:setPosition(705, 900)
other_item:setPosition(1250, 880)

health_bar:setTexture(assets["hud_health"], false)
stamina_bar:setTexture(assets["hud_stamina"], false)
empty_bar1:setTexture(assets["hud_empty_health_bar"], false)
empty_bar2:setTexture(assets["hud_empty_stamina_bar"], false)
sort_bar:setTexture(assets["sort_bar"], false)
other_item:setTexture(assets["other_item"], false)

health_bar:setScale(0.25, 0.25)
stamina_bar:setScale(0.25, 0.25)
empty_bar1:setScale(0.25, 0.25)
empty_bar2:setScale(0.25, 0.25)
sort_bar:setScale(0.5, 0.5)
other_item:setScale(0.5, 0.5)

function load(self)

end

function open(self)
    all_sort:open()
end

function close(self)
    all_sort:close()
end

function draw(self)
    window:draw(empty_bar1)
    window:draw(empty_bar2)
    window:draw(health_bar)
    window:draw(stamina_bar)
    window:draw(sort_bar)
    window:draw(other_item)
end

function update(self)
    health_bar:setTextureRect(0, 0, math.floor(player:getHealth() / player:getMaximumHealth() * 980), 328)
    stamina_bar:setTextureRect(0, 0, math.floor(player:getStamina() / player:getMaximumStamina() * 980), 328)
end

function event(self, ...)

end
