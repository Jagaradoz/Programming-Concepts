-- Property Values
Enum.RunContext.Legacy              -- Default behavior based on script type and parent (classic Roblox behavior)
Enum.RunContext.Client              -- Forces script to run only on the client (even in ReplicatedStorage, ServerScriptService, etc.)
Enum.RunContext.Server              -- Forces script to run only on the server
Enum.RunContext.Automatic           -- Runs based on parent container:
                                        -- Client if under PlayerScripts, StarterGui, StarterPack, etc.
                                        -- Server if under ServerScriptService, ServerStorage, etc.
                                        -- Disabled if parented somewhere invalid for that context

-- Examples:
-- Explicit Client Module
local module = script.Parent:FindFirstChild("MyClientModule")
module.RunContext = Enum.RunContext.Client
    -- Ensures this module only runs when required from the client

-- Automatic Mode for Portability
local script = Instance.new("Script")
script.Parent = ServerScriptService
script.RunContext = Enum.RunContext.Automatic
    -- Runs on server because of ServerScriptService parent
script.Parent = PlayerScripts
    -- Automatically switches to client context if moved


-- Notes
    -- Legacy: Keeps old Roblox behavior—recommended to avoid in new projects
    -- Automatic: Best default for most workflows; portable and safe
    -- Client/Server: Use for strict separation and secure design
    -- RunContext applies at runtime and in Studio simulation
    -- ModuleScripts can't apply RunContext

-- Limitations
    -- Non-script instances unaffected
    -- Incorrect RunContext = scripts silently disabled (watch output for warnings)
    -- Only works for Script, LocalScript, ModuleScript