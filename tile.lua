local tile = {}

local micro = .001
local tileSize

--Converts pixel coordinates to grid coordinates and passes them to checkGrid.
local function checkPoint(x, y)
	return tile.checkGrid(math.floor(y/tileSize), math.floor(x/tileSize))
end

--Decides how to order the parameters passed to checkPoint to supposedly reduce
--complications. If axis is true, the x axis is being checked, and y otherwise.
local function checkPointAxis(x, y, axis)
	if axis then ans = checkPoint(x, y)
	else ans = checkPoint(y, x) end
	return ans
end

--A shortcut to checkMapPoint() that can check three coordinates at a time.
local function checkPoints(edge, t, axis)
	if checkPointAxis(t[1], edge, axis) or
	checkPointAxis(t[2], edge, axis) or
	checkPointAxis(t[3], edge, axis) then
	return true end
end

--Collides either axis with the tiles and returns the axis's
--post-collision coordinate, velocity and normal.
local function collideAxis(a,b,l1,l2,v,axis)
	local check = true
	local n = 0
	
	local vsign = sign(v)
	--local goAgain = true
	--while (goAgain) do
		--tv = math.min(v, tileSize)
		local fmin, fplus = a + v, a + l1 + v
		check = true
		if vsign == 1 then edge = fplus divi = fplus
		elseif vsign == -1 then edge = fmin divi = a
		else check = false end
		if check and checkPoints(edge, {b, b+l2-micro, b+l2/2}, axis) then
			a = math.floor(divi / tileSize) * tileSize
			if vsign == 1 then a = a - l1 end
			v = 0
			n = -vsign
			--goAgain = false
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

--OVERRIDABLE. Returns true if the given point on the tile grid is solid,
--i.e. should be collided with.
function tile.checkGrid(x, y)
	local check = map[x + 1][y + 1]
	if check == 1 then
		return true
	end
end

--Takes a table of rectangle coors, dimensions and velocities. Returns a
--table with post-collision coors, velocities and normals for each axis.
function tile.collide(rect)
	local x, y = rect.x, rect.y
	local nx, ny = 0
	local w, h = rect.w, rect.h
	local vx, vy = rect.vx, rect.vy
	
	x, vx, nx = collideAxis(x,y,w,h,vx,false)
	y, vy, ny = collideAxis(y,x,h,w,vy,true)
	
	return {x = x, y = y, vx = vx, vy = vy, nx = nx, ny = ny}
end

return tile