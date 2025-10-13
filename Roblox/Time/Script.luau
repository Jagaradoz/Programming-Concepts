-- Roblox DateTime API (modern, timezone-aware, preferred)
local now        = DateTime.now()                                       -- current UTC DateTime
local fromUnix   = DateTime.fromUnixTimestamp(1718323200)               -- from Unix time

-- Create specific time in UTC and local time
local utc        = DateTime.fromUniversalTime(2025, 6, 14, 12, 0, 0)    -- Exact UTC: 14 June 2025, 12:00:00 UTC
local localTime  = DateTime.fromLocalTime(2025, 6, 14, 19, 0, 0)        -- Interpreted as local time (e.g. 7PM in your timezone), then converted to UTC internally

print(now.UnixTimestamp)                                                -- seconds since epoch
print(now.UnixTimestampMillis)                                          -- milliseconds since epoch
print(now:FormatUniversalTime("YYYY-MM-DD hh:mm:ss"))                   -- formatted UTC

-- Roblox Legacy & Lua time Functions
print(tick())                                                           -- seconds since game/server started
print(time())                                                           -- same as tick()
print(os.time())                                                        -- Unix time (like DateTime.UnixTimestamp)
print(os.clock())                                                       -- CPU time used by Lua
print(os.date("%Y-%m-%d %H:%M:%S"))                                     -- local time formatted
local d = os.date("*t")                                                 -- table with date fields
print(d.year, d.month, d.day)

-- Examples:
-- Delta Time (elapsed seconds):
local t1 = DateTime.now()
wait(1.5)
local t2 = DateTime.now()
local delta = t2.UnixTimestamp - t1.UnixTimestamp
print("Elapsed:", delta)

-- Conversion between DateTime and os.time()
local t = os.time({year=2025, month=6, day=14, hour=12, min=0, sec=0})
local dt = DateTime.fromUnixTimestamp(t)

-- Countdown Timer:
local targetTime = DateTime.fromUnixTimestamp(os.time() + 10)
repeat
    local now = DateTime.now()
    local remaining = targetTime.UnixTimestamp - now.UnixTimestamp
    print("Remaining:", remaining)
    wait(1)
until remaining <= 0
print("Countdown finished")
