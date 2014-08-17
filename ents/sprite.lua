local Sprite = class("Sprite")

local micro = .000001

function Sprite:initialize(x, y, w, h)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.vx = 0
	self.vy = 0
	bump:add(self, self.x, self.y, self.w, self.h)
end

function Sprite:tileCheck()
	local x, y = self.x, self.y
	local nx, ny = 0
	local w, h = self.w, self.h
	local vx, vy = self.vx, self.vy
	
	local f_left, f_right = x + vx, x + w + vx
	local vxsign = sign(vx)
	--if math.abs(vx) > tilesize then vx = vxsign*tilesize end
	if vxsign == 1 then
		if checkMap(f_right, y) or checkMap(f_right, y + h - micro) or checkMap(f_right, y + h / 2) then
			x = (math.floor(f_right / tilesize) * tilesize) - w
			vx = 0
			nx = -1
		end
	elseif vxsign == -1 then
		if checkMap(f_left, y) or checkMap(f_left, y + h - micro) or checkMap(f_left, y + h / 2) then
			x = math.floor(x / tilesize) * tilesize
			vx = 0
			nx = 1
		end
	end
	x = x + vx
	
	local f_top, f_bottom = y + vy, y + h + vy
	local vysign = sign(vy)
	--if math.abs(vy) > tilesize then vy = vysign*tilesize end
	if vysign == 1 then
		if checkMap(x, f_bottom) or checkMap(x + w - micro, f_bottom) or checkMap(x + w / 2, f_bottom) then
			y = (math.floor(f_bottom / tilesize) * tilesize) - h
			vy = 0
			ny = -1
		end
	elseif vysign == -1 then
		if checkMap(x, f_top) or checkMap(x + w - micro, f_top) or checkMap(x + w / 2, f_top) then
			y = math.floor(y / tilesize) * tilesize
			vy = 0
			ny = 1
		end
	end
	y = y + vy
	
	return x, y, nx, ny
end

return Sprite