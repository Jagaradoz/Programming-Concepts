local RaycastHitbox = require(game.ReplicatedStorage.RaycastHitboxV4)

-- Creation
local NewHitbox = RaycastHitbox.new(ObjectToFollow)       -- Creates a new hitbox object that will follow and create raycast points from the specified Instance (e.g., a weapon part or character).

-- Properties
NewHitbox.Visualizer                            -- (bool) If true, debug rays are drawn, showing the hitbox's shape and hit detection. Defaults to false.
NewHitbox.RaycastParams                         -- (RaycastParams) The RaycastParams object used for all raycasting operations. Allows for precise filtering (blacklist/whitelist).
NewHitbox.DetectionMode                         -- (Enum) Determines how hits are registered. See the Enum section below. Defaults to DetectionModes.Default.
NewHitbox.SignalType                            -- (Enum) Determines if an event can have multiple connections. See the Enum section below. Defaults to SignalType.Single.
NewHitbox.Instance                              -- (Instance) The instance the hitbox was created with.
NewHitbox.Paused                                -- (bool) A read-only boolean indicating if the hitbox is currently paused.

-- Enums
RaycastHitbox.DetectionModes = {
    Default = 0,                                -- A target can only be hit once per HitStart(). A debounce is created for each target hit.
    Bypass = 1,                                 -- A target can be hit by multiple raycast points in the same frame. No debounce is created.
    PartMode = 2,                               -- Similar to Touched events. A target can be hit multiple times, but only once per raycast point.
}

RaycastHitbox.SignalType = {
    Default = 0,                                -- Allows multiple scripts to connect to the OnHit event (standard RBXScriptSignal behavior).
    Single = 1,                                 -- Only allows one script to connect to the OnHit event. Subsequent connections override the previous one.
}

-- Methods
NewHitbox:HitStart(Seconds)                     -- Activates the hitbox. If 'Seconds' (number) is provided, the hitbox will automatically call HitStop after that duration.
NewHitbox:HitStop()                             -- Deactivates the hitbox and clears the list of targets that have already been hit, allowing them to be hit again on the next HitStart().
NewHitbox:Pause()                               -- Temporarily stops the hitbox from casting rays without clearing the hit list.
NewHitbox:Resume()                              -- Resumes a paused hitbox.
NewHitbox:SetPoints(ObjectWithAttachments)      -- Overwrites the hitbox's damage points with new attachments from a given object. Useful for dynamic weapon shapes.
NewHitbox:Destroy()                             -- Disconnects all events and performs cleanup to prevent memory leaks. The hitbox cannot be used after this.

-- It is crucial to attach attachments to your weapon/object and name them "DmgPoint" for the hitbox to detect them as raycast origins.

-- Events
NewHitbox.OnHit:Connect(function(hit, humanoid, results) end) -- Fires when the hitbox detects a valid hit. 'hit' is the BasePart that was struck, 'humanoid' is the Humanoid if one exists in the hit's parent, and 'results' is the full RaycastResult.

-- Example:
local Tool = script.Parent
local Handle = Tool.Handle

-- Create attachments on the Handle named "DmgPoint" in the editor
-- These attachments define the shape and size of the hitbox

local Hitbox = RaycastHitbox.new(Handle)
Hitbox.Visualizer = true -- Let's see the rays for debugging

-- Set up filtering to only hit other characters and ignore the owner's character
local Params = RaycastParams.new()
Params.FilterType = Enum.RaycastFilterType.Blacklist
Params.FilterDescendantInstances = {Tool.Parent} -- Ignore the character holding the tool
Hitbox.RaycastParams = Params

Hitbox.OnHit:Connect(function(hit, humanoid)
    if humanoid and humanoid.Health > 0 then
        print("Hit:", hit.Parent.Name)
        humanoid:TakeDamage(25)
        Hitbox:HitStop() -- Stop the hitbox immediately after a successful hit to prevent multiple damage instances
    end
end)

Tool.Activated:Connect(function()
    Hitbox:HitStart(0.5) -- Start the hitbox, and automatically stop it after 0.5 seconds
end)