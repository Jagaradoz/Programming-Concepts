local ContextActionService = game:GetService("ContextActionService")

-- Binding Function:
    -- actionName: string, the name of the action bound
    -- inputState: Enum.UserInputState (Begin, Change, End)
    -- inputObject: InputObject, details about the input event (key, button, device)
local function onAction(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        print(actionName .. " started")
    elseif inputState == Enum.UserInputState.End then
        print(actionName .. " ended")
    end
end

-- Methods:
    -- 1. BindAction: binds inputs to a named action
        -- actionName (string): unique name for the action
        -- functionToBind (function): callback fired on input state changes
        -- createTouchButton (bool): whether to create a mobile touch button for the action
        -- inputEnums...: one or more Enum.KeyCode or Enum.UserInputType to bind
    -- 2. UnbindAction: removes the binding
    -- 3. BindActionAtPriority: same as BindAction but allows setting input priority (higher number = higher priority)
    -- 4. Mobile Buttons: created automatically if createTouchButton=true; customize with GetButton()
ContextActionService:BindAction("Action", onAction, false, Enum.KeyCode.Space, Enum.KeyCode.ButtonA)
ContextActionService:UnbindAction("Action")
ContextActionService:BindActionAtPriority("Action", onAction, false, 10, Enum.KeyCode.LeftShift)
ContextActionService:BindAction("Action", onAction, true, Enum.UserInputType.Touch, Enum.KeyCode.E)

local actionButton = ContextActionService:GetButton("Action")
actionButton:SetTitle("Fire")                         -- Set the button text/title
actionButton:SetImage("rbxassetid://123456789")       -- Set button icon image (replace with your asset ID)
actionButton:SetPosition(UDim2.new(0.8, 0, 0.8, 0))   -- Position button near bottom-right corner