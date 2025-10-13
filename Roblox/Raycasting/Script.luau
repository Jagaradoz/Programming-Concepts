-- Methods
    -- workspace:Raycast(origin, direction, raycastParams)             : (Recommended) Casts a ray and returns RaycastResult or nil if nothing hit
    -- Ray.new(origin, direction)                                      : (Legacy) creates a Ray object (used in older APIs like FindPartOnRay)
    -- workspace:FindPartOnRay(ray, ignoreDescendants, terrainCells)   : (Legacy) returns first part hit by a Ray (deprecated, use Raycast)
    -- workspace:FindPartOnRayWithWhitelist(ray, whitelist)            : (Legacy) raycast that only hits parts in whitelist
    -- workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)          : (Legacy) raycast that skips specific instances
    -- workspace:FindPartInRegion3(region, ignoreDescendants)          : (Legacy) returns part inside a Region3 volume
    -- workspace:GetPartsInPart(part)                                  : Returns all parts overlapping the given part
    -- workspace:GetPartBoundsInBox(cframe, size, overlapParams)       : Returns parts inside a box shape (advanced detection)
    -- workspace:GetPartBoundsInRadius(position, radius, overlapParams): Returns parts inside a sphere from position

-- RaycastParams
    -- raycastParams.FilterType                                       : Include or Exclude — determines how FilterDescendantsInstances is interpreted
    -- raycastParams.FilterDescendantsInstances = {model1, part2}     : List of instances to include or exclude
    -- raycastParams.IgnoreWater             = true                   : Ignores terrain water if true
    -- raycastParams.CollisionGroup          = "Default"              : Only considers parts in this collision group
    -- raycastParams.RespectCanCollide       = true                   : Only hits parts with CanCollide = true (default = true)
    -- raycastParams.RespectQueryIgnore      = true                   : Respects physics query ignore settings (default = true)

-- RaycastResult (returned from workspace:Raycast)
    -- result.Instance                        : The part hit
    -- result.Position                        : World position where ray hit
    -- result.Normal                          : Surface normal at hit point (Vector3)
    -- result.Material                        : Material of the part hit
    -- result.Distance                        : Distance from origin to hit point

-- Usage Example:
local origin = Vector3.new(0, 10, 0)                                                -- Starting point of the ray
local direction = Vector3.new(0, -20, 0)                                            -- Direction and length of the ray (downward)

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude                           -- Ignore instances in the list
raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
raycastParams.IgnoreWater = true
raycastParams.RespectCanCollide = true
raycastParams.CollisionGroup = "Default"

local result = workspace:Raycast(origin, direction, raycastParams)

if result then
    print("Hit part:", result.Instance.Name)
    print("Hit position:", result.Position)
    print("Surface normal:", result.Normal)
    print("Material:", result.Material.Name)
    print("Distance:", result.Distance)
else
    print("No part hit by the ray.")
end
