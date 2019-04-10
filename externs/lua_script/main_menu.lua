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
        end
    end,
    idle = assets["button_idle"],
    hover = assets["button_hover"],
    press = assets["button_pressed"],
    text = "Exit",
    csize = 100,
}

function load()
    assets["menu_music"]:setLoop(true)
    assets["menu_music"]:play()
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

dir = -1

function event(...)
    local event = {...}
    play_button:event(...)
    option_button:event(...)
    exit_button:event(...)
end