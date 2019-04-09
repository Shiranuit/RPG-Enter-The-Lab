-- =========================================
-- =                MAIN MENU              =
-- =========================================

assets["button_idle"] = lsfml.texture.createFromFile("./assets/menu/button_idle.png", {0, 0, 421, 171})
assets["button_pressed"] = lsfml.texture.createFromFile("./assets/menu/button_pressed.png", {0, 0, 421, 171})
assets["button_hover"] = lsfml.texture.createFromFile("./assets/menu/button_hover.png", {0, 0, 421, 171})
local play_button = lsfml.sprite.create()

play_button:setTexture(assets["button_idle"], false)
play_button:setPosition(0, 0)

function draw()
    window:clear(0, 0, 0)
    window:draw(play_button)
end

function update()

end

function event(...)
    local evt = {...}
    if evt[1] == "mouse_pressed" then
        play_button:setTexture(assets["button_pressed"], false)
    end
end