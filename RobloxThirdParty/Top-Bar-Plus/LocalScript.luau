-- Setup
local TopbarPlus = require(path.to.TopbarPlus)
local icon = TopbarPlus.new()                               -- Create a new topbar icon

-- Icon Methods
icon:SetName("MyTool")                                      -- Set the name (tooltip and menu header)
icon:SetImage("rbxassetid://12345")                         -- Set the icon's image
icon:SetLabel("Open")                                       -- Sets optional label text next to icon
icon:SetOrder(1)                                            -- Set order among other icons (lower = leftmost)
icon:SetToggleMode(true)                                    -- Makes icon toggleable (sticky "on/off" state)
icon:Select() icon:Deselect() icon:IsSelected()             -- Programmatically select/deselect/toggle/check state
icon:Destroy()                                              -- Removes the icon and disconnects all events

-- Menus, Dropdowns, Notifications
icon:BindMenu(menuTable)                                    -- Adds a dropdown menu to the icon (see menu format below)
icon:UnbindMenu()                                           -- Removes menu
icon:SetBadge(badge)                                        -- Sets numeric/text badge ("!" or number)
icon:RemoveBadge()                                          -- Removes badge

-- Events
icon.Selected:Connect(function() ... end)                   -- Fires when icon is selected (clicked or toggled on)
icon.Deselected:Connect(function() ... end)                 -- Fires when icon is deselected (untoggled)
icon.Toggled:Connect(function(isSelected) ... end)          -- Fires on any toggle (selected/deselected)
icon.MenuOpened:Connect(function() ... end)                 -- Fires when menu is opened
icon.MenuClosed:Connect(function() ... end)                 -- Fires when menu is closed
icon.Clicked:Connect(function() ... end)                    -- Fires for every click (regardless of toggle mode)
icon.DoubleClicked:Connect(function() ... end)              -- Fires for double-clicks
icon.RightClicked:Connect(function() ... end)               -- Fires for right-clicks

-- Visibility & Customization
icon:Show() icon:Hide() icon:IsVisible()                    -- Show/hide the icon (useful for stateful UI)
icon:SetEnabled(true/false)                                 -- Enable/disable user interaction
icon:SetDropdown(true/false)                                -- Enable/disable dropdown arrow (menu indicator)
icon:DisableDropdown() icon:EnableDropdown()                -- Quick menu indicator toggles
icon:SetMenu(menuTable)                                     -- Alias for BindMenu

-- Advanced: Parenting & Grouping
icon:BindToFrame(frame)                                     -- Binds icon to a custom frame (for custom topbars)
icon:UnbindFromFrame()                                      -- Reverts to default topbar
icon:SetParent(parent)                                      -- Changes icon's parent (useful for submenus/custom containers)

-- Menu Format
icon:BindMenu({
    {
        Icon = "rbxassetid://54321", Text = "MenuOption1", Callback = function() ... end
    },
    {
        Icon = "rbxassetid://54322", Text = "MenuOption2", Callback = function() ... end
    },
})

-- Static/Utility Methods
TopbarPlus.GetIcon("MyTool")                                -- Returns icon instance by name (if exists)
TopbarPlus.GetIcons()                                       -- Returns array of all current icons
TopbarPlus.PreserveCornerRadius(true/false)                 -- Toggle icon shape rounding

-- Themes, Appearance & Draggable Menus
icon:SetThemeColor("Background", Color3.new(...))           -- Set icon background color
icon:SetThemeColor("Foreground", Color3.new(...))           -- Set icon image/tint color
icon:SetThemeColor("Text", Color3.new(...))                 -- Set label/menu text color
icon:EnableDragging() icon:DisableDragging()                -- Allow/disallow menu to be moved by player

-- Badges, Sounds & Animation
icon:SetBadge("!")                                          -- Set badge (text, number, or "!")
icon:RemoveBadge()                                          -- Remove badge
icon:SetSound("rbxassetid://...", "Click")                  -- Set sound for click/toggle/etc.

-- Clean Up
icon:Destroy()                                              -- Removes icon, disconnects all events

-- Example:
local icon = TopbarPlus.new()
icon:SetName("MyTool")
icon:SetImage("rbxassetid://12345")
icon:BindMenu({
    {Icon="rbxassetid://54321", Text="Settings", Callback=function() print("Settings opened") end},
    {Icon="rbxassetid://54322", Text="Help", Callback=function() print("Help opened") end}
})
icon.Selected:Connect(function() print("Tool selected!") end)
icon:SetBadge("!")
icon:Show()

-- Notes
    -- Works in both Studio and live games; only runs on client
    -- All icons stack left-to-right, ordered by :SetOrder()
    -- ToggleMode allows icons to be sticky ("on"/"off") like the chat or backpack
    -- All connections/events are RBXScriptSignal style (Disconnect to clean up)
    -- Ideal for tools, menus, powerups, status displays, custom topbar GUIs, badges, etc.

-- The Module: https://create.roblox.com/store/asset/92368439343389/TopbarPlus