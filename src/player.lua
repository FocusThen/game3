player = world:newBSGRectangleCollider(115, 168, 10, 15, 1)
player:setCollisionClass("Player")
player:setFixedRotation(true)
player.startX = 0
player.startY = 0
player.speed = 120
player.grounded = false
player.animTimer = 0
player.direction = 1
player.isMoving = false
player.animSpeed = 0.14

local state = { NONE = -1, NORMAL = 1, ROLL = 0.5, DEAD = 3, TALK = 10 }
player.state = state.NORMAL

player.grid = anim8.newGrid(32, 32, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())
player.animations = {}
player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), player.animSpeed)
player.animations.run = anim8.newAnimation(player.grid("2-8", 3), player.animSpeed)
player.animations.roll = anim8.newAnimation(player.grid("1-8", 6), player.animSpeed)
player.animations.hit = anim8.newAnimation(player.grid("1-4", 7), player.animSpeed)
player.animations.dead = anim8.newAnimation(player.grid("1-4", 8), player.animSpeed)

player.anim = player.animations.idle

player.interactObject = nil

player.checkpointMap = ""
player.checkpointX = 0
player.checkpointY = 0

function player:update(dt)
	if player.state == state.TALK then
		player:checkGrounded()
		player:setAnimation()
		return
	end

	if player.state >= state.DEAD then
		return
	end

	if player.animTimer > 0 then
		player.animTimer = player.animTimer - dt
		if player.animTimer < 0 then
			player.animTimer = 0
		end
	end

	player:checkGrounded()
	player.isMoving = false

	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		player:applyForce(200, 0)
		player.isMoving = true
		player.direction = 1

		local pvx, pvy = player:getLinearVelocity()
		if pvx > player.speed then
			player:setLinearVelocity(player.speed, pvy)
		end
	end

	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		player:applyForce(-200, 0)
		player.isMoving = true
		player.direction = -1

		local pvx, pvy = player:getLinearVelocity()
		if pvx < -1 * player.speed then
			player:setLinearVelocity(-1 * player.speed, pvy)
		end
	end

	player:setAnimation()
	player:checkInteract()

  player.anim:update(dt)

	if player:enter("Danger") or player:enter("Enemy") then
		player:die()
	end
end

function player:draw()
	if player.state == state.DEAD then
		return
	end
	local px, py = player:getPosition()

	player.anim:draw(sprites.playerSheet, px, py - 1, nil, player.direction, 1, 16, 16)

	-- if player.interactObject and player.interactObject.canShowIcon then
	--     setWhite()
	--     love.graphics.draw(sprites.ui.upButton, player.interactObject.iconX, player.interactObject.iconY, nil, nil, nil, 12, 12)
	-- end
end

function player:checkGrounded()
	local px, py = player:getPosition()
	local colliders = world:queryRectangleArea(px - 3, py + 7, 5, 2, { "Platform", "Ground" })
	if #colliders > 0 then
		player.grounded = true
	else
		player.grounded = false
	end
end

function player:setAnimation()
	local pvx, pvy = player:getLinearVelocity()

	if player.grounded then
		if player.isMoving then
			player.anim = player.animations.run
		else
			player.anim = player.animations.idle
		end

		if
			not love.keyboard.isDown("right")
			and not love.keyboard.isDown("left")
			and not love.keyboard.isDown("d")
			and not love.keyboard.isDown("a")
		then
			player:setLinearVelocity(pvx * 0.92, pvy)
		end
	end
end

function player:jump()
	if player.state ~= state.NORMAL then
		return
	end
	local pvx, pvy = player:getLinearVelocity()
	if player.grounded then
		player:setLinearVelocity(pvx, -300)
	end
end

function player:respawn()
	player:setPosition(player.startX, player.startY)
	player:reset()
	player.state = state.NORMAL
end

function player:reset()
	player:setLinearVelocity(0, 0)
	player.isMoving = false
	player.anim = player.animations.idle
end

-- look after
function player:checkInteract()
	-- local px, py = player:getPosition()
	-- local colliders = world:queryCircleArea(px, py, 7, { "Interact" })
	-- if #colliders > 0 and player.grounded then
	-- 	player.interactObject = colliders[1].parent
	-- else
	-- 	player.interactObject = nil
	-- end
end

function player:interact()
	-- if player.interactObject and player.state == 1 then
	-- 	player.interactObject:interact()
	-- 	player:reset()
	-- end
end
