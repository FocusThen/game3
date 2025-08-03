function drawBeforeCamera()
    setWhite()
    -- love.graphics.setLineWidth(0.5)
    -- love.graphics.draw(sprites.background, 0, 64 * scale, nil, scale)
    -- love.graphics.setColor(129/255, 145/255, 150/255)
    -- love.graphics.rectangle("fill", 0, 164 * scale, love.graphics.getWidth(), 500 * scale)
end

function drawCamera()
  setWhite()

	if gameMap.layers["Background"] then
		gameMap:drawLayer(gameMap.layers["Background"])
	end

	if gameMap.layers["Base"] then
		gameMap:drawLayer(gameMap.layers["Base"])
	end

	walls:draw()
	platforms:draw()
	player:draw()


  -- effects:draw()
  -- particles:draw()
  -- blasts:draw()
end

function drawAfterCamera()
    -- curtain:draw()
    -- if gamestate == 0 then return end
    -- drawHUD()
    -- pause:draw()
end
