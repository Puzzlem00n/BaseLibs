Menu = States:addState("Menu")

local step = 1
local menustring = "Press enter!"

function Menu:enteredState()
end

function Menu:update(dt)
	menustring = "Press enter!"
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