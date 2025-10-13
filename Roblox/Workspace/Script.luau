-- Properties
-- Terrain:
workspace.Terrain                                    -- workspace.Terrain:Access methods like FillBlock, FillBall, etc.

-- Camera:
workspace.CurrentCamera                              -- workspace.CurrentCamera:Use camera manipulation methods (see Camera API)

-- Streaming, Physics, Rendering:
workspace.StreamingEnabled                           -- bool: If true, uses streaming for parts/terrain (for large worlds/performance)
workspace.StreamingMinRadius                         -- number: Minimum radius around player always loaded
workspace.StreamingTargetRadius                      -- number: Desired radius for streaming in/out content
workspace.Gravity                                    -- number: Acceleration due to gravity (default: 196.2 studs/s²)
workspace.FallenPartsDestroyHeight                   -- number: Y-value at which falling parts auto-destroy
workspace.Terrain                                    -- Terrain object for voxel landscape (singleton)
workspace.TerrainWaterColor                          -- Color3: color of water in Terrain

-- Simulation & Constraints:
workspace.AllowThirdPartySales                       -- (legacy, rarely used)
workspace.DistributedGamePhysics                     -- bool: enables distributed physics (rare/advanced)
workspace.PhysicsSteppingMethod                      -- Enum: manual, fixed, automatic
workspace.PhysicsSimulationRate                      -- number: simulation rate (Hz)
workspace.AssemblyLinearVelocity                     -- vector, inherited, affects all root assemblies
workspace.CurrentCamera                              -- Camera object currently rendering the player's view

-- Filtering & Security:
workspace.FilteringEnabled                           -- (DEPRECATED, always true since 2022)
workspace.ClientAnimatorThrottling                   -- controls animation update throttling for clients

-- Replication/Persistence:
workspace.IgnoreGuiInset                             -- (for ViewportFrame/camera, affects UI rendering)
workspace.StreamingPauseMode                         -- (controls how streaming pauses with menus, advanced)

-- Services:
workspace.Ambient                                    -- Color3: ambient light color
workspace.Lighting                                   -- (actually in game.Lighting, not workspace, but impacts appearance)

-------------------------------------------------------------------------------------------------------------------------------------------

-- Methods
-- Child/Instance Management (all inherited from Instance):
workspace:FindFirstChild(name, recursive)                                                       -- Finds first child named 'name'; recursive search if true
workspace:WaitForChild(name, timeout)                                                           -- Waits for a child named 'name' to appear, or until timeout
workspace:GetChildren()                                                                         -- Returns table of immediate children
workspace:GetDescendants()                                                                      -- Returns table of all descendants (all nested children)
workspace:Clone()                                                                               -- Deep-copies workspace and all descendants (rarely used)
workspace:ClearAllChildren()                                                                    -- Removes all children from workspace (except Terrain)

-- Part/Region Queries:
workspace:FindPartOnRay(ray, ignoreDescendantsInstance, terrainCellsAreCubes, ignoreWater)      -- Finds first BasePart hit by 'ray', with options to ignore certain instances/terrain/water
workspace:FindPartOnRayWithWhitelist(ray, whitelist, ignoreWater)                               -- Like above, but only hits parts in 'whitelist' table
workspace:FindPartOnRayWithIgnoreList(ray, ignoreList, ignoreWater)                             -- Like above, but skips parts/instances in 'ignoreList'
workspace:Raycast(origin, direction, raycastParams)                                             -- Modern raycast; returns RaycastResult for first part hit along the line
workspace:Shapecast(shape, params)                                                              -- Casts a geometric shape (box, capsule, etc) through space; returns details on all intersections (advanced physics query)
workspace:Spherecast(origin, direction, radius, params)                                         -- Casts a sphere of given radius along a line, returns hits; useful for "thick" raycasts or area checks
workspace:GetPartsInRegion3(region3, ignoreDescendants, maxParts)                               -- Returns all parts overlapping a Region3 area; can ignore descendants/limit result count
workspace:GetPartsInPart(part)                                                                  -- Returns all parts touching or overlapping the given 'part'
workspace:GetPartBoundsInBox(cframe, size, overlapParams)                                       -- Returns all parts intersecting a box defined by 'cframe' and 'size'
workspace:BulkMoveTo(instances, cframes, welds)                                                 -- Moves multiple parts to new positions/orientations efficiently; maintains welds if specified



-------------------------------------------------------------------------------------------------------------------------------------------

-- Events
-- Standard Instance signals:
workspace.ChildAdded/ChildRemoved                       -- When object is added/removed from workspace
workspace.DescendantAdded/Removing                      -- Deep child add/remove (incl. all sub-objects)
workspace.AncestryChanged                               -- When workspace's parent changes (never in practice)
workspace.Changed(property)                             -- Any property change
workspace.AttributeChanged(attr)                        -- Custom attribute change

-------------------------------------------------------------------------------------------------------------------------------------------

-- Advanced Concepts
    -- Streaming: Only parts of workspace near the player are loaded/rendered for large open-world games.
    -- Terrain: Massive voxel terrain is part of workspace.Terrain and can be manipulated with APIs.
    -- Persistence: All objects in workspace are replicated to clients (unless filtered by Streaming).
    -- Filtering: (DEPRECATED) Security to prevent client/server manipulation issues, now always enabled.
    -- Region & Physics Queries: workspace methods allow for spatial queries (raycasting, overlap, etc.).
    -- Parent/Children: workspace is always a direct child of DataModel (game) and a parent to nearly all physical instances.
-- Notes
    -- Avoid storing non-physical or gameplay-only objects in workspace (use ReplicatedStorage, ServerStorage, etc.)
    -- workspace:ClearAllChildren() does NOT remove Terrain, only "regular" children
    -- Changing Gravity or StreamingRadius affects ALL players
    -- Most methods and events are inherited from Instance, so workspace can be used like any container
