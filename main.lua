function love.load()
	math.randomseed(os.time())

  --debug variables
  d1= 0
  d2= 0

	colliderToggle = false

	require("src/startup/gameStart")
	gameStart()
	loadMap("Level1")
end

function love.update(dt)
	updateAll(dt)
end

function love.draw()
	drawBeforeCamera()

	cam:attach()
	drawCamera()
	if colliderToggle then
		world:draw()
	end
	cam:detach()

	drawAfterCamera()

	local debug = require("src/debug")
	-- debug:d()
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "q" then
		colliderToggle = not colliderToggle
	end

	if key == "space" or key == "w" then
		player:jump()
	end

	--  TODO: add roll
	if key == "z" then
		player:roll() -- check if better to do this in player:update()
	end
end
