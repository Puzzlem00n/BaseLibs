local Game = States:addState("Game")

--local bumplib = require "third.kikito.bump"

function Game:enteredState()
	--bump = bumplib.newWorld(64)
	love.graphics.setBackgroundColor(16, 15, 21)
	--player = Player:new(100,100)
end

function Game:update(dt)
	--player:update(dt)
end

function Game:draw()
	--player:draw()
end

return Game