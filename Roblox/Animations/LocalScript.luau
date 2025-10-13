-- Animation Procedures:
-- 1. Rigs: Character models (e.g., Humanoid) that play animations
-- 2. AnimationTracks: Instances representing a playing animation on a rig
-- 3. Animation Events & Markers: Signals triggered at specific points during animation playback
-- 4. Animation Priority: Determines which animations override others
    -- Core: lowest priority (default, base animations like breathing)
    -- Idle: higher than Core (idle poses when standing still)
    -- Movement: higher than Idle (walking, running animations)
    -- Action1: higher than Movement (primary actions like jumping)
    -- Action2: higher than Action1 (secondary actions)
    -- Action3: higher than Action2 (tertiary actions)
    -- Action4: highest priority (critical or interrupting actions)

-- Methods:
-- 1. :AdjustSpeed(number): Controls playback speed of an animation
-- 2. :GetMarkerReachedSignal(markerName): Connects to events fired at animation markers

-- Usage Example:
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")                                         -- Creates an animtion instance
animation.AnimationId = "rbxassetid://1234567890"                                   -- Animation id

local animTrack = humanoid:LoadAnimation(animation)                                 -- Creates an animation track

animTrack.Priority = Enum.AnimationPriority.Action                                  -- Set animation priority

animTrack:Play()                                                                    -- Play the animation

animTrack:AdjustSpeed(1.5)                                                          -- Adjust playback speed (1 = normal speed) (should do after :Play())

animTrack:GetMarkerReachedSignal("MarkerName"):Connect(function(param) ... end)     -- Connect to animation marker reached event (markers added inside animation timeline)
animTrack.Stopped:Connect(function() ... end)                                       -- Stop event
animTrack.KeyframeReached:Connect(function(keyframeName) ... end)                   -- Keyframe reached event
