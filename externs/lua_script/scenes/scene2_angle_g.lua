-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_angle_gauche"], false)

function load(scene)
    if (scene == "test_player") then
        player.setPosition(960, 1000)
    end
    if (scene == "scene3_intersection_bas") then
        player.setPosition(0, 625)
    end
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
    local x, y = player.getPosition()
    if x > 850 and x < 1050 and y > 1050 then
        setScene("test_player")
    end
    if x < 0 and y > 550 and y < 700 then
        setScene("scene3_intersection_bas")
    end
    if keyboard.keyPressed(keys.A) then
        player.hit(10 * DeltaTime)
        print(player.getHealth())
    end
    if keyboard.keyPressed(keys.E) then
        player.respawn()
        print(player.getHealth())
    end
end


local hitbx = new(Hitbox())
local press = false
local px, py = 0, 0
function event(e)
    local event = e:getEvent()
    if event[1] == "mouse_pressed" and press == false and event[4] == mouse.RIGHT then
        px, py = event[2], event[3]
        press = true
        hitbx.addPoint(px, py)
    elseif event[1] == "mouse_released" and press and event[4] == mouse.RIGHT then
        press = false
    end
    if event[1] == "mouse_pressed" and event[4] == mouse.LEFT then
        if hitbx and #hitbx.getPoints() > 0 then
            local pts = hitbx.getPoints()
            hitbx.setOrigin(hitbx.getMiddlePoint())
            hitbox.add(hitbx)
            hitbx = new(Hitbox())
        end
    end
end