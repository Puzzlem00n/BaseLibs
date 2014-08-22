local Sprite = class("Sprite")

function Sprite:initialize(x, y, w, h)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.vx = 0
	self.vy = 0
	--bump:add(self, self.x, self.y, self.w, self.h)
end

function Sprite:move(x,y)
	self.x, self.y = x, y
	--bump:move(self, x, y)
end

return Sprite