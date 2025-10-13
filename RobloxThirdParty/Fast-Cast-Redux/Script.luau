-- 1. Setup
local FastCast = require(path.to.FastCastRedux)                                             -- Load the FastCastRedux module for advanced projectile simulation
local PartCache = require(path.to.PartCache)                                                -- Load the PartCache module for efficient part reuse (object pooling)

FastCast.VisualizeCasts = false                                                             -- Close or Open projectile visualizations

-- Create a Part instance to serve as a template for your bullet visuals
local bulletTemplate = Instance.new("Part")
bulletTemplate.Size = Vector3.new(0.2, 0.2, 2)
bulletTemplate.Anchored = true
bulletTemplate.CanCollide = false
bulletTemplate.Material = Enum.Material.Neon
bulletTemplate.BrickColor = BrickColor.new("Bright yellow")

-- Set up a PartCache for bullet visuals; this will allow you to reuse bullet Parts efficiently
local bulletCache = PartCache.new(bulletTemplate, 50, workspace.Bullets)                   -- 50 is the pool size; workspace.Bullets is a folder for organizing
local caster = FastCast.new()                                                              -- Initialize a new Caster object (typically one per weapon or projectile system)
local castBehavior = FastCast.newBehavior()                                                -- Create a behavior profile to define how this projectile will act
castBehavior.RaycastParams = RaycastParams.new()                                           -- Set up RaycastParams to control what the projectile can and can't hit
castBehavior.RaycastParams.FilterDescendantsInstances = {}                                 -- Add instances (like the shooter or their character) here to prevent the projectile from colliding with them
castBehavior.RaycastParams.FilterType = Enum.RaycastFilterType.Exclude                     -- Set filter mode to "Exclude" so the projectile ignores the listed instances
castBehavior.Acceleration = Vector3.new(0, -workspace.Gravity, 0)                          -- Apply gravity to the projectile (negative Y value matches Roblox’s gravity direction)
castBehavior.AutoIgnoreContainer = false                                                   -- Set to false to manually manage which parts are ignored by the projectile's raycasts

-- Assign the PartCache to the behavior so FastCast knows to use pooled bullets for visuals
castBehavior.CosmeticBulletProvider = bulletCache                                          -- Automatically gives/reclaims bullet Parts as projectiles are spawned and destroyed

-- Caster events
caster.LengthChanged:Connect(function(cast, lastPoint, rayDir, displacement, segmentVelocity) ...end)       -- This event fires every frame as the projectile moves; use it to update the position and orientation of your visual bullet or trail effects
caster.RayHit:Connect(function(cast, result, velocity) ... end)                                             -- This event triggers when the projectile collides with an object; use it to handle things like applying damage, effects, or sound
caster.CastTerminating:Connect(function(cast) ... end)                                                      -- This event fires when the projectile has reached its end (due to hitting something or exceeding its range); use it to clean up visuals or other effects

-- 2. Firing a projectile
local origin = tool.Muzzle.Position                                                                         -- The exact position from which the projectile should start (usually the tip of the gun or cannon)
local direction = (mousePos - origin).Unit                                                                  -- Calculate the direction vector from the firing position toward the mouse or target; must be normalized
local speed = 400                                                                                           -- Set the desired speed of the projectile in studs per second
local velocity = direction * speed                                                                          -- Calculate the projectile’s velocity vector by multiplying direction by speed

caster:Fire(origin, velocity, castBehavior)                                                                 -- Fire the projectile using the specified origin, velocity, and behavior settings

-- 3. Behavior settings
castBehavior.HighFidelityBehavior = FastCast.HighFidelityBehavior.Default                                   -- Set how accurately the projectile follows its simulated path; Default is suitable for most cases
castBehavior.MaximumDistance = 1000                                                                         -- Limit how far the projectile can travel (in studs) before being destroyed automatically

-- Example: Make bullet pierce through certain materials/parts
castBehavior.CanPierceFunction = function(cast, rayResult, segmentVelocity)
    if rayResult.Instance and rayResult.Instance.Name == "Glass" then
        return true -- Allow the projectile to pass through objects named "Glass" (simulate piercing)
    end
    return false -- Otherwise, the projectile will stop on any other object
end

-- Example: Updating visuals (move and orient the pooled bullet part)
caster.LengthChanged:Connect(function(cast, lastPoint, rayDir, displacement, segmentVelocity)
    local bullet = cast.RayInfo.CosmeticBulletObject
    if bullet then
        bullet.Position = lastPoint + (rayDir * displacement)         -- Move the visual bullet to the correct position along the simulated path
        bullet.Orientation = rayDir                                   -- Align the bullet's facing direction with its current velocity
    end
end)

-- Example: Hit detection
caster.RayHit:Connect(function(cast, result, velocity)
    local hitPart = result.Instance                                   -- The object that was hit by the projectile
    local hitPosition = result.Position                               -- The precise point where the projectile made contact
end)

-- Example: Termination
caster.CastTerminating:Connect(function(cast)
    local bullet = cast.RayInfo.CosmeticBulletObject
    if bullet then
        bulletCache:ReturnPart(bullet)                                -- Instead of destroying, return the bullet to the PartCache for reuse
    end
end)

-- The Module: https://create.roblox.com/store/asset/4453855787/FastCast-Redux