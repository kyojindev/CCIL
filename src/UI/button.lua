---@class  button
local button = {}
button.__index = button

---new
---@param x number
---@param y number
---@param sx number
---@param sy number
---@param params table
function button.new(x, y, sx, sy, params)
    local self = { }

    assert(x)
    assert(y)

    self.x = x
    self.y = y
    self.sx = sx or 1
    self.sy = sy or 1

    self.name = params.name or "UnnamedButton"
    self.img = params.img and love.graphics.newImage(params.img) or nil
    self.font = params.font or font
    self.text = params.text and love.graphics.newText(params.font, params.text) or love.graphics.newText(font, "Missing text")
    self.color = params.color or {1,1,1,1}
    self.rectType = params.rectType or "line"

    assert(params.func)
    self.func = params.func

    --parent
    self.dropdown = params.dropdown or false

    self.open = false

    return setmetatable(self, button)
end

function button:onHoverEnter()

end

function button:onHoverExit()

end

function button:mouseclick()
    self.func(self)
end

function button:update(dt)

end

function button:draw()
    if self.img then
        love.graphics.setColor(unpack(self.color))
        love.graphics.draw(self.img, self.x, self.y, nil, self.sx, self.sy)
    else
        if self.text then
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(self.text, self.x + self.sx / 4, self.y, nil, 1, 1)
        end
        love.graphics.setColor(unpack(self.color))
        love.graphics.rectangle(self.rectType, self.x, self.y, self.sx, self.sy)
    end
end

return button