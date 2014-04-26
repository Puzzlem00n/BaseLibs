Intro = States:addState("Intro")

function Intro:enteredState()
	self.love = love.graphics.newImage("assets/intro/love.png")
	self.hearts = love.graphics.newImage("assets/intro/hearts.png")
end

function Intro:update(dt)
end

function Intro:draw()
	love.graphics.draw(self.love, width/2-256, height/2-128)
	for x=0, width, 64 do
		for y=0, height, 64 do
			love.graphics.draw(self.hearts, x*64, y*64)
		end
	end
end