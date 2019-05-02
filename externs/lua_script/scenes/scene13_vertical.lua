-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_vertical"], false)

local entities = {}
local hitbx = nil

function load(scene)
    if (scene == "scene14_escalier") then
        player.setPosition(1030, 200)
    end
    if (scene == "scene10_intersection_haut") then
        player.setPosition(1030, 1050)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(scythe)
        world.spawnEntity(player)
    end
    if (hitbx == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {960, 220}, {960, 190}, {1115, 190}, {1115, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{910, 30}, {910, 1050}})
        HitBoxWall(0, 0, {{1170, 30}, {1170, 1050}})

        HitBoxWall(0, 0, {{0, 1030}, {970, 1030}, {970, 1100}, {0, 1100}})
        HitBoxWall(0, 0, {{1100, 1030}, {1920, 1030}, {1920, 1100}, {1100, 1100}})
        hitbx = hitbox.getHitboxes()
    end
    hitbox.setHitboxes(hitbx)
end

function unload()
    entities = world.getEntities()
    hitbx = hitbox.getHitboxes()
    world.clearEntities()
    hitbox.clear()
end

function HitBoxWall(x_or, y_or, pts)
    local box = new(Hitbox("hard", {takeDamage=false, doDamage=false}))
    box.setPoints(pts)
    box.setPosition(x_or, y_or)
    hitbox.add(box)
end

function draw()
    window:draw(background)
end

function update()
    local x, y = player.getPosition()
    if y < 200 then
        setScene("scene14_escalier")
    end
    if y > 1050 then
        setScene("scene10_intersection_haut")
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