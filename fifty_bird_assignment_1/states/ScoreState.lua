ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update(dt)
 if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
   gStateMachine:change('countdown')
 end
end

function ScoreState:render()
  -- simply render the score to the middle of the screen
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
-- added medals for different scores
  if self.score >= 10 and self.score < 15 then
    love.graphics.draw(bronzemedal, VIRTUAL_WIDTH / 2 - (bronzemedal:getWidth() / 2), 120)
  end
  if self.score >= 15 and self.score < 20 then
    love.graphics.draw(silvermedal, VIRTUAL_WIDTH / 2 - (silvermedal:getWidth() / 2), 120)
  end
  if self.score >= 20 then
    love.graphics.draw(goldmedal, VIRTUAL_WIDTH / 2 - (goldmedal:getWidth() / 2), 120)
  end

  love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
