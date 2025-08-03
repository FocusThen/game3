function updateAll(dt)
    --if pause.active == false then
        updateGame(dt)
    --end

    -- pause:update(dt)
    -- dj.cleanup()
    if gameMap then gameMap:update(dt) end
    checkWindowSize()
end

function updateGame(dt)
    -- flux.update(dt)

    player:update(dt)
    platforms:update(dt)
    world:update(dt)

    cam:update(dt)
end
