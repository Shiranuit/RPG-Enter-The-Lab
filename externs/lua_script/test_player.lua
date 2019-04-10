

local pedro = player.create ({
    pos_x = 100,
    pos_y = 100,
    texture = assets["player"],
    speed = 20

})

function load()
    assets["ambiance_music"]:setLoop(true)
    assets["ambiance_music"]:play()
end

function unload()
    assets["ambiance_music"]:stop()
end

function draw()
    window:clear(0, 0, 0)
    pedro:draw()
end

function update()
    pedro:update()
end

function event(...)
    local event = {...}
    if event[1] == "key_pressed" and event[2] == keys.Escape then
        setScene("main_menu")
    end
    pedro:event()
end