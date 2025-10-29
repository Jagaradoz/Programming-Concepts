-- throttle: Prevents a function from firing more than once within a set time per identifier
local throttle = require(path.to.throttle)

-- Basic Api
local success = throttle(
    identifier: any,          -- Unique key for this throttle (e.g., player, string, object, etc)
    delay: number,            -- Minimum seconds between allowed triggers per identifier
    func: (identifier, ...any) -> (),  -- Function to call if not throttled (receives identifier and extra arguments)
    ...: any                  -- Any extra arguments to pass to func
): boolean
    -- Returns true if func was called, false if throttled (skipped)
    -- Works independently per identifier (multiple separate throttles can run for different keys)
    -- After delay expires, allows next call for that identifier

-- Example: Limit player chat spam to once per 3 seconds
local throttle = require(path.to.throttle)
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        local ok = throttle(player, 3, function(p, m)
            print("Chat accepted for:", p.Name, "msg:", m)
        end, msg)
        if not ok then
            print("Player throttled:", player.Name)
        end
    end)
end)

-- Return Value
    -- true: func called and new throttle timer started
    -- false: still in throttle window, func not called

-- Memory Safety
    -- Cleans up stored time after delay expires to prevent unbounded memory growth

-- Patterns
    -- Per-player, per-object, per-action cooldowns (e.g., anti-spam, anti-abuse, event gating)
    -- Global throttle: use a shared identifier for everything you want globally throttled

-- Notes
    -- identifier can be anything (Player, string, table, etc); each unique one gets its own cooldown
    -- func is always called via task.spawn (doesn't block throttle)
    -- delay is in seconds (can be fractional for fast throttling)
    -- Not re-entrant: function will not be called multiple times if throttled, even if previous call hasn't finished
    -- Cleans up key after window expires for best performance

-- Limitations
    -- Does not queue missed calls (skips them entirely)
    -- Not a debounce (calls first, blocks further calls; debounce blocks all but last)
    -- If identifier is not unique, will cause global throttling

-- Example: Throttle button click for all users to once per second
button.MouseButton1Click:Connect(function()
    throttle("ButtonGlobal", 1, function(id)
        print("Button clicked, id:", id)
    end, "ButtonGlobal")
end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
