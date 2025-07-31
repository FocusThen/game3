function gameStart()
	math.randomseed(os.time())
	love.graphics.setBackgroundColor(26 / 255, 26 / 255, 26 / 255)
	love.graphics.setDefaultFilter("nearest", "nearest")

	fullscreen = true
	setWindowSize(fullscreen, 1920, 1080)

	setScale()

	vector = require("libs/hump/vector")
	anim8 = require("libs/anim8/anim8")
	sti = require("libs/Simple-Tiled-Implementation/sti")
  gameMap = sti("maps/" .. "level1" .. ".lua")

	local windfield = require("libs/windfield/windfield")
	world = windfield.newWorld(0, 0, false)
	world:setQueryDebugDrawing(true)
end

function setWindowSize(full, width, height)
	if full then
		fullscreen = true
		love.window.setFullscreen(true)
		windowWidth = love.graphics.getWidth()
		windowHeight = love.graphics.getHeight()
	else
		fullscreen = false
		if width == nil or height == nil then
			windowWidth = 1920
			windowHeight = 1080
		else
			windowWidth = width
			windowHeight = height
		end
		love.window.setMode(windowWidth, windowHeight, { resizable = not testWindow })
	end
end

-- function initGlobals()
-- 	data = {} -- save data, will be loaded after game begins
--
-- 	gamestate = gamestates.menu
-- end
function setScale(input)
	scale = (7.3 / 1200) * windowHeight

	if cam then
		cam:zoomTo(scale)
	end
end

function checkWindowSize()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()
	if width ~= windowWidth or height ~= windowHeight then
		reinitSize()
	end
end

function reinitSize()
	-- Reinitialize everything
	windowWidth = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()
	setScale()
	initFonts()
end
