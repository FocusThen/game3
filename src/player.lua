player = world:newBSGRectangleCollider(234, 184, 12, 12, 3)
player.x = 0
player.y = 0
player.walking = false
player.health = 1
player.speed = 90
player.animSpeed = 0.14
player.rollDelayTimer = 0
player.baseDamping = 12 -- base damping ?
player.dirX = 1
player.dirY = 1
player.prevDirX = 1
player.prevDirY = 1

local state = { NONE = -1, NORMAL = 1, ROLL = 0.5, DEAD = 3 }
player.state = state.NONE

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

-- player.buffer = {} -- input buffer

function player:update(dt)
	-- if pause.active then player.anim:update(dt) end

	player.anim:update(dt)

	if player.state == state.NONE then
		return
	end

	if player.rollDelayTimer > 0 then
		player.rollDelayTimer = player.rollDelayTimer - dt
	end

	if player.state == state.NORMAL then
		player:setLinearDamping(player.baseDamping)

		player.prevDirX = player.dirX
		player.prevDirY = player.dirY

		local dirX = 0
		local dirY = 0

		-- if pause.active then return end
		-- Player Movement
		if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
			player.anim = player.animations.run
			dirX = 1
			player.dirX = 1
		end
		if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
			player.anim = player.animations.run
			player.dirX = -1
			dirX = -1
		end

		if dirY == 0 and dirX ~= 0 then
			player.dirY = 1
		end

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

		if player.walking then
			if player.dirX == 1 then
				player.anim = player.animations.run
			else
				player.anim = player.animations.run
			end
		end

		local vec = vector(dirX, dirY):normalized() * player.speed
		if vec.x ~= 0 or vec.y ~= 0 then
			player:setLinearVelocity(vec.x, vec.y)
		end

		if dirX == 0 and dirY == 0 then
			if player.walking then
				player.walking = false
				player.anim = player.animations.idle
			end
		else
			player.walking = true
		end

		player.anim:update(dt)

		if player.animTimer > 0 then
			player.animTimer = player.animTimer - dt
			if player.animTimer < 0 then
				player.animTimer = 0
			end
		end
	elseif player.state == state.ROLL then
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
	player.anim:draw(sprites.playerSheet, player:getX(), player:getY() - 2, nil, player.dirX, 1, 16, 16)
end

function player:roll()
	local dirX = 0
	local dirY = 0

	if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		dirX = 1
	end

	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		dirX = -1
	end

	if dirX == 0 and dirY == 0 then
		return
	end -- must have some direction to roll

	player.state = 0.5
	player.animTimer = 0.3
	player:setLinearDamping(1.75)

	local dirVec = vector(dirX, dirY):normalized() * 160
	player:setLinearVelocity(dirVec.x, dirVec.y)
end
