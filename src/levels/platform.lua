platforms = {}

function spawnPlatform(x, y, name, size)
	local platform = world:newRectangleCollider(x, y, 12, 8, { collision_class = "Ground" })
	platform:setType("static")
	platform.direction = 1
	platform.size = "small"
	platform.speed = 10
	platform.width = 12
	platform.height = 8
	platform.sprites = {}
	platform.sprites.small = love.graphics.newQuad(0, 0, 16, 16, sprites.environment.platform:getDimensions())
	platform.sprites.big = love.graphics.newQuad(16, 0, 32, 16, sprites.environment.platform:getDimensions())
	platform.sprite = platform.sprites.small

	if size then
		platform.size = size
	end

	if platform.size == "small" then
		platform.width = 20
		platform.sprite = platform.sprites.small
	elseif platform.size == "big" then
		platform.width = 20
		platform.sprite = platform.sprites.big
	end

	table.insert(platforms, platform)
end

function platforms:update(dt)
	for _, p in ipairs(platforms) do
		local px, py = p:getPosition()
		-- p:setX(px + p.speed * dt * p.direction)
	end
end

function platforms:draw()
	for _, p in ipairs(platforms) do
		local px, py = p:getPosition()
		love.graphics.draw(sprites.environment.platform, p.sprite, px - 8, py - 4)
	end
end
