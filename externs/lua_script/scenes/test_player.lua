-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_pop"], false)

function load()
    player:setPosition(1045, 616)
    assets["ambiance_music"]:setLoop(true)
    assets["ambiance_music"]:setVolume(30)
    assets["ambiance_music"]:play()
end

function unload()
    assets["ambiance_music"]:stop()
end

function draw()
    window:draw(background)
end

function update()
    if lsfml.keyboard.keyPressed(keys.A) then
        player:hit(DeltaTime)
        print(player:getHealth())
    end
    if lsfml.keyboard.keyPressed(keys.E) then
        player:respawn()
        print(player:getHealth())
    end
end

local press = false
local px, py = 0, 0
function event(e)
    local event = e:getEvent()
    if event[1] == "mouse_pressed" and press == false then
        px, py = event[2], event[3]
        press = true
    elseif event[1] == "mouse_released" and press then
        local box = {x=math.min(px, event[2]), y=math.min(py, event[3]), w=math.max(event[2], px), h=math.max(event[3], py)}
        hitbox.add(box)
        press = false
    end
end