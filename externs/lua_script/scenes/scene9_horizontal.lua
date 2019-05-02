-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_horizontal"], false)

local entities = {}
local hitbx = nil

function load(scene)
    if (scene == "scene10_intersection_haut") then
        player.setPosition(30, 700)
    end
    if (scene == "scene3_intersection_bas") then
        player.setPosition(1900, 700)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
    end
    if (hitbx == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})

        HitBoxWall(0, 0, {{1880, 0}, {1880, 600}, {1920, 600}, {1920, 0}})
        HitBoxWall(0, 0, {{1880, 760}, {1880, 1080}, {1920, 1080}, {1920, 760}})

        HitBoxWall(0, 0, {{30, 0}, {30, 600}, {-50, 600}, {-50, 0}})
        HitBoxWall(0, 0, {{30, 760}, {30, 1080}, {-50, 1080}, {-50, 760}})
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
    if x < 0 then
        setScene("scene10_intersection_haut")
    end
    if x > 1910 then
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