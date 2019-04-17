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
    local tab = {}
    for i, v in pairs(spell) do
        tab[i] = v
    end
    return (tab)
end

function initStatusSort(spell)
    local tab = {}

    for i, v in pairs(spell) do
        tab[i] = "up"
    end
    return (tab)
end

function initClockSort(spell)
    local tab = {}
    local tab_2 = {}
    local tab_3 = {}

    for i, v in pairs(spell) do
        tab[i] = lsfml.clock.create()
        tab_2[i] = false
        tab_3[i] = lsfml.text.create()
        tab_3[i]:setFont(assets["fsys"])
    end
    return tab, tab_2 ,tab_3
end

local sorts = initSpellFunction(spells)
local sort_sprite = {}
local all_spell = initSpellSprite(spells)
local status_sort = initStatusSort(spells)
local cooldown_sort = {}
local clock_sort, clock_status, text_clock = initClockSort(spells)
local sort_index = {}
local index_sort = {}

function changeSort(self, index, sort)
    check(self, "hud", 1)
    check(index, "number", 2)
    check(sort, "string", 3)

    if sort_index[sort] ~= nil then
        sort_index[sort] = nil
    end
    index_sort[index] = sort
    sort_index[sort] = index
    sorts[index] = sort
    sort_sprite[index] = all_spell[sort]
    if sort_sprite[index] then
        sort_sprite[index]:setPosition(705 + 30.5 + 93.5 * (index - 1), 900 + 9.5)
    end
    local pos_x, pos_y = all_spell[sort]:getPosition()
    text_clock[sort]:setPosition(pos_x + 6, pos_y + 10)
end

function event(self, e)
    check(self, "hud", 1)
    if player:isDead() then return end
    if menu_spell:isClose() then
        if lsfml.keyboard.keyPressed(controls.getControl("spell_1")) and sorts[1] ~= nil and self[sorts[1]] and sort_index[sorts[1]] == 1 then
            self[sorts[1]]()
        elseif lsfml.keyboard.keyPressed(controls.getControl("spell_2")) and sorts[2] ~= nil and self[sorts[2]] and sort_index[sorts[2]] == 2 then
            self[sorts[2]]()
        elseif lsfml.keyboard.keyPressed(controls.getControl("spell_3")) and sorts[3] ~= nil and self[sorts[3]] and sort_index[sorts[3]] == 3 then
            self[sorts[3]]()
        elseif lsfml.keyboard.keyPressed(controls.getControl("spell_4")) and sorts[4] ~= nil and self[sorts[4]] and sort_index[sorts[4]] == 4 then
            self[sorts[4]]()
        elseif lsfml.keyboard.keyPressed(controls.getControl("spell_5")) and sorts[5] ~= nil and self[sorts[5]] and sort_index[sorts[5]] == 5 then
            self[sorts[5]]()
        end
    end
end

function update(self)
    check(self, "hud", 1)

    for i, v in pairs(all_spell) do 
        if status_sort[i] == "down" then
            if not clock_status[i] then
                clock_sort[i]:restart()
                clock_status[i] = true
                all_spell[i]:setColor(0, 0, 0, 255)
            end
            if clock_sort[i]:getEllapsedTime() > cooldown_sort[i] then
                clock_status[i] = false
                status_sort[i] = "up"
                v:setColor(255, 255, 255, 255) 
            else
                local color = math.floor((clock_sort[i]:getEllapsedTime() / cooldown_sort[i]) * 175) + 80
                v:setColor(color, color, color, 255)
                local full_number = tostring((cooldown_sort[i] - clock_sort[i]:getEllapsedTime()) / 1000000)
                text_clock[i]:setString(string.sub(full_number, 1, 4))
            end
        end 
    end
end

function draw(self)
    check(self, "hud", 1)

    for i, v in pairs(sort_sprite) do
        window:draw(v)
    end
    for i, v in pairs(all_spell) do 
        if clock_status[i] == true and index_sort[sort_index[i]] == i then
            window:draw(text_clock[i])
        end
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
    if (status_sort["douleurSpell"] == "up") then
        player:removeMana(10)
        status_sort["douleurSpell"] = "down"
        cooldown_sort["douleurSpell"] = 20000000
    end
    --donne un status de degats renvoyé au joueurs so l'ennemi en prend aussi
end

function elecSpell()
    if (player:getMana() < 5) then
        assets["deny"]:play()
        return
    end
    if (status_sort["elecSpell"] == "up") then
        player:removeMana(5)
        status_sort["elecSpell"] = "down"
        cooldown_sort["elecSpell"] = 5000000
    end
    --lance un éclair droit devant le joueur et si touche l'ennemi il prend des damages
end

function healSpell()
    if (player:getMana() < 2) then
        assets["deny"]:play()
        return
    end
    if (status_sort["healSpell"] == "up") then
        player:removeMana(2)
        player:heal(30)
        assets["heal"]:play()
        status_sort["healSpell"] = "down"
        cooldown_sort["healSpell"] = 10000000
    end
end

function picSpell()
    if (player:getMana() < 3) then
        assets["deny"]:play()
        return
    end
    if (status_sort["picSpell"] == "up") then
        player:removeMana(3)
        status_sort["picSpell"] = "down"
        cooldown_sort["picSpell"] = 3000000
    end
    --Une lance energétique sort de la main du joueur a courte portée infligant des damages 
end

function rayonSpell()
    if (player:getMana() < 1) then
        assets["deny"]:play()
        return
    end

    if clock_sort["rayonSpell"]:getEllapsedTime() > 1000 then
        clock_sort["rayonSpell"]:restart()
        player:removeMana(1)
    end
    -- un rayon de feu voir une boule de feu sort du joueur
end

function bouleelecSpell()
    if (player:getMana() < 7) then
        assets["deny"]:play()
        return
    end
    if (status_sort["bouleelecSpell"] == "up") then
        player:removeMana(7)
        status_sort["bouleelecSpell"] = "down"
        cooldown_sort["bouleelecSpell"] = 10000000
    end
    -- un boule d'electricity spawn a quelque case du joueur et attaque les ennemis proche
end

function dashSpell()
    status, hor, ver = player:getStatus()
    if (status == "idle" or player:getMana() < 1) then
        assets["deny"]:play()
        return
    end
    if (status_sort["dashSpell"] == "up") then
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
        status_sort["dashSpell"] = "down"
        cooldown_sort["dashSpell"] = 500000
    end
end

function repulsionSpell()
    if (player:getMana() < 4) then
        assets["deny"]:play()
        return
    end
    if (status_sort["repulsionSpell"] == "up") then
        player:removeMana(4)
        status_sort["repulsionSpell"] = "down"
        cooldown_sort["repulsionSpell"] = 5000000
    end
    -- repousse de quelque case les ennemis autour
end

function shieldSpell()
    if (player:getMana() < 10) then
        assets["deny"]:play()
        return
    end
    if (status_sort["shieldSpell"] == "up") then
        player:removeMana(10)
        assets["shield"]:setVolume(200)
        assets["shield"]:play()
        player:addDefense(10)
        status_sort["shieldSpell"] = "down"
        cooldown_sort["shieldSpell"] = 13000000
    end
    -- donne un shield au joueur pour 10 seconde
end

function tempSpell()
    if (player:getMana() < 15) then
        assets["deny"]:play()
        return
    end
    if (status_sort["tempSpell"] == "up") then
        player:removeMana(15)
        assets["time"]:setVolume(100)
        assets["time"]:play()
        status_sort["tempSpell"] = "down"
        cooldown_sort["tempSpell"] = 20000000
    end
    -- ralenti tout les ennemis dans la salle pour 5 seconde
end