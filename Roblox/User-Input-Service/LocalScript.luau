-- UserInputService Scenarios:
-- Keyboard, mouse, touch, and gamepad input events
-- Input state queries
-- Input device connections/disconnections
-- Mobile sensors (accelerometer, gyroscope, orientation)
-- Focus and input capturing
-- Input device availability and platform checks
-- Input behavior configuration

local UserInputService = game:GetService("UserInputService")

-- 1. Detect keyboard, mouse, and gamepad input events
    -- InputBegan: fired when key/button pressed or input started
    -- InputEnded: fired when key/button released or input ended
    -- InputChanged: fired when input state changes (e.g., mouse moves, thumbstick tilt)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then ... end
    if input.KeyCode == Enum.KeyCode.R then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton3 then ... end
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then ... end -- Query key hold state
    if input.UserInputType == Enum.UserInputType.Gamepad1 then print("Gamepad button pressed:", input.KeyCode.Name) end
end)
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then ... end
    if input.KeyCode == Enum.KeyCode.R then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then ... end
    if input.UserInputType == Enum.UserInputType.MouseButton3 then ... end
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then ... end
    if input.UserInputType == Enum.UserInputType.Gamepad1 then print("Gamepad button released:", input.KeyCode.Name) end
end)
UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.MouseMovement then ... end
    if input.UserInputType.Name:match("^Gamepad") then ... end         -- Gamepad thumbstick movement
end)

-- 2. Detect touch input (mobile/tablet)
UserInputService.TouchTap:Connect(function(...) ... end)
UserInputService.TouchSwipe:Connect(function(...) ... end)
UserInputService.TouchLongPress:Connect(function(...) ... end)
UserInputService.TouchPan:Connect(function(...) ... end)
UserInputService.TouchRotate:Connect(function(...) ... end)
UserInputService.TouchPinch:Connect(function(...) ... end)

-- 3. Gamepad input: connect/disconnect
UserInputService.GamepadConnected:Connect(function(...) ... end)
UserInputService.GamepadDisconnected:Connect(function(...) ... end)

-- 4. Mouse wheel/buttons/idle
UserInputService.MouseWheelForward:Connect(function(...) ... end)
UserInputService.MouseWheelBackward:Connect(function(...) ... end)
UserInputService.MouseButton1Down:Connect(function(...) ... end)
UserInputService.MouseButton1Up:Connect(function(...) ... end)
UserInputService.MouseButton2Down:Connect(function(...) ... end)
UserInputService.MouseButton2Up:Connect(function(...) ... end)
UserInputService.MouseButton3Down:Connect(function(...) ... end)
UserInputService.MouseButton3Up:Connect(function(...) ... end)
UserInputService.MouseIdle:Connect(function(...) ... end)
UserInputService.MouseIconEnabled = true

-- 5. Focus, text input, and input capture
UserInputService.TextBoxFocused:Connect(function(...) ... end)
UserInputService.TextBoxFocusReleased:Connect(function(...) ... end)
UserInputService.WindowFocused:Connect(function(...) ... end)
UserInputService.WindowFocusReleased:Connect(function(...) ... end)

-- 6. Mobile sensors
UserInputService.AccelerometerChanged:Connect(function(...) ... end)
UserInputService.GyroscopeChanged:Connect(function(...) ... end)
UserInputService.DeviceGravityChanged:Connect(function(...) ... end)
UserInputService.DeviceRotationChanged:Connect(function(...) ... end)
UserInputService.OrientationChanged:Connect(function(...) ... end)

-- 7. Detect Jump Request
UserInputService.JumpRequest:Connect(function(...) ... end)

-- 8. Platform/device queries (properties)
local isKeyboardEnabled = UserInputService.KeyboardEnabled              -- true if keyboard is available
local isMouseEnabled = UserInputService.MouseEnabled                    -- true if mouse is available
local isTouchEnabled = UserInputService.TouchEnabled                    -- true if touch input is available
local isGamepadEnabled = UserInputService.GamepadEnabled                -- true if gamepad input is available
local isVREnabled = UserInputService.VREnabled                          -- true if VR is enabled
local isAccelerometerEnabled = UserInputService.AccelerometerEnabled
local isGyroscopeEnabled = UserInputService.GyroscopeEnabled
local isMouseIconEnabled = UserInputService.MouseIconEnabled            -- true if mouse cursor is shown

-- 9. Query input states and devices
local isKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.W)   -- true if W is being held
local isMouseButtonPressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
local isGamepadButtonDown = UserInputService:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA)
local lastInputType = UserInputService:GetLastInputType()      -- Get last input device type used
local connectedGamepads = UserInputService:GetConnectedGamepads()  -- Table of connected gamepads

-- 10. Capture/cancel input
UserInputService.ModalEnabled = false         -- If true, only Modal GUI receives input
UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None -- Custom mouse icon control

-- 11. Additional properties
local touchCount = UserInputService.TouchCount                -- Number of current touches (mobile)
local mouseDelta = UserInputService:GetMouseDelta()           -- Delta movement of the mouse since last frame
local deviceAcceleration = UserInputService:GetDeviceAcceleration()
local deviceGravity = UserInputService:GetDeviceGravity()
local deviceRotation = UserInputService:GetDeviceRotation()
local deviceOrientation = UserInputService:GetDeviceOrientation()
local enableVirtualCursor = UserInputService.VirtualCursorEnabled -- For certain accessibility/gamepad setups

-- 12. Platform and user agent
local isTenFootInterface = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled -- TV/console interface guess
local isConsole = UserInputService:GetPlatform() == Enum.Platform.XBoxOne or UserInputService:GetPlatform() == Enum.Platform.PS4

-- 13. Utility: Reset input capture, get supported devices
UserInputService:Recenter()                                  -- Resets the device orientation/position
local supportedGamepads = UserInputService:GetSupportedGamepads() -- Table of Enum.UserInputType supported

-- 14. Utility: GameProcessedEvent and InputService hierarchy
    -- Most UI input events bubble up from focused objects to core scripts, 
    -- unless stopped by returning true in relevant event connections (used in custom GUIs).

-- 15. Utility: BindAction (use ContextActionService for modern input binding, not UserInputService directly)
    -- ContextActionService is preferred for key/action binding in new projects.
