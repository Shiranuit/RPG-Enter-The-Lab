-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
local touche = lsfml.sprite.create()
background:setTexture(assets["labo_pop"], false)
touche:setTexture(assets["hud_touche"], false)
local canPass = false

local stopwatch = stopwatch.create()
local door = animation.create(assets["door"], {0, 0 , 400, 351})
local play_door = false

door:setPosition(965, 80)
door:scale(0.38, 0.38)

local first = false


local entities = {}
local hitb = nil

function load(scene)
    if first == false then
        first = true
    end
    player.setPosition(1050, 240)
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {965, 220}, {960, 190}, {1115, 190}, {1115, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})
        HitBoxWall(0, 0, {{30, 30}, {30, 1050}})
        HitBoxWall(0, 0, {{1880, 1050}, {1880, 40}})
        hitb = hitbox.getHitboxes()
    end
    hitbox.setHitboxes(hitb)
end

function HitBoxWall(x_or, y_or, pts)
    local box = new(Hitbox("hard", {takeDamage=false, doDamage=false}))
    box.setPoints(pts)
    box.setPosition(x_or, y_or)
    hitbox.add(box)
end

function unload()
    entities = world.getEntities()
    hitb = hitbox.getHitboxes()
    world.clearEntities()
    hitbox.clear()
end

function draw()
    window:draw(background)
    if canPass then
        if stopwatch:getEllapsedTime() > 100000 then
            stopwatch:restart()
            door:next()
        end
    end
    door:draw()
end

function update()
    local x, y = player.getPosition()
    canPass = true
    for i=1, #entities do
        if entities[i].getType() == "ennemy" then
            canPass = false
        end
    end
    if canPass then
        if not play_door then
            assets["door_sound"]:play()
            play_door = true
        end
        if x > 930 and x < 1100 and y < 210 then
            setScene("fin")
        end
    end
    if keyboard.keyPressed(keys.A) then
        player.hit(10 * DeltaTime, "World")
    end
    if keyboard.keyPressed(keys.E) then
        player.respawn()
    end
end

function event(e)

end