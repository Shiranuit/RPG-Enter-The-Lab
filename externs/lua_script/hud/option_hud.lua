-- =========================================
-- =                MAIN MENU              =
-- =========================================

local play_button = button.create{
    x = 750,
    y = 1080 / 2 - 170 - 170 / 2,
    width = 420,
    height = 170,
    callback = function(self, ...)
        local event = {...}
        if event[1] == "click" then
            option_menu:close()
        elseif event[1] == "enter" then
            assets["button_hover_sfx"]:play()
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    text = "Resume",
    csize = 100,
}

local option_button = button.create{
    x = 750,
    y = 1080 / 2 - 170 / 2,
    width = 420,
    height = 170,
    callback = function(self, ...)
        local event = {...}
        if event[1] == "click" then
            setScene("options_menu")
        elseif event[1] == "enter" then
            assets["button_hover_sfx"]:play()
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    text = "Options",
    csize = 100,
}

local exit_button = button.create{
    x = 750,
    y = 1080 / 2 + 170 / 2,
    width = 420,
    height = 170,
    callback = function(self, ...)
        local event = {...}
        if event[1] == "click" then
            window:close()
        elseif event[1] == "enter" then
            assets["button_hover_sfx"]:play()
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    text = "Exit",
    csize = 100,
}

function load()
    exit_button:setStatus("released")
    play_button:setStatus("released")
    option_button:setStatus("released")
end

function unload()

end

function open()
    world.updateDisable()
end

function close()
    world.updateEnable()
end

function draw()
    play_button:draw()
    option_button:draw()
    exit_button:draw()
end

function update()

end

function event(self, e)
    if self:isOpen() then
        play_button:event(e)
        option_button:event(e)
        exit_button:event(e)
    end
end