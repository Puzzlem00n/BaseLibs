local Game = States:addState("Game")

local bumplib = require "third.kikito.bump"

function Game:enteredState()
	bump = bumplib.newWorld()
end

function Game:update(dt)
end

function Game:draw()
end

return Game