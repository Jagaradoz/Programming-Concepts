-- Vector3: Declarations
local v1 = Vector3.new(1, 2, 3)
local v2 = Vector3.new(4, 5, 6)

-- Vector3: Arithmetic Operations
local added      = v1 + v2                          -- (5, 7, 9)
local subtracted = v1 - v2                          -- (-3, -3, -3)
local scaled     = v1 * 2                           -- (2, 4, 6)
local divided    = v2 / 2                           -- (2, 2.5, 3)
local negated    = -v1                              -- (-1, -2, -3)
local equal      = v1 == Vector3.new(1, 2, 3)       -- true

-- Vector3: Properties & Methods
local magnitude  = v1.Magnitude                     -- Length of vector
local unit       = v1.Unit                          -- Normalized vector
local dotProduct = v1:Dot(v2)                       -- Dot product (scalar)
local crossProd  = v1:Cross(v2)                     -- Cross product (perpendicular vector)
local lerped     = v1:Lerp(v2, 0.5)                 -- Midpoint between v1 and v2

-- Vector3: Other Useful Vectors
local zeroVec    = Vector3.zero                     -- (0, 0, 0)
local oneVec     = Vector3.one                      -- (1, 1, 1)
local xAxis      = Vector3.xAxis                    -- (1, 0, 0)
local yAxis      = Vector3.yAxis                    -- (0, 1, 0)
local zAxis      = Vector3.zAxis                    -- (0, 0, 1)

-- Vector3: Application to Parts
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 2)
part.Position = v1
part.Orientation = v2
part.Anchored = true
part.Parent = workspace
