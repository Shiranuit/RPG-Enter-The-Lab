-- =========================================
-- =               TEMP HUD                =
-- =========================================

local time = animation.create(assets["tempAnimation"], {0, 0, 573, 573})
time:setPosition(600, 125)
time:setScale(1.5, 1.5)
local clock = lsfml.clock.create()
local is_activate = false

function load(self)

end

function open(self)
    time:restart()
end

function close(self)

end

function draw(self)
    if clock:getEllapsedTime() > 625000 then
        clock:restart()
        time:next()
        if time:hasEnded() then
            self:close()
        end
    end
    time:draw()
end

function update(self)

end

function event(self, e)

end
