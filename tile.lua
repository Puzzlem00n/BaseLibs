local tile = {}

local micro = .001
local tileSize

--A shortcut to checkMapPoint() that can check three coordinates at a time.
local function checkMap(side, t, axis)
	if axis then
		if tile.checkMapPoint(t[1], side) or
		tile.checkMapPoint(t[2], side) or
		tile.checkMapPoint(t[3], side) then
		return true end
	else
		if tile.checkMapPoint(side, t[1]) or
		tile.checkMapPoint(side, t[2]) or
		tile.checkMapPoint(side, t[3]) then
		return true end
	end
end

local function tileCheckAxis(a,b,l1,l2,v,axis)
	local check = true
	local n = 0
	
	local vsign = sign(v)
	--local goAgain = true
	--while (goAgain) do
		--tv = math.min(v, tileSize)
		local fmin, fplus = a + v, a + l1 + v
		check = true
		if vsign == 1 then side = fplus divi = fplus
		elseif vsign == -1 then side = fmin divi = a
		else check = false end
		if check and checkMap(side, {b, b+l2-micro, b+l2/2}, axis) then
			a = math.floor(divi / tileSize) * tileSize
			if vsign == 1 then a = a - l1 end
			v = 0
			n = -vsign
			goAgain = false
		end
		a = a + v
	--end
	return a, v, n
end

--Public interface:

--Sets the size of each tile in the grid.
function tile.setSize(x) tileSize = x return tileSize end

--Gets the size of each tile in the grid.
function tile.getSize() return tileSize end

--OVERRIDABLE. Returns true if the given point is inside a solid tile.
function tile.checkMapPoint(x, y)
	local check = map[math.floor(y/tileSize) + 1][math.floor(x/tileSize) + 1]
	if check == 1 then
		return true
	end
end

--Takes a table of rectangle coors, dimensions and velocities. Returns
--what the coors should be post-collision and the two collisions' normals.
function tile.tileCheck(rect)
	local x, y = rect.x, rect.y
	local nx, ny = 0
	local w, h = rect.w, rect.h
	local vx, vy = rect.vx, rect.vy
	
	x, vx, nx = tileCheckAxis(x,y,w,h,vx,false)
	y, vy, ny = tileCheckAxis(y,x,h,w,vy,true)
	
	return x, y, nx, ny
end

return tile