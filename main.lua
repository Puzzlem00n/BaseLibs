require "req"
require "states"

function love.load()
	gamestate = States:new()
	gamestate:gotoState("Menu")
	maxframe = 0.1
	width, height = love.graphics.getWidth(), love.graphics.getHeight()
end

function love.update(dt)
	local gdt = dt
	while gdt > 0 do
		local nowdt = math.min(maxframe, gdt)
		if gamestate.update then gamestate:update(nowdt) end
		gdt = gdt - maxframe
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	--arc.check_keys(dt)
	--lurker.update(dt)
end

function love.draw()
	gamestate:drawCalls()
	love.graphics.setColor(255,255,255)
	--arc.clear_key()
	--gui.core.draw()
end

function love.mousepressed(x, y, button)
	if gamestate.mousepressed then
		gamestate:mousepressed(x, y, button)
	end
end

function love.mousereleased(x, y, button)
	if gamestate.mousereleased then
		gamestate:mousereleased(x, y, button)
	end
end

function love.keypressed(key, code)
	if gamestate.keypressed then
		gamestate:keypressed(key)
	end
	--arc.set_key(key)
	--gui.keyboard.pressed(key, code)
end

function love.keyreleased(key)
	if gamestate.keyreleased then
		gamestate:keyreleased(key)
	end
end

function love.focus(f)
  if not f then
    gamestate:pushState("Pause")
  else
    gamestate:popState("Pause")
  end
end