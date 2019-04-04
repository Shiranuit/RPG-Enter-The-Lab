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
    print(event[1], event[2], event[3], event[5], event[5], event[6])
end