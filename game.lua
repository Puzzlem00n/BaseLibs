Game = States:addState("Game")

function Game:enteredState()
end

function Game:update(dt)
end

function checkMap(x, y)
	local check = map[math.floor(y/tilesize) + 1][math.floor(x/tilesize) + 1]
	if check == 1 then return true end
end

function sign(x)
	return x < 0 and -1 or (x > 0 and 1 or 0)
end

function Game:draw()
end