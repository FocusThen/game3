function love.load()
	math.randomseed(os.time())

	colliderToggle = false

	require("src/startup/gameStart")
	gameStart()

	-- loadMap("menu")
	-- dj.volume("effect", 1)
end

function love.update(dt)
	updateAll(dt)
end

function love.draw()
	-- drawBeforeCamera()

	cam:attach()
	drawCamera()
	if colliderToggle then
		world:draw()
	end
	cam:detach()

	-- drawAfterCamera()
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
	if key == "z" then
		player:roll() -- check if better to do this in player:update()
	end
end
