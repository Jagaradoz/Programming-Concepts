local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-- :PromptGamePassPurchase(player, gamePassId): Opens the purchase dialog for the specified player to buy a game pass by its ID
MarketplaceService:PromptGamePassPurchase(player.UserId, 123456)