local Zone = require(game.path.Zone)

-- Creation
local zoneA = Zone.new(workspace.ZoneParts)                         -- build from parts container
local zoneB = Zone.fromRegion(CFrame.new(), Vector3.new(50,50,50))  -- build from region

-- Properties
zoneA.container                     -- original container (Model/Folder/BaseParts)
zoneA.groupParts                    -- base parts defining zone geometry
zoneA.name                          -- optional name
zoneA.accuracy                      -- current Accuracy enum (Low/Medium/High)
zoneA.enterDetection                -- Detection enum for entry checks (Centre/WholeBody)
zoneA.exitDetection                 -- Detection enum for exit checks
zoneA.hasRelocated                  -- true if relocate() was used
zoneA.worldModel                    -- WorldModel instance after relocation
zoneA.relocationContainer           -- parent container for relocated parts
zoneA.settingsGroupName             -- bound group name if any

-- Enums
Zone.enum = {
  Accuracy = { Low = 1, Medium = 2, High = 3 },
  Detection = { WholeBody = 1, Centre = 2 },
}

-- Methods
zoneA:setAccuracy("High" / "Medium" / "Low")                        -- Adjusts detection frequency (affects performance & precision)
zoneA:setDetection("Centre" / "WholeBody")                          -- Sets detection mode for both entering and exiting (center point or whole body)
zoneA:setEnterDetection("Centre" / "WholeBody")                     -- Sets detection mode only for entering
zoneA:setExitDetection("Centre" / "WholeBody")                      -- Sets detection mode only for exiting
zoneA:relocate()                                                    -- Moves zone geometry into an invisible WorldModel container (removes parts from Workspace)
zoneA:trackItem(instance)                                           -- Begin tracking a custom item (BasePart, Model, etc.) for zone detection
zoneA:untrackItem(instance)                                         -- Stop tracking a custom item
zoneA:onItemEnter(item, callback)                                   -- Calls the callback function once when the specified tracked item enters the zone
zoneA:onItemExit(item, callback)                                    -- Calls the callback function once when the specified tracked item exits the zone
zoneA:getPlayers() -> table of Players                              -- Returns a table of all players currently inside the zone
zoneA:findPlayer(player) -> bool                                    -- Returns true if the specified player is inside the zone
zoneA:getParts() -> table of BaseParts                              -- Returns a table of BaseParts currently overlapping the zone (excluding tracked items)
zoneA:findPart(basePart) -> (bool, table of touching zone parts)    -- Returns true if part is inside the zone, plus which zone parts it touches
zoneA:findItem(item) -> bool                                        -- Returns true if a tracked item is inside the zone
zoneA:findPoint(position) -> bool                                   -- Returns true if a given Vector3 position is within the zone
zoneA:getRandomPoint() -> (Vector3, table of touching parts)        -- Returns a random point inside the zone and the zone parts touching that point
zoneA:bindToGroup(groupName)                                        -- Binds the zone to a settings group (for grouped zone behavior)
zoneA:unbindFromGroup(groupName)                                    -- Removes the zone from its settings group
zoneA:destroy()                                                     -- Cleans up the zone entirely (disconnects events, clears memory)

-- Events
zoneA.localPlayerEntered:Connect(function() end)                -- Fires when the LocalPlayer enters the zone (Client-side only)
zoneA.localPlayerExited:Connect(function() end)                 -- Fires when the LocalPlayer exits the zone (Client-side only)
zoneA.playerEntered:Connect(function(player) end)               -- Fires when *any* player enters the zone (Server or Client depending on context)
zoneA.playerExited:Connect(function(player) end)                -- Fires when *any* player exits the zone
zoneA.partEntered:Connect(function(part) end)                   -- Fires when any BasePart (excluding tracked items) enters the zone
zoneA.partExited:Connect(function(part) end)                    -- Fires when any BasePart (excluding tracked items) exits the zone
zoneA.itemEntered:Connect(function(item) end)                   -- Fires when a *tracked* item (custom part, NPC, etc.) enters the zone
zoneA.itemExited:Connect(function(item) end)                    -- Fires when a *tracked* item exits the zone

-- Zone Controller / Group Settings
ZoneController.setGroup(groupName, { onlyEnterOnceExitedAll = bool })
ZoneController.getGroup(groupName)
ZoneController.getTouchingZones(characterOrPart) -> table
ZoneController.getCharacterSize(character) -> Vector3

-- Example:
zoneB:setAccuracy("Low")
zoneB:setDetection("WholeBody")
zoneB.playerEntered:Connect(function(plr)
    print(plr.Name, "entered zone", zoneB.name or "(unnamed)")
end)
local pt, hit = zoneB:getRandomPoint()
print("Spawn here:", pt, "touches parts:", hit)

-- The Module: https://github.com/1ForeverHD/ZonePlus