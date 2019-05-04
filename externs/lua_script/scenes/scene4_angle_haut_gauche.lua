-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_angle_haut_gauche"], false)

local first = false
local tube_bleu_homme1
local tube_bleu_homme2
local tube_bleu_homme3
local tube_bleu_femme1
local tube_bleu_femme2
local tube_vert_homme1
local tube_vert_homme2
local tube_vert_femme1
local tube_vert_femme2

local entities = {}
local hitb = nil

function load(scene)
    if first == false then
        tube_bleu_homme1 = new(EntityProps(300, 300, assets["tube_bleu_homme"], 78, 244, {{8, 183},{0, 244}, {157, 244}, {150, 183}}, 1))
        tube_bleu_homme2 = new(EntityProps(900, 1000, assets["tube_bleu_homme"], 78, 244, {{8, 183},{0, 244}, {157, 244}, {150, 183}}, 1))
        tube_bleu_homme3 = new(EntityProps(1250, 450, assets["tube_bleu_homme"], 78, 244, {{8, 183},{0, 244}, {157, 244}, {150, 183}}, 1))
        tube_bleu_femme1 = new(EntityProps(1600, 700, assets["tube_bleu_femme"], 78, 247, {{8, 185},{0, 247}, {159, 247}, {151, 185}}, 1))
        tube_bleu_femme2 = new(EntityProps(1400, 950, assets["tube_bleu_femme"], 78, 247, {{8, 185},{0, 247}, {159, 247}, {151, 185}}, 1))
        tube_vert_homme1 = new(EntityProps(1750, 980, assets["tube_vert_homme"], 80, 248, {{7, 186},{0, 248}, {160, 248}, {153, 186}}, 1))
        tube_vert_homme2 = new(EntityProps(700, 420, assets["tube_vert_homme"], 80, 248, {{7, 186},{0, 248}, {160, 248}, {153, 186}}, 1))
        tube_vert_femme1 = new(EntityProps(1650, 350, assets["tube_vert_femme"], 78, 248, {{8, 186},{0, 248}, {159, 248}, {151, 186}}, 1))
        tube_vert_femme2 = new(EntityProps(350, 850, assets["tube_vert_femme"], 78, 248, {{8, 186},{0, 248}, {159, 248}, {151, 186}}, 1))
        first = true
    end
    if (scene == "scene5_intersection_bas") then
        player.setPosition(30, 630)
    end
    if (scene == "scene3_intersection_bas") then
        player.setPosition(950, 200)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
        world.spawnEntity(tube_bleu_homme1)
        world.spawnEntity(tube_bleu_homme2)
        world.spawnEntity(tube_bleu_homme3)
        world.spawnEntity(tube_bleu_femme1)
        world.spawnEntity(tube_bleu_femme2)
        world.spawnEntity(tube_vert_homme1)
        world.spawnEntity(tube_vert_homme2)
        world.spawnEntity(tube_vert_femme1)
        world.spawnEntity(tube_vert_femme2)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 210}, {880, 210}, {880, 190}, {1030, 190}, {1030, 210}, {1920, 210}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})
        HitBoxWall(0, 0, {{1880, 1050}, {1880, 40}})

        HitBoxWall(0, 0, {{30, 0}, {30, 530}, {-50, 530}, {-50, 0}})
        HitBoxWall(0, 0, {{30, 690}, {30, 1080}, {-50, 1080}, {-50, 690}})
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
    if y < 200 then
        setScene("scene3_intersection_bas")
    end
    if x < 0 then
        setScene("scene5_intersection_bas")
    end
    if keyboard.keyPressed(keys.A) then
        player.hit(10 * DeltaTime, "World")
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