-- Basic Api (Common Across Most Modules)
local Octree = require(path.to.Octree)
local tree = Octree.new(origin: Vector3, halfSize: number, maxPerNode: number)      -- Create octree covering a cubic region

-- Inserting Objects
local id = tree:CreateNode(position: Vector3, data: any)                            -- Inserts an object with position & arbitrary data, returns a node id
-- 'data' can be anything: a part, player, table, etc.

-- Updating/Removing
tree:UpdateNode(id, newPosition: Vector3)                                           -- Moves the node to a new position (call this if object moves)
tree:RemoveNode(id)                                                                 -- Removes the node/object from the octree

-- Nearest/Region Queries
tree:RadiusSearch(center: Vector3, radius: number)                                  -- Returns a list of all nodes within radius of center
tree:KNearestNeighbors(center: Vector3, k: number)                                  -- Returns the k closest nodes to center (fast nearest search)
tree:GetAllInBox(center: Vector3, size: Vector3)                                    -- Returns all nodes in a 3D box/region (axis-aligned)

-- Getting Data From A Node
local pos, data = tree:GetNodePosition(id), tree:GetNodeData(id)                    -- Fetch stored position and user data for a node

-- Advanced Usage
tree:Clear()                                                                        -- Removes all nodes from the octree
tree:GetNodeCount()                                                                 -- Returns total number of nodes stored

-- Example Usage
local Octree = require(path.to.Octree)
local tree = Octree.new(Vector3.new(0,0,0), 512, 8)                                 -- Center (0,0,0), half-size 512, up to 8 nodes per leaf

local id1 = tree:CreateNode(Vector3.new(10,0,10), workspace.Tree)
local id2 = tree:CreateNode(Vector3.new(-5,2,3), {MyData="hi"})

tree:UpdateNode(id1, Vector3.new(11,0,10))                                          -- Move node if the object moves in-game

for _, node in ipairs(tree:RadiusSearch(Vector3.new(0,0,0), 20)) do
    print("Found nearby node:", node.Data, node.Position)
end

tree:RemoveNode(id2)

-- Example: Find the 5 closest enemies to a player:
local nearest = tree:KNearestNeighbors(player.Position, 5)
for _, node in ipairs(nearest) do
    print("Enemy:", node.Data, "at", node.Position)
end

-- Clear all nodes (reset the octree)
tree:Clear()

-- Typical Methods/Signatures (All Roblox Octree Libs)
Octree.new(origin: Vector3, halfSize: number, maxPerNode: number)
Octree:CreateNode(position: Vector3, data: any): id
Octree:UpdateNode(id, position: Vector3)
Octree:RemoveNode(id)
Octree:RadiusSearch(center: Vector3, radius: number): {nodes}
Octree:KNearestNeighbors(center: Vector3, k: number): {nodes}
Octree:GetAllInBox(center: Vector3, size: Vector3): {nodes}
Octree:GetNodePosition(id): Vector3
Octree:GetNodeData(id): any
Octree:Clear()
Octree:GetNodeCount(): number

-- Use Cases
    -- Dynamic proximity detection (explosions, auras, player search, vision/cone checks)
    -- Large open-worlds with hundreds/thousands of moving parts/players
    -- Efficient anti-lag for area-based scripts (damage, loot, NPCs, AI, projectiles, etc.)
    -- Camera/environment culling, visibility optimization

-- Notes
    -- Always call UpdateNode when an object moves significantly—octrees don’t update automatically!
    -- All search results are in the form of a list/table of nodes (each with .Data and .Position)
    -- Octree size/halfSize must fully cover your scene; choose maxPerNode based on density/performance (typically 4–16)
    -- Many Roblox Octree modules exist—APIs may vary slightly, but these patterns are standard
    -- Place the Octree module in ReplicatedStorage or ServerScriptService and require as needed for efficient spatial queries.

-- The Module: https://create.roblox.com/store/asset/18429057500/OctreeOptimizationService