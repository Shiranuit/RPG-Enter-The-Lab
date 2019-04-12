-- =========================================
-- =                  HUD                  =
-- =========================================

hud = {}
hudorder = {}

function hud.createFromFile(filename, zindex)
    check(filename, "string", 1)
    cassert(type(zindex) == "nil" or type(zindex) == "number", "zindex must be a number", 3)
    local handle = io.open("./externs/lua_script/"..filename, "r")
    if handle then
        local code = handle:read("*all")
        handle:close()
        local env = setmetatable({}, {__index = _G})
        local func, err = load(code, "loadHUD", "t", env)
        if func then
            local s, e = pcall(func)
            if s then
                local name = filename:match("([^/]+).lua$")
                local data = {}
                for k, v in pairs(env) do
                    data[k] = v
                end
                local meta = setmetatable({}, {
                    __index = hud,
                    __env = data,
                    __type = "hud",
                    __name = name,
                    __status = "close",
                })
                if data.load then
                    data.load(meta)
                end
                table.insert(hudorder, zindex or #hudorder + 1, meta)
                return meta
            else
                print(filename..({e:match(":.+")})[1])
            end
        else
            error("[SCENE LOADER ERROR] "..err, 2)
        end
    end
end

function hud.open(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    meta.__status = "open"
    if meta.__env.open then
        meta.__env.open(self)
    end
end

function hud.close(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    meta.__status = "close"
    if meta.__env.close then
        meta.__env.close(self)
    end
end

function hud.draw(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    if meta.__env.draw then
        meta.__env.draw(self)
    end
end

function hud.event(self, ...)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    if meta.__env.event then
        meta.__env.event(self, ...)
    end
end

function hud.update(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    if meta.__env.update then
        meta.__env.update(self)
    end
end

function hud.getName(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    return meta.__name
end

function hud.getName(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    return meta.__name
end

function hud.isOpen(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    return meta.__status == "open"
end

function hud.isClose(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    return meta.__status == "close"
end

function hud.getZIndex(self)
    check(self, "hud", 1)

    local meta = getmetatable(self)
    for k, v in pairs(hudorder) do
        local meta_hud = getmetatable(v)
        if meta_hud.__name == meta.__name then
            return k
        end
    end
end

function hud.getByName(name)
    check(self, "string", 1)

    for k, v in pairs(hudorder) do
        local meta_hud = getmetatable(v)
        if meta_hud.__name == name then
            return v
        end
    end
end

function hud.setZIndex(self, zindex)
    check(self, "hud", 1)
    cassert(type(zindex) == "nil" or type(zindex) == "number", "zindex must be a number", 3)

    local meta = getmetatable(self)
    for k, v in pairs(hudorder) do
        local meta_hud = getmetatable(v)
        if meta_hud.__name == meta.__name then
            table.remove(hudorder, k)
            table.insert(hudorder, zindex, self)
            return
        end
    end
end