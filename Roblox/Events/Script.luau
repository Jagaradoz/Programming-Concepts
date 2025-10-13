-- Regular Events
Instance.Changed:Connect(func)                                  -- Fires when any property of the instance changes
Instance.AncestryChanged:Connect(func)                          -- Fires when the instance's parent or ancestry changes
Instance.ChildAdded:Connect(func)                               -- Fires when a child is added to the instance
Instance.ChildRemoved:Connect(func)                             -- Fires when a child is removed from the instance
Instance.DescendantAdded:Connect(func)                          -- Fires when any descendant is added under the instance
Instance.DescendantRemoving:Connect(func)                       -- Fires when any descendant is about to be removed
Instance:GetPropertyChangedSignal("Prop"):Connect(func)         -- Fires when a specific property changes

-- Attribute Events
Instance.AttributeChanged:Connect(func)                         -- Fires when any attribute changes
Instance:GetAttributeChangedSignal("Attr"):Connect(func)        -- Fires when a specific attribute changes

-- Connection Objects
local conn = event:Connect(func)                                -- Returns a connection object; call conn:Disconnect() to remove the handler
local pconn = event:ConnectParallel(func)                       -- Returns a parallel connection object; handler runs in a parallel Lua thread (server-only, stateless, non-yielding)
event:Wait()                                                    -- Yields the current thread until the event fires; returns event arguments
conn:Disconnect()                                               -- Disconnects the event handler so it will not be called again