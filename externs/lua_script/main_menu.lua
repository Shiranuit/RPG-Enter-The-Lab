-- =========================================
-- =                MAIN MENU              =
-- =========================================

assets["button_idle"] = lsfml.texture.createFromFile("./assets/menu/button_idle.png", {0, 0, 421, 171})
assets["button_pressed"] = lsfml.texture.createFromFile("./assets/menu/button_pressed.png", {0, 0, 421, 171})
assets["button_hover"] = lsfml.texture.createFromFile("./assets/menu/button_hover.png", {0, 0, 421, 171})

local play_button = button.create{
    x = 0,
    y = 0,
    width = 421,
    height = 171,
    callback = function(...) 
        local event = {...}
        if event[2] == "drag" and lsfml.mouse.isButtonPressed(1) then
            local x, y = event[1]:getPosition()
            event[1]:setPosition(x + event[5], y + event[6])
        elseif event[2] == "click" then
            if event[3] == 0 then
                window:close()
            end
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
}

function draw()
    window:clear(0, 0, 0)
    play_button:draw()
end

function update()
end

function event(...)
    local evt = {...}
    play_button:event(...)
end