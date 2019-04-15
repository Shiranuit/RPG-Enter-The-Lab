function load()
    assets["ambiance_music"]:setLoop(true)
    assets["ambiance_music"]:play()
end

function unload()
    assets["ambiance_music"]:stop()
end

function draw()
    window:clear(0, 0, 0)
    player:draw()
    all_sort:draw()
end

function update()
    player:update()
    if lsfml.keyboard.keyPressed(keys.A) then
        player:hit(DeltaTime)
        print(player:getHealth())
    end
    if lsfml.keyboard.keyPressed(keys.E) then
        player:respawn()
        print(player:getHealth())
    end
    if lsfml.keyboard.keyPressed(keys.M) then
        all_sort:change_sort(1, "douleurSpell")
        all_sort:change_sort(2, "elecSpell")
        all_sort:change_sort(3, "healSpell")
        all_sort:change_sort(4, "picSpell")
        all_sort:change_sort(5, "rayonSpell")
    end
end

function event(...)
    local event = {...}
    if event[1] == "key_pressed" and event[2] == keys.Escape then
        setScene("main_menu")
    end
    all_sort:event()
    player:event()
end