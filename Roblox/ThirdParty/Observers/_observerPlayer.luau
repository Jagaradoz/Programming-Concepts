-- observePlayer: Observe All Current and Future Players in Game
local stopPlayerObserver = observePlayer(callback: (player: Player) -> (() -> ())?)
    -- Calls callback(player) for every player present and joining
    -- Runs cleanup function on player removal or observer stop
    -- Returns stop function; call to clean up all player observers

-- Example: Print on join/leave
local stop = observePlayer(function(player)
    print("Player joined", player.Name)
    return function() print("Player left", player.Name) end
end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
