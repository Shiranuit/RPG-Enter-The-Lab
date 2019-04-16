-- =========================================
-- =                SPELL MENU             =
-- =========================================

menu_sort = {}

function initMenuSpellSprite(spell)
    local tab = {}
    local j = 0
    for i, v in pairs(spell) do
        tab[i] = lsfml.sprite.create()
        tab[i]:setTexture(v, false) 
        tab[i]:setScale(0.5, 0.5) 
        tab[i]:setPosition(71 * j, 400)
        j = j + 1
    end
    return (tab)
end

function  menu_sort.create(info)
    check(info, "table", 1)

    local spell = initMenuSpellSprite(info.spell)
    return setmetatable({}, {
        __type = "menu_sort",
        __index = menu_sort,
        __all_spell = spell,
        __display = true,
        __old_pos_x = -1;
        __old_pos_y = -1;
        __selected_spell = nil,
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
end

function menu_sort.update(self)
    check(self, "menu_sort")

    meta = getmetatable(self)
    local mouse_x, mouse_y  = lsfml.mouse.getPosition(window)
    if meta.__display then
        if lsfml.mouse.isButtonPressed(mouse.LEFT) then
            for i, v in pairs(meta.__all_spell) do
                local sprite_pos_x, sprite_pos_y = v:getPosition()
                if mouse_x > sprite_pos_x and mouse_x < sprite_pos_x + 71 and mouse_y > sprite_pos_y and mouse_y < sprite_pos_y + 71 then
                    if meta.__old_pos_x == -1  or meta.__old_pos_y == -1 then
                        meta.__old_pos_x = mouse_x
                        meta.__old_pos_y = mouse_y
                        meta.__selected_spell = v
                    end
                end
            end
        else
            meta.__old_pos_x = -1
            meta.__old_pos_y = -1
            meta.__selected_spell = nil
        end
        if meta.__selected_spell ~= nil then 
            meta.__selected_spell:move(mouse_x - meta.__old_pos_x, mouse_y - meta.__old_pos_y)
            meta.__old_pos_x = mouse_x
            meta.__old_pos_y = mouse_y
        end
    end
end

function menu_sort.draw(self)
    check(self, "menu_sort")

    meta = getmetatable(self)
    if meta.__display then
        for i, v in pairs(meta.__all_spell) do
            window:draw(v)
        end
    end
end