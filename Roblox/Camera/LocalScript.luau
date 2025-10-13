local camera = Workspace.CurrentCamera
-- Properties (StarterPlayer)

    -- CameraMaxZoomDistance                                        : Maximum zoom-out distance for the player camera (e.g. 128 studs)
    -- CameraMinZoomDistance                                        : Minimum zoom-in distance for the player camera (e.g. 0.5 studs)
    -- CameraMode                                                   : Sets how the camera behaves relative to the player
        -- Classic                                                  : Player can zoom and freely rotate around their character
        -- Follow                                                   : Camera automatically follows behind the character as they move
        -- LockFirstPerson                                          : Forces player into first-person mode (no zooming out)
    -- DevCameraOcclusionMode                                       : Controls what happens when something blocks the player's view
        -- Zoom                                                     : Camera zooms in to avoid clipping through objects
        -- Invisicam                                                : Objects that block view become temporarily invisible
    -- DevComputerCameraMovementMode                                : Default camera control scheme for keyboard/mouse players
        -- UserChoice                                               : Player selects their preferred mode in settings
        -- Classic                                                  : Manual rotation with right mouse drag, zoom with scroll
        -- Follow                                                   : Camera follows player’s back (like 3rd-person chase cam)
        -- Orbital                                                  : Fixed camera orbiting player from a set point
        -- CameraToggle                                             : Press Shift+Lock key to toggle between first/third-person
        -- Scriptable                                               : Camera only moves through scripts (no user control)
    -- DevTouchCameraMovementMode                                   : Default camera control for mobile/touch devices
        -- UserChoice                                               : Player selects their preferred mode
        -- Thumbstick                                               : Right virtual thumbstick moves camera
        -- Classic                                                  : Tap-and-drag to rotate, pinch to zoom
        -- Follow                                                   : Camera automatically follows behind the player
        -- Orbital                                                  : Rotates around character with touch gestures
        -- CameraToggle                                             : Tap to toggle first-person / third-person
        -- Scriptable                                               : Camera is controlled only via script


-- Properties (Workspace.CurrentCamera)
    -- .CFrame                                                      : The position and rotation of the camera in 3D space (Camera's world transform)
    -- .Focus                                                       : A CFrame indicating where the camera is looking (important for depth and focus-based effects)
    -- .HeadLocked                                                  : If true, in VR, the camera is locked to the user's head movements
    -- .HeadScale                                                   : Scales the motion of the VR headset (1 = normal, >1 = exaggerated movement)
    -- .ViewportSize                                                : The camera's render resolution as a Vector2 (width, height) in pixels
    -- .VRTiltAndRollEnabled                                        : If true, allows the camera to respond to VR headset tilting and rolling
    -- .Origin                                                      : An internal CFrame used when CameraType is Track or Attach; represents the base from which motion is calculated
    -- .PivotOffset                                                 : A CFrame offset applied to Origin; useful for adjusting camera position without changing subject
    -- .CameraSubject                                               : The object the camera is focused on or follows (e.g., a player's Humanoid, a Part, or nil for manual control)
    -- .CameraType                                                  : Controls how the camera behaves
        -- Fixed                                                    : Static camera, does not move
        -- Custom                                                   : Default dynamic camera for players (3rd person with zoom/rotate)
        -- Scriptable                                               : Camera movement fully controlled by scripts
        -- Track                                                    : Automatically orients to look at CameraSubject (no rotation freedom)
        -- Attach                                                   : Stays physically attached to CameraSubject (used for cutscenes or vehicles)
        -- Watch                                                    : Similar to Track, but orients and positions to keep subject visible
    -- .DiagonalFieldOfView                                         : Automatically calculated based on vertical FOV and aspect ratio; represents the diagonal viewing angle
    -- .FieldOfView                                                 : Vertical field of view (in degrees); defines how zoomed in the camera is (larger = wider view)
    -- .FieldOfViewMode                                             : Determines how FOV is interpreted
        -- Vertical                                                 : FieldOfView represents vertical angle (standard)
        -- Diagonal                                                 : FieldOfView is treated as diagonal (changes based on screen aspect ratio)
    -- .MaxAxisFieldOfView                                          : The maximum allowed diagonal FOV (used when FieldOfViewMode is Diagonal)

-- Methods
    -- :GetPartObscuringTarget(origin, targetPosition)              : Returns the first BasePart blocking view between two points
    -- :WorldToScreenPoint(worldPosition)                           : Converts 3D world position to 2D screen coordinates (in pixels), returns Vector3 + onScreen bool
    -- :WorldToViewportPoint(worldPosition)                         : Converts 3D world position to 2D viewport space (useful for UI), returns Vector3 + onScreen bool
    -- :ScreenPointToRay(x, y)                                      : Returns a Ray from screen point (x, y), used for clicking or aiming into 3D world
    -- :ViewportPointToRay(x, y)                                    : Returns a Ray from viewport-relative point (0–1 range), for UI-based raycasting
    -- :CalculateRawDiagonalFieldOfView(verticalFOV, aspect)        : Returns diagonal FOV value based on given vertical FOV and aspect ratio
    -- :GetRenderCFrame()                                           : Returns the actual rendered CFrame of the camera (useful for VR or custom render logic)
    -- :GetRenderFocus()                                            : Returns the actual rendered Focus CFrame
    -- :GetDepthOfFieldInFocusDistance()                            : Returns current in-focus distance for DepthOfFieldEffect (if used)
camera:GetPartObscuringTarget(camera.CFrame.Position, target.Position)
camera:WorldToScreenPoint(part.Position)
camera:WorldToViewportPoint(part.Position)
