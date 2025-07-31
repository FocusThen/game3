player = world:newBSGRectangleCollider(0, 0, 10, 20, 1)
player.x = 0
player.y = 0
player.walking = false
player.health = 1
player.speed = 140
player.animSpeed = 0.14
player.animTimer = 0
player.rollDelayTimer = 0
player.baseDamping = 12 -- base damping ?
player.direction = 1
player.grounded = true

local state = { NONE = -1, NORMAL = 1, ROLL = 0.5, DEAD = 3 }
player.state = state.NORMAL

player:setCollisionClass("Player")
player:setFixedRotation(true)
player:setLinearDamping(player.baseDamping)

player.grid = anim8.newGrid(32, 32, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())

player.animations = {}
player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), player.animSpeed)
player.animations.run = anim8.newAnimation(player.grid("2-8", 3), player.animSpeed)
player.animations.roll = anim8.newAnimation(player.grid("1-8", 6), player.animSpeed)
player.animations.hit = anim8.newAnimation(player.grid("1-4", 7), player.animSpeed)
player.animations.dead = anim8.newAnimation(player.grid("1-4", 8), player.animSpeed)

player.anim = player.animations.idle

player.buffer = {} -- input buffer

function player:update(dt)
	-- if pause.active then player.anim:update(dt) end
	if player.state == state.NONE then
		return
	end

	if player.rollDelayTimer > 0 then
		player.rollDelayTimer = player.rollDelayTimer - dt
	end

	if player.state == state.NORMAL then
		player:setLinearDamping(player.baseDamping)

		if player.body then
			local colliders = world:queryRectangleArea(player:getX() - 7, player:getY() + 10, 12, 2, { "Ground" })
			if #colliders > 0 then
				player.grounded = true
			else
				player.grounded = false
			end
			player.walking = false

			local px, py = player:getPosition()
			if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
				player:setX(px + player.speed * dt)
				player.walking = true
				player.direction = 1
			end
			if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
				player:setX(px - player.speed * dt)
				player.walking = true
				player.direction = -1
			end
		end

		if player.grounded then
			if player.walking then
				player.anim = player.animations.run
			else
				player.anim = player.animations.idle
			end
		end

		--
		-- Player Effects
		-- if player.walking then
		-- 	player.dustTimer = player.dustTimer - dt
		-- 	if player.dustTimer < 0 then
		-- 		player.dustTimer = 0.22
		-- 		effects:spawn("walkDust", player:getX(), player:getY() + 6, { dir = vec:normalized() })
		-- 	end
		-- else
		-- 	player.dustTimer = 0
		-- end

		player.anim:update(dt)

		if player.animTimer > 0 then
			player.animTimer = player.animTimer - dt
			if player.animTimer < 0 then
				player.animTimer = 0
			end
		end

	elseif player.state == state.ROLL then
    -- player:checkTransition()
		player.anim:update(dt)

		player.animTimer = player.animTimer - dt
		if player.animTimer < 0 then
			player.state = state.NORMAL
			player.animTimer = 0
			player.rollDelayTimer = 0.3
		end
	end
end

function player:draw()
	player.anim:draw(sprites.playerSheet, player:getX(), player:getY(), nil, player.direction, 1, 16, 16)
end

function player:roll()
	if player.state ~= state.NORMAL or player.rollDelayTimer > 0 then
		player:addToBuffer("roll")
		return
	end
	player.state = state.ROLL
	player.animTimer = 0.3
	player:setLinearDamping(1.75)
	player.anim = player.animations.roll

	player:setLinearVelocity(player.speed * 2 * player.direction, 0)
end

function player:processBuffer(dt)
	for i = #player.buffer, 1, -1 do
		player.buffer[i][2] = player.buffer[i][2] - dt
	end
	for i = #player.buffer, 1, -1 do
		if player.buffer[i][2] <= 0 then
			table.remove(player.buffer, i)
		end
	end

	if player.state == 0 then
		player:useBuffer()
	end
end

function player:addToBuffer(action)
	if action == "roll" and player.state == 0.5 then
		table.insert(player.buffer, { action, 0.1 })
	else
		table.insert(player.buffer, { action, 0.25 })
	end
end

function player:useBuffer()
	local action = nil
	if #player.buffer > 0 then
		action = player.buffer[1][1]
	end

	-- clear buffer
	for k, v in pairs(player.buffer) do
		player.buffer[k] = nil
	end

	if action == nil then
		return
	end

	if action == "roll" then
		player:roll()
	end
end
