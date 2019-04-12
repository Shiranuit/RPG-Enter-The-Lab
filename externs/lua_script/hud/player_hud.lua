-- =========================================
-- =               PLAYER HUD              =
-- =========================================

health_bar = lsfml.sprite.create()
stamina_bar = lsfml.sprite.create()
empty_bar1 = lsfml.sprite.create()
empty_bar2 = lsfml.sprite.create()

health_bar:setPosition(0, 0)
stamina_bar:setPosition(0, 82)
empty_bar1:setPosition(0, 0)
empty_bar2:setPosition(0, 82)

health_bar:setTexture(assets["hud_health"], false)
stamina_bar:setTexture(assets["hud_stamina"], false)
empty_bar1:setTexture(assets["hud_empty_health_bar"], false)
empty_bar2:setTexture(assets["hud_empty_stamina_bar"], false)

health_bar:setScale(0.25, 0.25)
stamina_bar:setScale(0.25, 0.25)
empty_bar1:setScale(0.25, 0.25)
empty_bar2:setScale(0.25, 0.25)

function load(self)

end

function open(self)

end

function close(self)

end

function draw(self)
    window:draw(empty_bar1)
    window:draw(empty_bar2)
    window:draw(health_bar)
    window:draw(stamina_bar)
end

function update(self)
    health_bar:setTextureRect(0, 0, math.floor(player:getHealth() / player:getMaximumHealth() * 980), 328)
end

function event(self, ...)

end
