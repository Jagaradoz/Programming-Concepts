local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

-- :UserOwnsGamePassAsync(userId, gamePassId): Checks if a user owns the specified game pass; returns true or false (async)
-- PromptGamePassPurchaseFinished event: Fires when a player finishes (successfully or not) purchasing a game pass
MarketplaceService:UserOwnsGamePassAsync(player.UserId, 123456)
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, purchaseSuccessful) ... end)

-- Usage Example:
local GAME_PASS_ID = 12345678 

Players.PlayerAdded:Connect(function(player)
    -- Check if the player owns the Game Pass
    local success, ownsPass = pcall(function()
        return MarketplaceService:UserOwnsGamePassAsync(player.UserId, GAME_PASS_ID)
    end)

    if success and ownsPass then
        print(player.Name .. " owns the Game Pass!")
        -- Example: grant a perk like extra speed
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = humanoid.WalkSpeed + 10
    else
        print(player.Name .. " does NOT own the Game Pass.")
    end
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, purchaseSuccessful)
    if purchaseSuccessful and gamePassId == GAME_PASS_ID then
        print(player.Name .. " has just purchased the Game Pass!")
        -- Grant the perk immediately, e.g. increase walk speed
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = humanoid.WalkSpeed + 10
    end
end)
