-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["right_start"], false)

local entities = {}
local hitb = nil

function load(scene)
    if (scene == "scene15_start") then
        player.setPosition(30, 580)
    end
    if (scene == "scene18_boss") then
        player.setPosition(950, 200)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 160}, {900, 160}, {900, 135}, {1000, 135}, {1000, 160}, {1920, 160}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})
        HitBoxWall(0, 0, {{1880, 1050}, {1880, 40}})
        hitb = hitbox.getHitboxes()
    end
    hitbox.setHitboxes(hitb)
end

function unload()
    entities = world.getEntities()
    hitb = hitbox.getHitboxes()
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
    if x > 900 and x < 1000 and y < 155 then
        setScene("scene18_boss")
    end
    if x < 0 then
        setScene("scene15_start")
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