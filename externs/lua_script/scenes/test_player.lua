

function load()
    assets["ambiance_music"]:setLoop(true)
    assets["ambiance_music"]:play()
    player_hud:open()
end

function unload()
    assets["ambiance_music"]:stop()
    player_hud:close()
end

function draw()
    window:clear(0, 0, 0)
    player:draw()
end

function update()
    player:update()
    if lsfml.keyboard.keyPressed(keys.A) then
        player:hit(5)
        print(player:getHealth())
    end
    if lsfml.keyboard.keyPressed(keys.E) then
        player:respawn()
        print(player:getHealth())
    end
end

function event(...)
    local event = {...}
    if event[1] == "key_pressed" and event[2] == keys.Escape then
        setScene("main_menu")
    end
    player:event()
end