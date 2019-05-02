-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_escalier"], false)

local entities = {}
local hitb = nil

function load(scene)
    local geant_tapis_gauche = new(EntityProps(250, 300, assets["geant_tapis_gauche"], 0, 0, {}, 1))
    local grand_tapis_droite = new(EntityProps(1300, 250, assets["grand_tapis_droite"], 0, 0, {}, 1))
    local moyen_tapis_haut_droite = new(EntityProps(1100, 650, assets["moyen_tapis_haut_droite"], 0, 0, {}, 1))
    local petit_tapis_bas_gauche = new(EntityProps(250, 700, assets["petit_tapis_bas_gauche"], 0, 0, {}, 1))
    local status1 = new(EntityProps(600, 600, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local status2 = new(EntityProps(1400, 450, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local status3 = new(EntityProps(1300, 800, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local pot1_1 = new(EntityProps(300, 500, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_2 = new(EntityProps(400, 800, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_3 = new(EntityProps(1200, 800, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_4 = new(EntityProps(1600, 450, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot2_1 = new(EntityProps(500, 650, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_2 = new(EntityProps(300, 400, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_3 = new(EntityProps(1500, 350, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_4 = new(EntityProps(300, 800, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot3_1 = new(EntityProps(300, 800, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 74}}, 1))
    local pot3_2 = new(EntityProps(300, 800, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 74}}, 1))
    local pot3_3 = new(EntityProps(300, 800, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 74}}, 1))
    local pot3_4 = new(EntityProps(300, 800, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 74}}, 1))
    if (scene == "scene15_start") then
        player.setPosition(980, 250)
    end
    if (scene == "scene13_vertical") then
        player.setPosition(980, 1050)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
        world.spawnEntity(geant_tapis_gauche)
        world.spawnEntity(grand_tapis_droite)
        world.spawnEntity(moyen_tapis_haut_droite)
        world.spawnEntity(petit_tapis_bas_gauche)
        world.spawnEntity(status1)
        world.spawnEntity(status2)
        world.spawnEntity(status3)
        world.spawnEntity(pot1_1)
        world.spawnEntity(pot1_2)
        world.spawnEntity(pot1_3)
        world.spawnEntity(pot1_4)
        world.spawnEntity(pot2_1)
        world.spawnEntity(pot2_2)
        world.spawnEntity(pot2_3)
        world.spawnEntity(pot2_4)
        world.spawnEntity(pot3_1)
        world.spawnEntity(pot3_2)
        world.spawnEntity(pot3_3)
        world.spawnEntity(pot3_4)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {880, 220}, {880, 190}, {1030, 190}, {1030, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{30, 30}, {30, 1050}})
        HitBoxWall(0, 0, {{1880, 1050}, {1880, 40}})

        HitBoxWall(0, 0, {{0, 1030}, {880, 1030}, {880, 1100}, {0, 1100}})
        HitBoxWall(0, 0, {{1050, 1030}, {1920, 1030}, {1920, 1100}, {1050, 1100}})
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
    if mouse_pressed("mouse_left") then
        print(mouse.getPosition())
    end
    if y < 200 then
        setScene("scene15_start")
    end
    if y > 1050 then
        setScene("scene13_vertical")
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