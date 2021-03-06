---@class
local dropdown = {}
dropdown.__index = dropdown

---new
---@param x number
---@param y number
---@param buttonX number
---@param buttonY number
---@param params table
function dropdown.new(x, y, buttonX, buttonY, params)
    local self = { }

    assert(x)
    assert(y)

    self.x = x
    self.y = y

    self.sx = buttonX
    self.sy = #params.buttons * buttonY

    self.color = params.color or {1,1,1,1}
    self.rectType = params.rectType or "line"

    self.buttons = { }
    for index, buttonData in pairs(params.buttons) do
        self.buttons[index] = buttonClass.new(x, y, buttonX, buttonY, buttonData)
    end

    return setmetatable(self, dropdown)
end

function dropdown:update(dt)

end

function dropdown:draw()
    love.graphics.setColor(unpack(self.color))
    love.graphics.rectangle(self.rectType, self.x, self.y, self.sx, self.sy)
end

return dropdown