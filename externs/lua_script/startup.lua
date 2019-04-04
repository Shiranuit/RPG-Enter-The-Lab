-- Called at the beginning of the program
function init()

end

-- Called each time we need to draw a frame
function draw()
    lsfml.window_clear(window, 255, 255, 255, 255)
end

-- Called each time we need to update the game-logic
function update()

end

-- Called when an event is produced
function event(...)
    local event = {...}
    print(lsfml.keyboard_keyPressed(0))
    if (event[1] == "close") then
        lsfml.window_close(window)
    end
end