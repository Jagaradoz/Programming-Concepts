-- PathfindingService (used to move NPCs around obstacles)

local PathfindingService = game:GetService("PathfindingService")

-- Methods
    -- :CreatePath(params)                         : Creates a new path object with optional custom parameters
    -- :FindPathAsync(start, goal)                 : Creates a path from start position to goal position, returns a Path object
    -- Path:ComputeAsync(start, goal)              : Calculates the path from start to goal (must call before using waypoints)
    -- Path:GetWaypoints()                         : Returns list of waypoints (positions the NPC should follow)
    -- Path:MoveTo(part, humanoid)                 : Automatically moves a humanoid along the computed path
    -- Path:Cancel()                               : Stops path movement immediately
    -- Path:IsValid()                              : Returns true if path was successfully calculated
    -- Path:GetStatus()                            : Returns Enum.PathStatus (Success, NoPath, or Failure)
    -- Path.Blocked:Connect(func)                  : Event fired when path becomes blocked (e.g. dynamic obstacle)
    -- Path.Reached:Connect(func)                  : Event fired when humanoid reaches a waypoint
    -- Path.Completed:Connect(func)                : Event fired when full path is reached or fails

-- Properties for PathfindingParams (optional)

local params = {
    AgentRadius             = 2,                    -- Radius of the agent in studs
    AgentHeight             = 5,                    -- Height of the agent
    AgentCanJump            = true,                 -- Allows vertical jumps
    AgentJumpHeight         = 10,                   -- How high the agent can jump
    AgentCanClimb           = true,                 -- Allows climbing vertical surfaces
    AgentClimbHeight        = 4,                    -- How tall a ledge the agent can climb
    Costs                   = {Water = 100},        -- Custom traversal cost for material types or tags
    WaypointSpacing         = 4,                    -- How far apart waypoints should be (lower = smoother path)
    TerrainAvoidance        = true                  -- Avoids steep terrain automatically
}

-- Example: Creating a custom path
local path = PathfindingService:CreatePath(params)
path:ComputeAsync(startPosition, goalPosition)
local waypoints = path:GetWaypoints()
