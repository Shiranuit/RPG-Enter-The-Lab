-- =========================================
-- =                MAIN MENU              =
-- =========================================

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


local option_button = button.create{
    x = 0,
    y = 171,
    width = 421,
    height = 171,
    callback = function(...)
        local event = {...}
        if event[2] == "drag" and lsfml.mouse.isButtonPressed(1) then
            local x, y = event[1]:getPosition()
            event[1]:setPosition(x + event[5], y + event[6])
        elseif event[2] == "click" then
            if event[3] == 0 then
                event[1]:setVisible(false)
            end
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    visible = true,
}

function draw()
    window:clear(0, 0, 0)
    play_button:draw()
    option_button:draw()
end

function update()

end

function event(...)
    local evt = {...}
    play_button:event(...)
    option_button:event(...)
    if evt[1] == "key_pressed" and evt[2] == 57 then
        option_button:setVisible(not option_button:isVisible())
    end
end