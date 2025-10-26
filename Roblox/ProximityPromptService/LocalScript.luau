local ProximityPromptService = game:GetService("ProximityPromptService")

-- EVENTS: Triggered by any ProximityPrompt in the game

-- Fired when a player triggers ANY prompt
ProximityPromptService.PromptTriggered:Connect(function(prompt, player)
	print(player.Name .. " triggered prompt:", prompt.Name)
end)

-- Fired when a player begins holding a prompt's button
ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
	print(player.Name .. " started holding prompt:", prompt.Name)
end)

-- Fired when a player ends holding a prompt's button
ProximityPromptService.PromptButtonHoldEnded:Connect(function(prompt, player)
	print(player.Name .. " stopped holding prompt:", prompt.Name)
end)

-- Fired when a prompt is triggered while the player is holding it
ProximityPromptService.PromptHoldEnded:Connect(function(prompt, player)
	print(player.Name .. " completed hold on prompt:", prompt.Name)
end)

-- TYPICAL PROPERTIES ON ProximityPrompt
-- prompt.ActionText      : The text shown on the button (e.g., "Open Chest")
-- prompt.ObjectText      : Optional description of the object
-- prompt.KeyboardKeyCode : Key used to trigger prompt on keyboard
-- prompt.MaxActivationDistance : Max distance player can trigger prompt
-- prompt.RequiresLineOfSight : If true, player must see the prompt
-- prompt.HoldDuration    : Seconds to hold before triggering (0 for instant)

-- USAGE NOTES
-- ProximityPromptService handles all prompts globally
-- You can still connect events to individual prompts for localized handling
-- Good for analytics, centralized tracking, or global interactions
-- Works only with players in range of the prompt
-- Supports keyboard, gamepad, and touch input automatically
