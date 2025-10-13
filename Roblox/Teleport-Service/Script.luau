local TeleportService = game:GetService("TeleportService")
local teleportOptions = Instance.new("TeleportOptions")

-- Methods:
    -- 1. :Teleport(placeId, player, teleportOptions)                                   : Teleports a single player to a place. TeleportOptions is optional.
    -- 2. :TeleportAsync(placeId, players, teleportOptions)                             : Teleports multiple players asynchronously to a place. TeleportOptions is optional.
    -- 3. :ReserveServer(placeId)                                                       : Reserves a private server for a place, returns a server access code.
    -- 4. :TeleportToPlaceInstance(placeId, accessCode, players)                        : Teleports players to a specific server instance using access code.
    -- 5. :SetTeleportGui(gui)                                                          : Sets a custom GUI to show during teleport instead of default loading screen.
    -- 6. :GetArrivingTeleportGui()                                                     : Gets the GUI shown when a player arrives after teleport.
    -- 7. :SetTeleportData(data)                                                        : Stores custom data to send to the destination place during teleport.
    -- 8. :GetJoinData()                                                                : Retrieves custom data passed from previous place (via SetTeleportData).
TeleportService:Teleport(12345678, player)
TeleportService:TeleportAsync(12345678, {player1, player2})
TeleportService:ReserveServer(12345678)
TeleportService:TeleportToPlaceInstance(12345678, privateServerCode, {player})
TeleportService:SetTeleportGui(customLoadingGui)
TeleportService:GetArrivingTeleportGui()
TeleportService:SetTeleportData({level = 5, score = 100})
TeleportService:GetJoinData()

-- TeleportOptions Properties:
-- 1. ShouldReserveServer (bool)                                                    : If true, reserves a private server for teleport. Useful to create private lobbies or reserved sessions.
-- 2. TeleportData (any)                                                            : Custom data sent to the destination place. Accessible via TeleportService:GetJoinData() in the target place.
-- 3. SpawnName (string)                                                            : Name of a spawn location in the destination place. Teleports player to the spawn with this exact name.
-- 4. Timeout (number)                                                              : Maximum seconds to wait for teleport to succeed before failing. Default is 30 seconds.
-- 5. ReservedServerAccessCode (string)                                             : Assign the reserved server's access code to TeleportOptions. This can reuse the reserved server code.
teleportOptions.ShouldReserveServer = true
teleportOptions.TeleportData = {
    playerLevel = 10,
    inventory = {"Sword", "Shield"},
}
teleportOptions.SpawnName = "SpecialSpawnPoint"
teleportOptions.Timeout = 60
teleportOptions.ReservedServerAccessCode = TeleportService:ReserveServer(12345678) 

-- Reserved Server Examples:
    -- Manual Reservation:
local reservedServerCode = TeleportService:ReserveServer(placeId)
local options = Instance.new("TeleportOptions")
options.ReservedServerAccessCode = reservedServerCode
TeleportService:TeleportAsync(placeId, {player}, options)

    -- Implicit Reservation:
local options = Instance.new("TeleportOptions")
options.ShouldReserveServer = true
TeleportService:TeleportAsync(placeId, {player}, options)
