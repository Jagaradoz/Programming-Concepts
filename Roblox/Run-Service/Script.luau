local RunService = game:GetService("RunService")

-- Frame Update Cycle (Fastest to Slowest):
    -- User Input: Captures player input events first, before rendering or simulation.
    -- Rendering: Fires just before the frame is rendered on screen (client-only).
    -- Wait States:
        -- task.wait(): yields execution until the next Heartbeat or RenderStepped cycle.
        -- task.spawn(): schedules a function to run asynchronously (like a lightweight thread).
        -- task.delay(): schedules a function to run after a delay, non-blocking.
    -- Garbage Collection: Runs automatically in the background to free unused memory, impacting performance but not exposed as event.
    -- Physics Simulation: Stepped event fires before the physics simulation step.
    -- Heartbeat: Heartbeat event fires after physics simulation; used for game logic updates.

-- 1. Events for game loop:
    -- Heartbeat: Fires every frame *after* physics simulation; use for game logic that depends on physics updates
    -- Stepped: Fires every frame *before* physics simulation; good for input processing or pre-physics updates
    -- RenderStepped: (Client-Only) Fires every frame *before rendering*; only runs on the client, use for smooth camera updates, GUI animations, etc.
RunService.Heartbeat:Connect(function(deltaTime) ... end)           -- deltaTime = time since last Heartbeat event
RunService.Stepped:Connect(function(time, deltaTime) ... end)       -- time = current time, deltaTime = time since last Stepped event
RunService.RenderStepped:Connect(function(deltaTime) ... end)       -- deltaTime = time since last RenderStepped event

-- 2. Temporary Connection: Connect to an event and disconnect
local connection = RunService.Heartbeat:Connect(function() ... end)
connection:Disconnect()

-- 3. Environment Checks:
    -- :IsStudio()         : Is the game running in Roblox Studio?
    -- :IsServer()         : Is the current script running on the server?
    -- :IsClient()         : Is the current script running on the client?
local isStudio = RunService:IsStudio()
local isServer = RunService:IsServer()
local isClient = RunService:IsClient()

-- 4. Other RunService Methods:

    -- :Set3dRenderingEnabled(bool)
        -- Enables or disables 3D rendering. 
        -- When false, the 3D world will not be rendered, but scripts and logic continue running.
RunService:Set3dRenderingEnabled(true)    -- Enables rendering
RunService:Set3dRenderingEnabled(false)   -- Disables rendering (useful for benchmarking in Studio)

    -- :BindToRenderStep(name, priority, callback)
        -- Binds a function to the RenderStepped event with a unique name and a priority number.
        -- The 'callback' function receives deltaTime as an argument.
        -- Lower priorities run first; higher priorities run later.
        -- Enum.RenderPriority values (from highest priority/earliest to lowest/later):
                -- Enum.RenderPriority.First.Value            -- -100      : Runs before everything else (earliest possible)
                -- Enum.RenderPriority.Input.Value            -- 0         : Runs after First, for input processing
                -- Enum.RenderPriority.Camera.Value           -- 100       : For camera scripts/updates
                -- Enum.RenderPriority.Character.Value        -- 200       : Character animation/logic
                -- Enum.RenderPriority.Last.Value             -- 2000      : Runs last, after all others
RunService:BindToRenderStep("CustomStep", Enum.RenderPriority.Input.Value, function(deltaTime)
    -- This function will run every frame, right after input is processed, before rendering.
    -- Example: print("Running in custom render step", deltaTime)
end)

    -- :UnbindFromRenderStep(name)
        -- Unbinds/removes a previously bound RenderStep by its unique name.
        -- Use this to stop running the custom step when it's no longer needed.
RunService:UnbindFromRenderStep("CustomStep")

    -- :Run()                : Starts the game loop (used internally by Roblox engine, almost never by developers).
    -- :Pause()              : Pauses the game loop (again, internal to engine).
