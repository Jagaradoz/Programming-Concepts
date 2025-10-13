local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

-- :GetUserSubscriptionStatusAsync(userId, subscriptionId)			: Returns the user's current subscription status (e.g., Active, NotSubscribed)
-- .UserSubscriptionStatusChanged									: Event that fires when a user's subscription status changes
MarketplaceService:GetUserSubscriptionStatusAsync(player.UserId, SUBSCRIPTION_ID)
MarketplaceService.UserSubscriptionStatusChanged:Connect(function(player, subscriptionId, newStatus) ... end)

-- Usage Example:

local SUBSCRIPTION_ID = 1234567890

-- Check if player is subscribed
local function isSubscribed(player)
	local status = MarketplaceService:GetUserSubscriptionStatusAsync(player.UserId, SUBSCRIPTION_ID)
	return status == Enum.UserSubscriptionStatus.Active
end

-- React to subscription changes
MarketplaceService.UserSubscriptionStatusChanged:Connect(function(player, subscriptionId, newStatus)
	if subscriptionId ~= SUBSCRIPTION_ID then return end

	if newStatus == Enum.UserSubscriptionStatus.Active then
		print(player.Name .. " subscribed.")
		-- Grant perks here
	elseif newStatus == Enum.UserSubscriptionStatus.NotSubscribed then
		print(player.Name .. " unsubscribed.")
		-- Remove perks here if needed
	end
end)

-- Example usage: Listen for chat commands to test
Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if msg == "!subscribe" then
			MarketplaceService:PromptSubscriptionPurchase(player, SUBSCRIPTION_ID)
		elseif msg == "!checksub" then
			if isSubscribed(player) then
				print(player.Name .. " is currently subscribed.")
			else
				print(player.Name .. " is not subscribed.")
			end
		end
	end)

	-- Optionally auto-check on join
	if isSubscribed(player) then
		print(player.Name .. " already subscribed on join.")
		-- Grant perks immediately if needed
	end
end)
