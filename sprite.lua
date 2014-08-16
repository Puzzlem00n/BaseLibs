local Sprite = class("Sprite")

function Sprite:initialize(x, y)
	self.x = x
	self.y = y
	self.vx = 0
	self.vy = 0
	--self.btmFlag = false
end

function Sprite:tileUpdate()
	local f_left, f_right = self.x + self.vx, self.x + self.w + self.vx
	local vxsign = sign(self.vx)
	--if math.abs(self.vx) > tilesize then self.vx = vxsign*tilesize end
	if vxsign == 1 then
		if checkMap(f_right, self.y) or checkMap(f_right, self.y + self.h - 1) or checkMap(f_right, self.y + self.h / 2) then
			self.x = (math.floor(f_right / tilesize) * tilesize) - self.w
			self.vx = 0
		end
	elseif vxsign == -1 then
		if checkMap(f_left, self.y) or checkMap(f_left, self.y + self.h - 1) or checkMap(f_left, self.y + self.h / 2) then
			self.x = math.floor(self.x / tilesize) * tilesize
			self.vx = 0
		end
	end
	
	self.x = self.x + self.vx
	
	local f_top, f_bottom = self.y + self.vy, self.y + self.h + self.vy
	local vysign = sign(self.vy)
	--if math.abs(self.vy) > tilesize then self.vy = vysign*tilesize end
	if vysign == 1 then
		if checkMap(self.x, f_bottom) or checkMap(self.x + self.w - 1, f_bottom) or checkMap(self.x + self.w / 2, f_bottom) then
			self.y = (math.floor(f_bottom / tilesize) * tilesize) - self.h
			self.vy = 0
			--self.btmFlag = true
		--else self.btmFlag = false
		end
	elseif vysign == -1 then
		if checkMap(self.x, f_top) or checkMap(self.x + self.w - 1, f_top) or checkMap(self.x + self.w / 2, f_top) then
			self.y = math.floor(self.y / tilesize) * tilesize
			self.vy = 0
		end
		--self.btmFlag = false
	end
	
	self.y = self.y + self.vy
end

return Sprite