local ClientCast = require(game.ReplicatedStorage.ClientCast)

-- Creation
local Caster = ClientCast.new(Part, RaycastParams)      -- Creates a new Caster object which raycasts from a given Part (the Caster).

-- Properties
Caster.Caster                               -- The BasePart from which the raycast originates.
Caster.RaycastParams                        -- The RaycastParams used for the raycasting operations.
Caster.Enabled                              -- A boolean indicating if the Caster is currently active and casting rays.
Caster.UserData                             -- A table for storing arbitrary data associated with the Caster.
Caster.TotalRays                            -- The total number of rays cast by this Caster since its creation.
Caster.Collided                             -- A boolean that is true if the Caster is currently colliding with an object.
Caster.CollisionPoint                       -- The Vector3 position of the current collision point, or nil if not colliding.
Caster.CollisionNormal                      -- The Vector3 normal of the surface at the current collision point, or nil if not colliding.
Caster.CollisionMaterial                    -- The Enum.Material of the surface at the current collision point, or nil if not colliding.
Caster.CollisionInstance                    -- The BasePart that the Caster is currently colliding with, or nil if not colliding.
Caster.LastCollisionPoint                   -- The Vector3 position of the last collision point.
Caster.LastCollisionNormal                  -- The Vector3 normal of the surface at the last collision point.
Caster.LastCollisionMaterial                -- The Enum.Material of the surface at the last collision point.
Caster.LastCollisionInstance                -- The BasePart that the Caster was last colliding with.
Caster.MaxDistance                          -- The maximum distance of the raycast. Defaults to 500.

-- Methods
Caster:Start()                              -- Starts the Caster, enabling it to cast rays.
Caster:Stop()                               -- Stops the Caster, disabling its raycasting.
Caster:SetOwner(OwnerPlayer)                -- Sets the owner of the Caster, which automatically adds the owner's character to the raycast blacklist.
Caster:AddToBlacklist(Object)               -- Adds a single object or an array of objects to the raycast blacklist.
Caster:RemoveFromBlacklist(Object)          -- Removes a single object or an array of objects from the raycast blacklist.
Caster:SetBlacklist(Table)                  -- Overwrites the current blacklist with a new table of objects.
Caster:Destroy()                            -- Destroys the Caster object and disconnects all associated events.

-- Events
Caster.HumanoidCollided:Connect(function(RaycastResult, HitHumanoid) end) -- Fires when the raycast hits a valid Humanoid.
Caster.PlayerCollided:Connect(function(RaycastResult, HitPlayer) end)     -- Fires when the raycast hits a valid Player's character.
Caster.Collided:Connect(function(RaycastResult) end)                      -- Fires when the raycast collides with any object.
Caster.RayUpdated:Connect(function(CurrentPoint, RaycastResult) end)      -- Fires every frame the Caster is active, providing the current point of the ray and the latest raycast result.

-- Example:
local Part = Instance.new("Part")
Part.Parent = workspace
Part.Anchored = true

local Params = RaycastParams.new()
Params.FilterType = Enum.RaycastFilterType.Blacklist

local MyCaster = ClientCast.new(Part, Params)
MyCaster:SetOwner(game.Players.LocalPlayer)
MyCaster.MaxDistance = 100

MyCaster.HumanoidCollided:Connect(function(Result, HitHumanoid)
    print("Hit humanoid:", HitHumanoid.Parent.Name)
    local Damage = 10
    -- Assuming a RemoteEvent named "DamageEvent" exists in ReplicatedStorage
    game.ReplicatedStorage.DamageEvent:FireServer(HitHumanoid, Damage)
end)

MyCaster:Start()