-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_intersection_bas"], false)

function load(scene)
    if (scene == "scene6_salle") then
        player.setPosition(1030, 1050)
    end
    if (scene == "scene7_angle_droit") then
        player.setPosition(30, 630)
    end
    if (scene == "scene4_angle_haut_gauche") then
        player.setPosition(1900, 630)
    end
    world.spawnEntity(player)
end

function unload()
    world.clearEntities()
end

function draw()
    window:draw(background)
end

function update()
    local x, y = player.getPosition()
    if x < 0 and y > 550 and y < 700 then
        setScene("scene7_angle_droit")
    end
    if x > 950 and x < 1050 and y > 1100 then
        setScene("scene6_salle")
    end
    if x > 1910 and y > 550 and y < 700 then
        setScene("scene4_angle_haut_gauche")
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