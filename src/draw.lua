function drawCamera()
	-- if gameMap.layers["Background"] then
	--     gameMap:drawLayer(gameMap.layers["Background"])
	-- end

	if gameMap.layers["Base"] then
		gameMap:drawLayer(gameMap.layers["Base"])
	end

	walls:draw()
  -- trees:draw(-1)
	player:draw()

end

-- function drawAfterCamera()
--     curtain:draw()
--     if gamestate == 0 then return end
--     drawHUD()
--     pause:draw()
-- end
