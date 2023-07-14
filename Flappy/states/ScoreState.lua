--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

BRONZE = love.graphics.newImage('bronze.png')
SILVER = love.graphics.newImage('silver.png')
GOLD = love.graphics.newImage('gold.png')
--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    --love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
    if self.score >= 2 and self.score < 5 then
        
        love.graphics.draw(BRONZE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, .5, .5, BRONZE:getWidth()/2, BRONZE:getHeight()/2 )
        love.graphics.printf("You earned a Bronze Medal!", 0, 64, VIRTUAL_WIDTH, 'center')

    elseif self.score >= 5 and self.score < 7 then
        love.graphics.draw(SILVER, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, .5, .5, SILVER:getWidth()/2, SILVER:getHeight()/2 )
        love.graphic.printf("Nice you earned a Silver Medal!", 0, 64, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 7 then
        love.graphics.draw(GOLD, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, .5, .5, GOLD:getWidth()/2, GOLD:getHeight()/2)
        love.graphics.printf("WOAH you earned a GOLD MEDAL!", 0, 64, VIRTUAL_WIDTH, 'center')
    else 
        love.graphics.printf('Oof! You Lost!', 0 ,64, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')

    
end