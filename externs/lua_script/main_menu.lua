-- =========================================
-- =                MAIN MENU              =
-- =========================================

assets["play_texture"] = lsfml.texture.createFromFile("./assets/menu/button_play.png", {0, 0, 421, 171})
local play_button = lsfml.sprite.create()

play_button:setTexture(assets["play_texture"], false)
play_button:setPosition(0, 0)

function draw()
    window:draw(play_button)
end

function update()

end

function event(...)
    local evt = {...}
    if evt[1] == "mouse_pressed" then
        print(...)
        play_button:setPosition(evt[2], evt[3])
    end
end