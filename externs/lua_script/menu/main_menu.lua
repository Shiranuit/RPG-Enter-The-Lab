-- =========================================
-- =                MAIN MENU              =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["background"], false)

local play_button = button.create{
    x = 750,
    y = 1080 / 2 - 170 - 170 / 2,
    width = 420,
    height = 170,
    callback = function(...)
        local event = {...}
        if event[2] == "click" then
            setScene("test_player")
        elseif event[2] == "enter" then
            assets["button_hover_sfx"]:play()
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    text = "Play",
    csize = 100,
}

local option_button = button.create{
    x = 750,
    y = 1080 / 2 - 170 / 2,
    width = 420,
    height = 170,
    callback = function(...)
        local event = {...}
        if event[2] == "click" then
            setScene("options")
        elseif event[2] == "enter" then
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
    callback = function(...)
        local event = {...}
        if event[2] == "click" then
            window:close()
        elseif event[2] == "enter" then
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
    player_hud:close()
    assets["menu_music"]:setLoop(true)
    assets["menu_music"]:play()
    exit_button:setStatus("released")
    play_button:setStatus("released")
    option_button:setStatus("released")
end

function unload()
    assets["menu_music"]:stop()
end

function draw()
    window:draw(background)
    play_button:draw()
    option_button:draw()
    exit_button:draw()
end

function update()

end

function event(e)
    play_button:event(e)
    option_button:event(e)
    exit_button:event(e)
end