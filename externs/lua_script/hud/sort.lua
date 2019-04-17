-- =========================================
-- =                SORT                   =
-- =========================================

function initSpellSprite(spell)
    local tab = {}
    for i, v in pairs(spell) do
        tab[i] = lsfml.sprite.create()
        tab[i]:setTexture(v, false) 
        tab[i]:setScale(0.5, 0.5) 
    end
    return (tab)
end

function initSpellFunction(spell)
    tab = {}
    for i, v in pairs(spell) do
        tab[i] = v
    end
    return (tab)
end

local sorts = initSpellFunction(spells)
local sort_sprite = {}
local all_spell = initSpellSprite(spells)

function changeSort(self, index, sort)
    check(self, "hud", 1)
    check(index, "number", 2)
    check(sort, "string", 3)

    sorts[index] = sort
    sort_sprite[index] = all_spell[sort]
    print(type(sort_sprite[index]))
    if sort_sprite[index] then
        sort_sprite[index]:setPosition(705 + 30.5 + 93.5 * (index - 1), 900 + 9.5)
    end
end

function event(self, e)
    check(self, "hud", 1)

    if player:isDead() then return end

    if menu_spell:isClose() then
        if lsfml.keyboard.keyPressed(controls.spell_1) and sorts[1] ~= nil and self[sorts[1]] then
            self[sorts[1]]()
        elseif lsfml.keyboard.keyPressed(controls.spell_2) and sorts[2] ~= nil and self[sorts[2]] then
            self[sorts[2]]()
        elseif lsfml.keyboard.keyPressed(controls.spell_3) and sorts[3] ~= nil and self[sorts[3]] then
            self[sorts[3]]()
        elseif lsfml.keyboard.keyPressed(controls.spell_4) and sorts[4] ~= nil and self[sorts[4]] then
            self[sorts[4]]()
        elseif lsfml.keyboard.keyPressed(controls.spell_5) and sorts[5] ~= nil and self[sorts[5]] then
            self[sorts[5]]()
        end
    end
end

function update(self)
    check(self, "hud", 1)
end

function draw(self)
    check(self, "hud", 1)

    for i, v in pairs(sort_sprite) do
        window:draw(v)
    end
end

-- =========================================
-- =             SORT EFFECT               =
-- =========================================

function douleurSpell()
    if (player:getMana() < 10) then
        assets["deny"]:play()
        return
    end
    player:removeMana(10)
    --donne un status de degats renvoyé au joueurs so l'ennemi en prend aussi
end

function elecSpell()
    if (player:getMana() < 5) then
        assets["deny"]:play()
        return
    end
    player:removeMana(5)
    --lance un éclair droit devant le joueur et si touche l'ennemi il prend des damages
end

function healSpell()
    if (player:getMana() < 2) then
        assets["deny"]:play()
        return
    end
    player:removeMana(2)
    player:heal(25);
    assets["heal"]:play()
    print(player:getMana())
end

function picSpell()
    if (player:getMana() < 3) then
        assets["deny"]:play()
        return
    end
    player:removeMana(3)
    --Une lance energétique sort de la main du joueur a courte portée infligant des damages 
end

function rayonSpell()
    if (player:getMana() < 10) then
        assets["deny"]:play()
        return
    end
    player:removeMana(10)
    -- un rayon de feu voir une boule de feu sort du joueur
end

function bouleelecSpell()
    if (player:getMana() < 7) then
        assets["deny"]:play()
        return
    end
    player:removeMana(7)
    -- un boule d'electricity spawn a quelque case du joueur et attaque les ennemis proche
end

function dashSpell()
    status, hor, ver = player:getStatus()
    if (status == "idle" or player:getMana() < 1) then
        assets["deny"]:play()
        return
    end
    player:removeMana(1)
    assets["dash"]:play()
    x, y = player:getPosition()
    if (hor == "right") then
        player:setPosition(x + 100, y)
    end
    if (hor == "left") then
        player:setPosition(x - 100, y)
    end
    if (ver == "down") then
        if (hor == "left") then
            player:setPosition(x - 70, y + 70)
            return
        end
        if (hor == "right") then
            player:setPosition(x + 70, y + 70)
            return
        end
        player:setPosition(x, y + 100)
    end
    if (ver == "up") then
        if (hor == "left") then
            player:setPosition(x - 70, y - 70)
            return
        end
        if (hor == "right") then
            player:setPosition(x + 70, y - 70)
            return
        end
        player:setPosition(x, y - 100)
    end
end

function repulsionSpell()
    if (player:getMana() < 4) then
        assets["deny"]:play()
        return
    end
    player:removeMana(4)
    -- repousse de quelque case les ennemis autour
end

function shieldSpell()
    if (player:getMana() < 10) then
        assets["deny"]:play()
        return
    end
    player:removeMana(10)
    assets["shield"]:setVolume(200)
    assets["shield"]:play()
    player:addDefense(10)
    -- donne un shield au joueur pour 10 seconde
end

function tempSpell()
    if (player:getMana() < 15) then
        assets["deny"]:play()
        return
    end
    player:removeMana(15)
    -- ralenti tout les ennemis dans la salle pour 5 seconde
end