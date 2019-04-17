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

function event(self, ...)
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

end

function elecSpell()

end

function healSpell()
    player:heal(1);
    assets["heal"]:play()
end

function picSpell()

end

function rayonSpell()

end

function bouleelecSpell()

end

function dashSpell()
    x, y = player:getPosition()
    --if () then
        player:setPosition(x + 100, y)
    --end
    --if () then
        player:setPosition(x - 100, y)
    --end
    --if () then
        player:setPosition(x, y + 100)
    --end
    --if () then
        player:setPosition(x, y - 100)
    --end
    assets["dash"]:play()
end

function repulsionSpell()

end

function shieldSpell()

end

function tempSpell()

end