-- =========================================
-- =                SORT                   =
-- =========================================

sort = {}

function initSpellSprite(spell)
    tab = {}
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

function sort.create(info)
    check(info, "table", 1)

    local spell = initSpellSprite(info.spell)
    local sort_function = initSpellFunction(info.spell)
    return setmetatable({}, {
        __type = "sort",
        __index = sort,
        __sort = sort_function,
        __sort_sprite = {},
        __all_spell = spell,

    })
end

function sort.change_sort(self, index, sort)
    check(self, "sort")
    check(index, "number")
    check(sort, "string")

    meta = getmetatable(self)
    meta.__sort[index] = sort
    meta.__sort_sprite[index] = meta.__all_spell[sort]
    meta.__sort_sprite[index]:setPosition(705 + 30.5 + 93.5 * (index - 1), 900 + 9.5)
end

function sort.event(self)
    check(self, "sort")

    meta = getmetatable(self)
    if lsfml.keyboard.keyPressed(controls.spell_1) and meta.__sort[1] ~= nill then
        _G[meta.__sort[1]]()
    elseif lsfml.keyboard.keyPressed(controls.spell_2) and meta.__sort[2] ~= nill then
        _G[meta.__sort[2]]()
    elseif lsfml.keyboard.keyPressed(controls.spell_3) and meta.__sort[3] ~= nill then
        _G[meta.__sort[3]]()
    elseif lsfml.keyboard.keyPressed(controls.spell_4) and meta.__sort[4] ~= nill then
        _G[meta.__sort[4]]()
    elseif lsfml.keyboard.keyPressed(controls.spell_5) and meta.__sort[5] ~= nill then
        _G[meta.__sort[5]]()
    end
end

function sort.update(self)
    check(self, "sort")
end

function sort.draw(self)
    check(self, "sort")

    meta = getmetatable(self)
    for i, v in pairs(meta.__sort_sprite) do
        window:draw(v)
    end
end

-- =========================================
-- =             SORT EFFECT               =
-- =========================================

function healSpell()
    player:heal(1);
end

function douleurSpell()

end

function elecSpell()

end

function picSpell()

end

function rayonSpell()

end