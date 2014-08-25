local Sprite = require "ents.sprite"
local Blank = class("Blank", Sprite)

function Blank:initialize(x, y)
	Sprite.initialize(self, x, y, 32, 32)
end

function Blank:update(dt)
end

function Blank:draw()
end

return Blank