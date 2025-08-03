platforms = {}

function spawnPlatform(x, y, width, height, name, size)
	local platform = world:newRectangleCollider(x, y, 16, 16, { collision_class = "Ground" })
	platform.direction = 1
	platform.size = "small"
	platform.speed = 10

	if size then
		platform.size = size
	end

	if platform.size == "small" then
		platform.width = 16
		platform.height = 16
	elseif platform.size == "big" then
		platform.width = 20
		platform.height = 15
	end

	table.insert(platforms, platform)
end

function platforms:update(dt)
	for _, p in ipairs(platforms) do
		local px, py = p:getPosition()
    p:setX(px + p.speed * dt * p.direction)
	end
end
function platforms:draw()
	for _, p in ipairs(platforms) do
	end
end
