local ProfileService = require(game.ServerScriptService.ProfileService)

-- Creation
local ProfileStore = ProfileService.GetProfileStore("PlayerData", {
    Coins = 0,
    XP = 0,
    Inventory = {},
}) -- Creates a ProfileStore with a default template

-- Load or retrieve an already loaded profile by key (string)
local profile = ProfileStore:LoadProfileAsync("Player_" .. player.UserId) -- Loads a profile for the given key (yields)

-- Retrieve an already loaded profile by player instance (does NOT load from datastore)
local existingProfile = ProfileStore:GetProfile("Player_" .. player.UserId) -- Returns profile if loaded, else nil

-- Properties (on a profile instance)
profile.Data                                -- Table containing the player's data (modifiable, auto-saved on release)
profile.MetaData                            -- Internal metadata (advanced use only)
profile.IsActive                            -- Boolean: true if the profile is currently active/owned
profile.Key                                 -- String: unique key for the profile (e.g., "Player_123456")
profile.UserIds                             -- Table of UserIds linked to this profile (ownership protection)

-- ProfileStore Methods
ProfileService.GetProfileStore(storeName, defaultTemplate) -> ProfileStore   -- Create a ProfileStore instance
ProfileStore:LoadProfileAsync(profileKey) -> profile or nil                  -- Loads a profile by key (waits for load)
ProfileStore:ViewProfileAsync(profileKey) -> profile or nil                  -- Loads a read-only profile by key (no changes allowed)
ProfileStore:GetProfile(profileKey) -> profile or nil                        -- Returns loaded profile by key if already loaded (no loading)
ProfileStore:GlobalUpdateProfileAsync(profileKey, updateHandler) -> success  -- Atomic global update on profile data

-- Profile Methods
profile:Release()                           -- Releases profile, saves data, unbinds player session
profile:Save()                              -- Manually saves profile data immediately (use sparingly)
profile:AddUserId(userId)                   -- Adds a UserId for ownership (usually player.UserId)
profile:RemoveUserId(userId)                -- Removes a linked UserId
profile:ListenToRelease(callback)           -- Runs callback when profile is released/lost
profile:ClearGlobalUpdates()                -- Clears queued global updates
profile:GlobalUpdate(updateHandler)         -- Runs a global update handler on profile data

-- Events
profile:ListenToRelease(function() end)     -- Event fired when profile is released due to player leaving or data conflict

-- ProfileService Global Settings (optional, advanced)
ProfileService.ServiceLocked                -- Boolean: if true, new profiles cannot be loaded
ProfileService.CriticalState                -- Boolean: true if DataStores are having issues (affects stability)

-- Example Usage
local profile = ProfileStore:LoadProfileAsync("Player_" .. player.UserId)
if profile then
    profile:AddUserId(player.UserId)
    profile.Data.Coins += 100

    profile:ListenToRelease(function()
        warn("Profile released for", player.Name)
        player:Kick("Data issue, please rejoin.")
    end)
else
    player:Kick("Failed to load your data. Please rejoin.")
end

-- The Module: https://github.com/MadStudioRoblox/ProfileService
