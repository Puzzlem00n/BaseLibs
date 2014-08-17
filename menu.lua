local Menu = States:addState("Menu")

local step
local menustring = "Press enter!"

function Menu:enteredState()
	love.graphics.setBackgroundColor(230, 225, 206)
	step = 1
end

function Menu:update(dt)
end

function Menu:keypressed(key)
	if key == "return" then self:gotoState("Game")
	elseif step == 1 and key == "up" then step = step + 1
	elseif step == 2 and key == "up" then step = step + 1
	elseif step == 3 and key == "down" then step = step + 1
	elseif step == 4 and key == "down" then step = step + 1
	elseif step == 5 and key == "left" then step = step + 1
	elseif step == 6 and key == "right" then step = step + 1
	elseif step == 7 and key == "left" then step = step + 1
	elseif step == 8 and key == "right" then step = step + 1
	elseif step == 9 and key == "b" then step = step + 1
	elseif step == 10 and key == "a" then menustring = "KONAMI CODE."
	else step = 1 end
end

function Menu:draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(menustring, 0, 0)
end

return menu