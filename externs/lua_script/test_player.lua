

local pedro = player.create ({
    pos_x = 100,
    pos_y = 100,
    texture = assets["player"],
    speed = 20

})


function draw()
    window:clear(0, 0, 0)
    pedro:draw()
end

function update()
    pedro:update()
end

function event(...)
    pedro:event()
end