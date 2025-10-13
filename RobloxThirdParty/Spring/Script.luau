-- Basic Api
local Spring = require(path.to.Spring)                              -- Require the module

local spring = Spring.new(initialValue, [stiffness], [damping])    -- Creates a new spring (any type: number, Vector3, CFrame, etc)
-- initialValue: The starting value (e.g., Vector3.new(), 0, etc.)
-- stiffness: (Optional) How "strong" the spring pulls toward its target (default: 1)
-- damping: (Optional) How quickly the motion stops (default: 1, critical damping = 1)

-- Setting/Changing The Target --
spring.Target = Vector3.new(10,5,2)                                -- Set a new target (goal value for the spring)
spring.Position = Vector3.new(0,0,0)                               -- Set current value (for snapping/resetting spring)
spring.Velocity = Vector3.new(0,0,0)                               -- Set current velocity (for snapping/stopping)

-- Stepping/Updating The Spring --
spring:Step(dt)                                                    -- Updates the spring by 'dt' seconds; returns new position
-- (Call this every frame or in RunService.RenderStepped/Heartbeat)

-- Reading The State --
local pos = spring.Position                                        -- Current value of the spring
local vel = spring.Velocity                                        -- Current velocity
local tar = spring.Target                                          -- Current target

-- Changing Spring Physics Live --
spring.Stiffness = 2                                               -- Change strength (higher = faster snap)
spring.Damping = 0.8                                               -- Change damping (lower = more bounce, 1 = critical damping, >1 = overdamped)

-- Resetting/Instantly Moving --
spring.Position = spring.Target                                    -- Instantly jump to target
spring.Velocity = Vector3.new()                                    -- Stop motion instantly

-- Utility --
spring:IsIdle()                                                    -- Returns true if spring is (almost) at target and not moving
spring:Impulse(force)                                              -- Instantly adds velocity for a "kick"/recoil/bounce effect

-- Example: Smooth Camera Follow --
local Spring = require(path.to.Spring)
local camSpring = Spring.new(workspace.Camera.CFrame, 2, 1)
camSpring.Target = workspace.Part.CFrame
game:GetService("RunService").RenderStepped:Connect(function(dt)
    camSpring.Target = workspace.Part.CFrame
    local newCF = camSpring:Step(dt)
    workspace.CurrentCamera.CFrame = newCF
end)

-- Example: Smooth 2D UI/Number Value --
local numberSpring = Spring.new(0)
numberSpring.Target = 100
while not numberSpring:IsIdle() do
    numberSpring:Step(0.03)
    print(numberSpring.Position)
    wait(0.03)
end

-- Typical Methods/Signatures --
Spring.new(initialValue, [stiffness], [damping])
spring:Step(dt): value
spring:Impulse(force)
spring:IsIdle(): boolean

-- Properties --
spring.Position          -- Current value (number, Vector3, CFrame, etc.)
spring.Target            -- Goal value (type-matched)
spring.Velocity          -- Current velocity (type-matched)
spring.Stiffness         -- Stiffness (number, controls strength)
spring.Damping           -- Damping (number, controls smoothness)

-- Use Cases
    -- Smooth camera, part, UI, or value interpolation
    -- Natural lag, spring-back, or recoil effects
    -- Follow scripts with physics realism
    -- Smoothing noisy/jerky values or motion

-- Notes
    -- Works with numbers, Vector2, Vector3, CFrame (even Color3, tables in some modules)
    -- Higher stiffness snaps faster; lower is softer
    -- Lower damping bounces more, 1 is "perfect snap," >1 is "no bounce"
    -- Call :Step(dt) **every frame** for smoothest results
    -- Safe to change target, stiffness, or damping at runtime
    -- Place the Spring module in ReplicatedStorage or StarterPlayerScripts and require as needed!

-- The Module: https://create.roblox.com/store/asset/7053102382/Spring-Module