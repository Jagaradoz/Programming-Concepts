-- Attributes                                        : For almost all custom data on Instances.
part:SetAttribute("Data", 1)
part:GetAttribute("Data")

-- Instance Values                                   : Use IntValue, StringValue, etc. only for:
local intVal = Instance.new("IntValue", parent)
intVal.Name = "Data"
intVal.Value = 10

-- Summary:
    -- Attributes:
    --   1. Modern way to store most custom data on instances.
    --   2. Cleaner Explorer, supports many data types, auto syncs client/server.
    --   3. Best for upgrades, object state, and gameplay properties.
    -- Value Instances:
    --   1. Mainly for leaderstats (player list stats).
    --   2. Required by some legacy or old code.
    --   3. Creates clutter if overused—avoid except for leaderboard stats.
