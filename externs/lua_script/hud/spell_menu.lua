-- =========================================
-- =                SPELL MENU             =
-- =========================================

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


local spell = initMenuSpellSprite(spells)
local spell_menu = lsfml.sprite.create()
spell_menu:setTexture(assets["spell_hub"], false) 
spell_menu:setScale(0.5, 0.5)
spell_menu:setPosition(625, 305)
local type = "menu_sort"
local index = menu_sort
local all_spell = spell
local old_pos_x = -1
local old_pos_y = -1
local origin_pos_x = -1
local origin_pos_y = -1
local selected_spell_name = ""
local selected_spell = nil
local spell_hub = spell_menu
local selected_spell_index = 0

function event(self, e)
    check(self, "hud", 1)

    local event = e:getEvent()
    if event[1] == "key_pressed" and event[2] == controls.menu_spell then
        if self:isOpen() then
            self:close()
        else
            self:open()
        end
    end
    local mouse_x, mouse_y  = lsfml.mouse.getPosition(window)
    if self:isOpen() then
        if lsfml.mouse.isButtonPressed(mouse.LEFT) then
            for i, v in pairs(all_spell) do
                local sprite_pos_x, sprite_pos_y = v:getPosition()
                if mouse_x > sprite_pos_x and mouse_x < sprite_pos_x + 71 and mouse_y > sprite_pos_y and mouse_y < sprite_pos_y + 71 then
                    if old_pos_x == -1  or old_pos_y == -1 then
                        origin_pos_y = sprite_pos_y
                        origin_pos_x = sprite_pos_x
                        old_pos_x = mouse_x
                        old_pos_y = mouse_y
                        selected_spell = v
                        selected_spell_name = i
                        break
                    end
                end
            end
        elseif selected_spell ~= nill then
            selected_spell:setPosition(origin_pos_x, origin_pos_y)
            old_pos_x = -1
            old_pos_y = -1
            selected_spell = nil
        end
        if selected_spell ~= nil then
            selected_spell:move(mouse_x - old_pos_x, mouse_y - old_pos_y)
            old_pos_x = mouse_x
            old_pos_y = mouse_y
            local sprite_pos_x, sprite_pos_y = selected_spell:getPosition()
            for i = 1, 5 do
                if mouse_x > 705 + 30.5 + (i - 1) * 93.5 and mouse_x < 705 + 101.5 + (i - 1) * 93.5 and mouse_y > 900 + 9.5 and mouse_y < 900 + 80.5 then 
                    selected_spell_index = i
                    break
                end
            end
        end
    end
    if selected_spell_index ~= 0 and not lsfml.mouse.isButtonPressed(mouse.LEFT) then
        all_sort:changeSort(selected_spell_index, selected_spell_name)
        selected_spell_index = 0
    end
end

function update(self)
    check(self, "hud", 1)

end

function draw(self)
    check(self, "hud", 1)

    window:draw(spell_hub)
    for i, v in pairs(all_spell) do
        window:draw(v)
    end
end