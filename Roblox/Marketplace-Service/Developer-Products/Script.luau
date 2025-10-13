local MarketplaceService = game:GetService("MarketplaceService")

-- ProcessReceipt (callback)
    -- Fires when a developer product purchase is completed; you must handle granting the product
    -- Return Enum.ProductPurchaseDecision to approve or reject the purchase
    -- Enum.ProductPurchaseDecision
        -- PurchaseGranted: purchase approved and granted
        -- NotProcessedYet: defer processing (will retry later)
        -- PurchaseDenied: purchase rejected (do not grant)
MarketplaceService.ProcessReceipt = function(receiptInfo)
    if ... then
        return Enum.ProductPurchaseDecision.PurchaseGranted
    else
        return Enum.ProductPurchaseDecision.NotProcessedYet
    end
end

-- :GetProductInfo(productId): Retrieves metadata about a developer product (price, name, description)
MarketplaceService:GetProductInfo(123456)

-- Usage Example:
local productFunctions = {}

productFunctions[1771789816] = function(receipt, player)
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed += 50
        return true
    end
    return false
end

MarketplaceService.ProcessReceipt = function(receiptInfo)
    local player = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)
    if not player then
        return Enum.ProductPurchaseDecision.NotProcessedYet
    end

    local handler = productFunctions[receiptInfo.ProductId]
    if handler then
        local success = handler(receiptInfo, player)
        if success then
            return Enum.ProductPurchaseDecision.PurchaseGranted
        end
    end

    return Enum.ProductPurchaseDecision.PurchaseDeclined
end
