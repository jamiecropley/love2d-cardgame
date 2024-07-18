-- main.lua
function love.load()
    -- Set the window dimensions
    love.window.setMode(800, 600)
    
    -- Initialize card properties
    card = {}
    card.x = 350
    card.y = 250
    card.width = 100
    card.height = 150
    card.color1 = {0.6, 0.8, 0.6} -- light green
    card.color2 = {1, 0.8, 0.6} -- light orange
    card.currentColor = card.color1
    card.number = nil
    card.message = ""
    
    -- Set the font size
    font = love.graphics.newFont(20)
    love.graphics.setFont(font)
end

function love.draw()
    -- Set the current color
    love.graphics.setColor(card.currentColor)
    
    -- Draw the card (rectangle)
    love.graphics.rectangle("fill", card.x, card.y, card.width, card.height)
    
    -- Draw the number on the card if it exists
    if card.number then
        love.graphics.setColor(1, 1, 1) -- white color for text
        love.graphics.printf(card.number, card.x, card.y + card.height / 2 - 10, card.width, "center")
    end
    
    -- Draw the message below the card
    love.graphics.setColor(1, 1, 1) -- white color for text
    love.graphics.printf(card.message, 0, card.y + card.height + 30, 800, "center")
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- left mouse button
        if x >= card.x and x <= card.x + card.width and y >= card.y and y <= card.y + card.height then
            -- Flip the card color and assign a random number if it's turning orange
            if card.currentColor == card.color1 then
                card.currentColor = card.color2
                card.number = love.math.random(1, 10) -- generate a random number between 1 and 10
                
                -- Display message based on the number
                if card.number == 5 then
                    card.message = "You have won"
                else
                    card.message = "Game lost"
                end
            else
                card.currentColor = card.color1
                card.number = nil
                card.message = ""
            end
        end
    end
end
