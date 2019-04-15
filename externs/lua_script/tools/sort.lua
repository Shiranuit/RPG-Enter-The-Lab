-- =========================================
-- =                SORT                   =
-- =========================================

sort = {}

function sort.create(info)
    check(info, "table", 1)

    return setmetatable({}, {
        __type = "sort",
        __index = sort,
        __sort = {},
        __sort_spite = {},
    })
end

function sort.change_sort(self, index, sort)
    check(self, "sort")
    check(index, "number")
    check(sort, "string")


end

function entity_player.event(self)
    check(self, "sort")
end

function entity_player.update(self)
    check(self, "sort")
end

function entity_player.draw(self)
    check(self, "sort")
end