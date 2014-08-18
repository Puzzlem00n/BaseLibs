Sprite = require "ents.sprite"
local Player = class("Player", Sprite)

function Player:initialize(x, y)
	Sprite.initialize(self, x, y, 34, 34)
end

function Player:update(dt)
	self.speed = 180 * dt
	if love.keyboard.isDown("left") then
		self.vx = -self.speed
	end
	if love.keyboard.isDown("right") then
		self.vx = self.speed
	end
	if love.keyboard.isDown("up") then
		self.vy = -self.speed
	end
	if love.keyboard.isDown("down") then
		self.vy = self.speed
	end
	
	if self.vx ~= 0 and self.vy ~= 0 then
		self.vx = (self.vx * math.sqrt(2))/2
		self.vy = (self.vy * math.sqrt(2))/2
	end
	
	if not love.keyboard.isDown("left","right") then
		self.vx = 0
	end
	if not love.keyboard.isDown("up","down") then
		self.vy = 0
	end
	
	local cols = tile.collide(self)
	self.x, self.y = cols.x, cols.y
	self.vx, self.vy = cols.vx, cols.vy
end

function Player:draw()
	love.graphics.setColor(155, 47, 35)
	love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

return Player