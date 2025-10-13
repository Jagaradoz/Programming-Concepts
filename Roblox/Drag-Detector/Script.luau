local dragDetector = Instance.new("DragDetector")
dragDetector.Parent = workspace.SomePart

-- Properties
    -- dragDetector.Enabled                                         : Enable/disable dragging
    -- dragDetector.DragStyle                                       : Defines how object moves during dragging
        -- TranslateLine                                            : 1D along Axis  
        -- TranslatePlane                                           : 2D motion in plane perpendicular to Axis  
        -- TranslatePlaneOrLine, TranslateLineOrPlane               : Mixed modes  
        -- TranslateViewPlane                                       : Plane relative to camera view  
        -- RotateAxis                                               : Rotate around Axis  
        -- RotateTrackball                                          : Trackball rotation (use TrackballRadialPullFactor & TrackballRollFactor)  
        -- BestForDevice                                            : Auto picks style per input device  
        -- Scriptable                                               : Custom drag logic via SetDragStyleFunction()
    -- dragDetector.ResponseStyle                                   : How motion is interpreted and applied
        -- Physical                                                 : Applies realistic forces (best for realism)
        -- Geometric                                                : Instantly snaps to position (best for precision)
        -- Custom                                                   : Allows manual position calculation in script
    -- dragDetector.Responsiveness       = 50                       : How quickly object moves toward cursor (higher = faster)
    -- dragDetector.ApplyAtCenterOfMass  = false                    : True = force at center, false = force at click point
    -- dragDetector.MaxForce             = 1e7                      : Max linear force applied (used with Physical)
    -- dragDetector.MaxTorque            = 1e4                      : Max rotational torque (used with rotation)
    -- dragDetector.RunLocally           = true                     : true = client-side drag, false = server-side
    -- dragDetector.PermissionPolicy     = Scriptable               : Defines who is allowed to drag the object
    -- dragDetector:SetPermissionPolicyFunction(fn)                 : Sets custom logic to allow/deny dragging
    -- dragDetector:AddConstraintFunction(priority, fn)             : Modifies allowed drag position during runtime

-- Mode Switching (alternate behavior with user input)
dragDetector.KeyboardModeSwitchKeyCode = Enum.KeyCode.LeftShift     -- Key to toggle drag mode (e.g., move vs. rotate)
dragDetector.GamepadModeSwitchKeyCode  = Enum.KeyCode.ButtonR2      -- drag mode switch for gamepads
dragDetector.VRSwitchKeyCode           = Enum.KeyCode.ButtonR2      -- drag mode switch for VR controllers

-- Direction & Reference
dragDetector.Axis           = Vector3.new(0, 1, 0)                  -- primary axis (for movement or rotation)
dragDetector.SecondaryAxis  = Vector3.new(1, 0, 0)                  -- secondary axis for dual-axis drag styles
dragDetector.Orientation    = Vector3.new(0, 0, 0)                  -- additional Euler rotation offset (YXZ order)
dragDetector.ReferenceInstance = workspace.Baseplate                -- base part used to define plane/axis space

-- Drag Limits
dragDetector.MinDragTranslation = Vector3.new(-10, 0, -10)          -- minimum offset allowed from starting position
dragDetector.MaxDragTranslation = Vector3.new(10, 0, 10)            -- maximum offset allowed during drag
dragDetector.MinDragAngle       = -math.pi / 4                      -- minimum allowed angle (in radians)
dragDetector.MaxDragAngle       =  math.pi / 4                      -- maximum allowed angle (in radians)

-- Events
-- dragDetector.DragStart(player, cursorRay, viewFrame, hitFrame, clickedPart, vrInput, isModeSwitch) : fired when dragging begins
-- dragDetector.DragContinue(player, cursorRay, viewFrame, vrInput, isModeSwitch)                     : runs each frame during drag
-- dragDetector.DragEnd(player)                                                                       : fired when dragging ends
dragDetector.DragStart:Connect(function(player, cursorRay, viewFrame, hitFrame, clickedPart, vrInput, isModeSwitch) ... end)
dragDetector.DragContinue:Connect(function(player, cursorRay, viewFrame, vrInput, isModeSwitch) ... end)
dragDetector.DragEnd:Connect(function(player) ... end)
