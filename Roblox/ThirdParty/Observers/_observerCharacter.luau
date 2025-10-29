-- observeCharacter: Observe Each Player's Character in Game
local stopCharacter = observeCharacter(
    callback: (player: Player, character: Model) -> (() -> ())?
)
    -- Observes every character for each player (including on respawn)
    -- Runs callback(player, character) when character appears; expects cleanup function as return
    -- Cleanup runs when character is removed or observer is stopped
    -- Returns stop function

-- Example: Watch character lifecycle
local stop = observeCharacter(function(player, character)
    print("Character spawned for", player.Name)
    return function()
        print("Character removed for", player.Name)
    end
end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
