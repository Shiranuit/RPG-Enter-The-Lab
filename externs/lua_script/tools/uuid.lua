-- =========================================
-- =                  UUID                 =
-- =========================================

uuid = {}
local function getHex(num)
    local txt = string.format("%x", num)
    return string.rep("0", 2 - #txt)..txt
end

function uuid.randomUUID()
    local bytes = {}
    for i=1, 16 do
        bytes[i] = math.random(0, 255)
    end
    bytes[6] = bytes[6] & 0x0F
    bytes[6] = bytes[6] | 0x40
    bytes[8] = bytes[8] & 0x3f
    bytes[8] = bytes[8] | 0x80
    for i= 1, 16 do
        bytes[i] = getHex(bytes[i])
    end
    return table.concat(bytes, "")
end