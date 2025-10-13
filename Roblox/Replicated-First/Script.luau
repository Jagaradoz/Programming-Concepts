local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ContentProvider = game:GetService("ContentProvider")

-- ReplicatedFirst
    -- :RemoveDefaultLoadingScreen()                    : Removes Roblox's default loading screen to show your own custom UI or visuals.
ReplicatedFirst:RemoveDefaultLoadingScreen()

-- Usage case:
-- Put a ScreenGui or LocalScript in ReplicatedFirst to display a custom loading screen
-- while assets load, then remove or hide it once loading is done.

--------------------------------------------------------------------------------

-- ContentProvider
    -- :PreloadAsync(arrayOfAssets)                     : Asynchronously preloads assets, yielding until complete or errors
    -- :PreloadSync(arrayOfAssets)                      : Synchronously preloads assets, blocking until done (use sparingly to avoid frame drops)
    -- :GetUserContentAsync(assetId)                    : Loads content from user uploads asynchronously
    -- :SetAssetPreloadPriority(asset, priority)        : Set loading priority (1-10) for assets
ContentProvider:PreloadAsync({game.Workspace.Part.Texture, game.ReplicatedStorage.Sound})