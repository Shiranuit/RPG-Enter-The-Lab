

local pedro = player.create ({
    pos_x = 100;
    pos_y = 100;
    texture = assets["player"]

})


function draw()
    window:clear(0, 0, 0)
    pedro:draw()
end

function update()

end

function event(...)
    pedro:event()
end