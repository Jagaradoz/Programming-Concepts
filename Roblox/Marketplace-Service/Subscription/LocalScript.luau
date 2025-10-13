local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-- :PromptSubscriptionPurchase(player, subscriptionId): Opens the purchase dialog for the specified player to subscribe to a subscription product by its ID
MarketplaceService:PromptSubscriptionPurchase(player.UserId, 123456)