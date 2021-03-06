--[[

    main file for CCIL
    written by kyojin 2021

]]

buttonClass = require "src/UI/button"
dropdownClass = require "src/UI/dropdown"

function love.load()

    --remove the ugly anti-aliasing
    love.graphics.setDefaultFilter("nearest", "nearest")

    font = love.graphics.newFont("assets/font.ttf", 32)

    --create ui storage and top bar buttons.
    --todo: separate these dropdown buttons into their own modules to reduce clutter
    --todo: render and update dropdown objects
    buttons = { }
    buttons[#buttons + 1] = buttonClass.new(0, 0, 75, 30, {
        name = "file",
        color = {1,1,1,1},
        rectType = "line",
        text = "File",
        font = font,
        func = function(parent)
            if parent.open then
                local dropdown = dropdownClass.new(0, 30, 150, 25, {
                    color = {1,1,1,1},
                    rectType = "line",
                    buttons = {
                        {name = "test1", text="Test 1", dropdown = dropdown, func = function(parent)
                            print("Test 1")
                        end},
                        {name = "test2", text = "Test 2", dropdown = dropdown, func = function(parent)
                            print("Test 2")
                        end},
                        {name = "test3", text = "Test 3", dropdown = dropdown, func = function(parent)
                            print("Test 3")
                        end}
                    }
                })
            else
                --todo: close dropdown and delete object once complete.
            end
        end
    })
    buttons[#buttons + 1] = buttonClass.new(75, 0, 75, 30, {
        name = "edit",
        color = {1,1,1,1},
        rectType = "line",
        text = "Edit",
        font = font,
        func = function()
            print("Edit")
        end
    })

end

function love.update(dt)
    for _, button in pairs(buttons) do
        button:update(dt)
    end
end

function love.draw()
    for _, button in pairs(buttons) do
        button:draw()
    end
end

function love.mousepressed(x, y, b, isTouch)
    if b == 1 then
        for _, button in pairs(buttons) do
            if (x >= button.x and x <= button.x + button.sx) and (y >= button.y and y <= button.y + button.sy) then
                button:mouseclick()
            end
        end
    end
end

function love.keypressed(key)

    if key == "escape" then
        love.window.close()
    end
end