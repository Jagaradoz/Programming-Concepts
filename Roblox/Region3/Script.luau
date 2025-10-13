-- 1. Creating a Region3
-- Example 1: From Two Corners
local minCorner = Vector3.new(0, 0, 0)                                      
local maxCorner = Vector3.new(10, 10, 10)                                   
local region = Region3.new(minCorner, maxCorner)                            

-- Example 2: From Center and Size
local center = Vector3.new(50, 10, 20)
local size = Vector3.new(20, 40, 10)
local minCorner = center - size/2
local maxCorner = center + size/2
local region = Region3.new(minCorner, maxCorner)

-- 2. Expanding Region3 to grid
local expanded = region:ExpandToGrid(4)

-- 3. Visualizing Region3 (with terrain)
workspace.Terrain:FillRegion(region, 4, Enum.Material.Ice)

-- Other: Detecting parts in Region3
local ignore = workspace:FindFirstChild("IgnoreThis")
local maxParts = 50
local foundParts = workspace:FindPartsInRegion3(expanded, ignore, maxParts)
for _, part in ipairs(foundParts) do
    print("Found part:", part:GetFullName())
end

-- Summary:
-- Region3 is always axis-aligned and used for spatial queries, not for rendering.