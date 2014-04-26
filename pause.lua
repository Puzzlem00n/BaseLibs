Pause = States:addState("Pause")

function Pause:enteredState()
	love.audio.pause()
	self.img = love.graphics.newImage("assets/pause.png")
end

function Pause:exitedState()
	love.audio.resume()
end

function Pause:update()
end

function Pause:drawOverlay()
	love.graphics.setColor(0,0,0,170)
	love.graphics.rectangle("fill",0,0,width,height)
	love.graphics.setColor(255,255,255)
	love.graphics.draw(self.img, width/2-100, height/2-100)
end