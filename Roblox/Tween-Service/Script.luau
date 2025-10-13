local TweenService = game:GetService("TweenService")
local part = workspace.Part 

local tweenInfo = TweenInfo.new(
    2,                                          -- Duration (seconds)
    Enum.EasingStyle.Quad,                      -- Easing style (how the animation accelerates/decelerates)
    Enum.EasingDirection.Out,                   -- Easing direction
    0,                                          -- Number of times to repeat
    false,                                      -- Should tween reverse back?
    0                                           -- Delay time before starting tween
)

local goal = {
    Position = Vector3.new(0, 10, 0),           -- Target property values (Position)
    Size = Vector3.new(2,2,2),                  -- Target property values (Size)
    Rotation = Vector3.new(90,0,0)              -- Target property values (Rotation)
}

local tween = TweenService:Create(part, tweenInfo, goal)            -- Create the tween
tween:Play()                                                        -- Play the tween, animating the part’s position smoothly over 2 seconds

tween.Completed:Connect(function() ... end)                         -- Run a function after finishes tween.
tween.Completed:Wait()                                              -- Freeze the script and continue after tween ends.