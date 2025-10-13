-- 1. Team (Instance under Teams service):
    -- Name (string)                    : The team’s display name.
    -- TeamColor (BrickColor)          : Used to match players and spawn points to the team.
    -- AutoAssignable (bool)           : If true, new players can automatically be assigned to this team.

-- 2. SpawnLocation (Part used for spawning):
    -- TeamColor (BrickColor)          : Must match the Team's TeamColor to restrict spawns to that team.
    -- Neutral (bool)                  : 
        -- true  → Any player can spawn here, regardless of team.
        -- false → Only players whose TeamColor matches can spawn here.
    -- AllowTeamChangeOnTouch (bool)   : If true, touching the spawn changes the player's team to this spawn’s TeamColor.

-- Example:

-- Create Teams:
local TeamsService = game:GetService("Teams")

local redTeam = Instance.new("Team")
redTeam.Name = "Red"
redTeam.TeamColor = BrickColor.new("Bright red")
redTeam.AutoAssignable = true
redTeam.Parent = TeamsService

local blueTeam = Instance.new("Team")
blueTeam.Name = "Blue"
blueTeam.TeamColor = BrickColor.new("Bright blue")
blueTeam.AutoAssignable = true
blueTeam.Parent = TeamsService

-- Create SpawnLocations:
local redSpawn = Instance.new("SpawnLocation")
redSpawn.Name = "RedSpawn"
redSpawn.Position = Vector3.new(0, 5, 0)
redSpawn.TeamColor = BrickColor.new("Bright red")
redSpawn.Neutral = false
redSpawn.AllowTeamChangeOnTouch = false
redSpawn.Parent = workspace

local blueSpawn = Instance.new("SpawnLocation")
blueSpawn.Name = "BlueSpawn"
blueSpawn.Position = Vector3.new(20, 5, 0)
blueSpawn.TeamColor = BrickColor.new("Bright blue")
blueSpawn.Neutral = false
blueSpawn.AllowTeamChangeOnTouch = false
blueSpawn.Parent = workspace
