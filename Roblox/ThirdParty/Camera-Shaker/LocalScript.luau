local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

-- Creation
local shaker = CameraShaker.new()               -- Creates a new CameraShaker instance

-- Properties
shaker.Strength                                                     -- Number, intensity of the shake effect
shaker.Roughness                                                    -- Number, frequency of shake jitter
shaker.FadeInTime                                                   -- Number, time in seconds for shake to reach full strength
shaker.FadeOutTime                                                  -- Number, time in seconds for shake to fade away
shaker.PositionInfluence                                            -- Vector3, influence of shake on camera position
shaker.RotationInfluence                                            -- Vector3, influence of shake on camera rotation
shaker.Active                                                       -- Boolean, whether the shaker is currently shaking

-- Methods
shaker:Start()                                                      -- Begins the shake effect immediately
shaker:StartFadeIn()                                                -- Starts the shake effect with fade-in timing
shaker:StartFadeOut()                                               -- Starts fading out the shake effect
shaker:Stop(immediate)                                              -- Stops the shake effect, optionally immediately (boolean)
shaker:Update(dt)                                                   -- Updates the shake effect; called automatically if used with a BindToRenderStep
shaker:ShakeOnce(strength, roughness, fadeInTime, fadeOutTime)      -- Plays a single shake burst with given parameters
shaker:Shake(strength, roughness, fadeInTime, fadeOutTime)          -- Starts a continuous shake with given parameters
shaker:SetPositionInfluence(Vector3)                                -- Sets how much the shake affects camera position
shaker:SetRotationInfluence(Vector3)                                -- Sets how much the shake affects camera rotation

-- Events (You can connect to these for custom behavior)
shaker.ShakeStarted:Connect(function() end)                         -- Fires when shake begins
shaker.ShakeStopped:Connect(function() end)                         -- Fires when shake ends

-- Usage example
local shaker = CameraShaker.new()
shaker.Strength = 1
shaker.Roughness = 5
shaker:ShakeOnce(1, 5, 0.1, 0.5)                                    -- Shake the camera once with these parameters

-- The Module: https://github.com/Sleitnick/RbxCameraShaker
