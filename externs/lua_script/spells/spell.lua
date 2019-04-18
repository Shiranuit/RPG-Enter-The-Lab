spell = {}

function spell.createFromFile(filename)
    check(filename, "string", 1)
    local handle = io.open(filename, "r")
    if handle then
        local code = handle:read("*all")
        handle:close()
        local env = setmetatable({}, {__index = _G})
        local func, err = load(code, filename, "t", env)
        if func then
            local success, ret = pcall(func)
            if success then
                return setmetatable({}, {
                    __type = "spell",
                    __env = env,
                    __cd = lsfml.clock.create(),
                    __isInCD = false,
                    __active = false,
                    __index = function(self, key)
                        local meta = getmetatable(self)

                        if spell[key] then
                            return spell[key]
                        else
                            return meta.__env[key]
                        end
                    end,
                })
            else
                error(err, 2)
            end
        else
            error("[ERROR LOADING SPELL] "..err, 2)
        end
    else
        error("File not found '"..filename.."'", 2)
    end
end

function spell.getName(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__env["getName"] then
        return meta.__env.getName()
    end
end

function spell.getCost(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__env["getCost"] then
        return meta.__env.getCost()
    else
        return 0
    end
end

function spell.getCooldown(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    return self:getMaxCooldown() - meta.__cd:getEllapsedTime() / 1000000
end

function spell.isInCooldown(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    return meta.__isInCD
end

function spell.cast(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__env["cast"] then
        return meta.__env.cast()
    end
end

function spell.getMaxCooldown(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__env["getMaxCooldown"] then
        return meta.__env.getMaxCooldown()
    else
        return 0
    end
end

function spell.cooldownStartAt(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__env["cooldownStartAt"] then
        return meta.__env.cooldownStartAt()
    else
        return "end"
    end
end

function spell.update(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    if meta.__active and not meta.__isInCD then
        meta.__cd:restart()
        meta.__isInCD = false
        self:cast()
    elseif not meta.__active then
        meta.__isInCD = true
    end
    if meta.__isInCD and self:getCooldown() < 0 then
        meta.__isInCD = false
    end
end

function spell.activate(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    meta.__active = true
end

function spell.deactivate(self)
    check(self, "spell", 1)

    local meta = getmetatable(self)
    meta.__active = false
end
