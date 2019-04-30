-- =========================================
-- =               DIALOGUE                =
-- =========================================

local dial = lsfml.sprite.create()


dial:setPosition(420, 280)

dial:setTexture(assets["case_dial"], false)

dial:setScale(1.5, 1.5)

function load(self)

end

function open(self)
    all_sort:open()
end

function close(self)
    all_sort:close()
end

function draw(self)
    window:draw(dial)
end

function update(self)

end

function event(self, e)

end