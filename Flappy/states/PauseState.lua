PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') or love.keyboard.wasPressed('Tab') then
        sounds['Pause']:play()
        gStateMachine:change(play)
    end
end

function PauseState:render()

    for k, pair in pairs(pipes) do
        pair:render()
    end

end

function PauseState:enter()
    scrolling = false
end

function PauseState:exit()
    scrolling = true

end

