-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_intersection_bas"], false)

local scythe = new(EntityScytheBoss(500, 510))

local entities = {}
local hitb = nil

function load(scene)
    bosshealth:setEntity(scythe)
    local torch1 = new(EntityProps(100, 450, assets["torch"], 27, 111, {{0, 95},{0, 111}, {55, 111}, {55, 95}}, 1))
    local torch2 = new(EntityProps(100, 850, assets["torch_empty"], 27, 84, {{0, 95},{0, 84}, {55, 84}, {55, 95}}, 1))
    local torch3 = new(EntityProps(1800, 450, assets["torch"], 27, 111, {{0, 95},{0, 111}, {55, 111}, {55, 95}}, 1))
    local torch4 = new(EntityProps(1800, 850, assets["torch_empty"], 27, 84, {{0, 95},{0, 84}, {55, 84}, {55, 95}}, 1))
    local torch5 = new(EntityProps(870, 850, assets["torch"], 27, 111, {{0, 95},{0, 111}, {55, 111}, {55, 95}}, 1))
    local torch6 = new(EntityProps(1200, 850, assets["torch_empty"], 27, 84, {{0, 95},{0, 84}, {55, 84}, {55, 95}}, 1))
    local hologram1 = new(EntityProps(550, 350, assets["hologram"], 77, 155, {{0, 136},{0, 155}, {155, 155}, {155, 136}}, 1))
    local hologram2 = new(EntityProps(1500, 900, assets["hologram"], 77, 155, {{0, 136},{0, 155}, {155, 155}, {155, 136}}, 1))
    local hologram_break1 = new(EntityProps(1200, 400, assets["hologram_break"], 77, 39, {{0, 20},{0, 39}, {155, 39}, {155, 20}}, 1))
    local hologram_break2 = new(EntityProps(450, 950, assets["hologram_break"], 77, 39, {{0, 20},{0, 39}, {155, 39}, {155, 20}}, 1))
    if (scene == "scene9_horizontal") then
        player.setPosition(30, 630)
    end
    if (scene == "scene2_angle_g") then
        player.setPosition(1900, 630)
    end
    if (scene == "scene4_angle_haut_gauche") then
        player.setPosition(1030, 1050)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(scythe)
        world.spawnEntity(player)
        world.spawnEntity(torch1)
        world.spawnEntity(torch2)
        world.spawnEntity(torch3)
        world.spawnEntity(torch4)
        world.spawnEntity(torch5)
        world.spawnEntity(torch6)
        world.spawnEntity(hologram1)
        world.spawnEntity(hologram2)
        world.spawnEntity(hologram_break1)
        world.spawnEntity(hologram_break2)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {1920, 220}, {1920, 0}})

        HitBoxWall(0, 0, {{30, 0}, {30, 530}, {-50, 530}, {-50, 0}})
        HitBoxWall(0, 0, {{30, 690}, {30, 1080}, {-50, 1080}, {-50, 690}})

        HitBoxWall(0, 0, {{1880, 0}, {1880, 530}, {1920, 530}, {1920, 0}})
        HitBoxWall(0, 0, {{1880, 690}, {1880, 1080}, {1920, 1080}, {1920, 690}})

        HitBoxWall(0, 0, {{0, 1030}, {950, 1030}, {950, 1100}, {0, 1100}})
        HitBoxWall(0, 0, {{1120, 1030}, {1920, 1030}, {1920, 1100}, {1100, 1120}})
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
    if x < 0 then
        setScene("scene9_horizontal")
    end
    if y > 1100 then
        setScene("scene4_angle_haut_gauche")
    end
    if x > 1910 then
        setScene("scene2_angle_g")
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