-- =========================================
-- =                SPELL MENU             =
-- =========================================

menu_sort = {}

function initMenuSpellSprite(spell)
    local tab = {}
    local j = 0
    local y = 0
    for i, v in pairs(spell) do
        tab[i] = lsfml.sprite.create()
        tab[i]:setTexture(v, false) 
        tab[i]:setScale(0.5, 0.5)
        y = math.modf(j / 4)
        tab[i]:setPosition(625 + 64.5 + 156 * j - y * 156 * 4, 305 + 54 + y * 125)
        j = j + 1
    end
    return (tab)
end

function  menu_sort.create(info)
    check(info, "table", 1)

    local spell = initMenuSpellSprite(info.spell)
    local spell_menu = lsfml.sprite.create()
    spell_menu:setTexture(info.spell_hub, false) 
    spell_menu:setScale(0.5, 0.5)
    spell_menu:setPosition(625, 305)
    return setmetatable({}, {
        __type = "menu_sort",
        __index = menu_sort,
        __all_spell = spell,
        __display = true,
        __old_pos_x = -1,
        __old_pos_y = -1,
        __origin_pos_x = -1,
        __origin_pos_y = -1,
        __selected_spell = nil,
        __selected_spell_name = "",
        __selected_spell_index = 0,
        __spell_hub = spell_menu,
    })
end

function menu_sort.display(self)
    check(self, "menu_sort")

    meta = getmetatable(self)
    if meta.__display == true then
        meta.__display = false
    else 
        meta.__display = true
    end
end

function menu_sort.event(self)
    check(self, "menu_sort")

    meta = getmetatable(self)
    local mouse_x, mouse_y  = lsfml.mouse.getPosition(window)
    if meta.__display then
        if lsfml.mouse.isButtonPressed(mouse.LEFT) then
            for i, v in pairs(meta.__all_spell) do
                local sprite_pos_x, sprite_pos_y = v:getPosition()
                if mouse_x > sprite_pos_x and mouse_x < sprite_pos_x + 71 and mouse_y > sprite_pos_y and mouse_y < sprite_pos_y + 71 then
                    if meta.__old_pos_x == -1  or meta.__old_pos_y == -1 then
                        meta.__origin_pos_y = sprite_pos_y
                        meta.__origin_pos_x = sprite_pos_x
                        meta.__old_pos_x = mouse_x
                        meta.__old_pos_y = mouse_y
                        meta.__selected_spell = v
                        meta.__selected_spell_name = i
                    end
                end
            end
        elseif meta.__selected_spell ~= nill then
            meta.__selected_spell:setPosition(meta.__origin_pos_x, meta.__origin_pos_y)
            meta.__old_pos_x = -1
            meta.__old_pos_y = -1
            meta.__selected_spell = nil
        end
        if meta.__selected_spell ~= nil then 
            meta.__selected_spell:move(mouse_x - meta.__old_pos_x, mouse_y - meta.__old_pos_y)
            meta.__old_pos_x = mouse_x
            meta.__old_pos_y = mouse_y
            local sprite_pos_x, sprite_pos_y = meta.__selected_spell:getPosition()
            for i = 1, 5 do
                if mouse_x > 705 + 30.5 + (i - 1) * 93.5 and mouse_x < 705 + 101.5 + (i - 1) * 93.5 and mouse_y > 900 + 9.5 and mouse_y < 900 + 80.5 then 
                    meta.__selected_spell_index = i
                end
            end
        end
    end
    if meta.__selected_spell_index ~= 0 and not lsfml.mouse.isButtonPressed(mouse.LEFT) then
        all_sort:changeSort(meta.__selected_spell_index, meta.__selected_spell_name) 
        meta.__selected_spell_index = 0
    end
end

function menu_sort.update(self)
    check(self, "menu_sort")

end

function menu_sort.draw(self)
    check(self, "menu_sort")

    meta = getmetatable(self)
    if meta.__display then
        window:draw(meta.__spell_hub)
        for i, v in pairs(meta.__all_spell) do
            window:draw(v)
        end
    end
end