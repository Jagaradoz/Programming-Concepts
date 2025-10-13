local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-- :PromptProductPurchase(player, productId): Shows a purchase prompt for the player to buy a developer product by its ID
MarketplaceService:PromptProductPurchase(player, 123456)