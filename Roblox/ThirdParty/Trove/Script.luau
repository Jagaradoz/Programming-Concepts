local Trove = require(game.ReplicatedStorage.Trove)

-- 1. Trove Creation
local trove = Trove.new() 

-- 2. Adding resources to clean up
    -- 2.1 Instances (destroyed automatically)
    -- 2.2 Connections
    -- 2.3 Functions (custom cleanup actions)
    -- 2.4 "AttachToInstance" (auto-clean when instance is destroyed)
local part = Instance.new("Part")
trove:Add(part)                                                 -- Will be destroyed when trove:Clean()/Destroy() is called

local conn = part.Touched:Connect(function() ... end)
trove:Add(conn)                                                 -- Connection is disconnected on cleanup

trove:Add(function() ... end)                                   -- Add custom Trove

local gui = Instance.new("ScreenGui")
trove:AttachToInstance(gui)                                     -- Trove will clean itself when gui is destroyed

-- 3. Cleaning up
    -- 3.1 Clean (can reuse Trove)
    -- 3.2 Destroy (permanent)
trove:Clean()                                                   -- Destroys/cleans all managed resources, Trove can be used again
trove:Destroy()                                                 -- Like Clean, but you shouldn't use the Trove anymore

-- 4. Removing specific items
trove:Remove(part)                                              -- Removes from Trove, but does NOT clean/destroy it

-- 5. Nesting Troves
local parentTrove = Trove.new()
local childTrove = Trove.new()
parentTrove:Add(childTrove)                                     -- Cleaning parentTrove will also clean childTrove and its items

-- 6. Extend (combine contents of two Troves)
local t1, t2 = Trove.new(), Trove.new()
local inst = Instance.new("Folder")
t1:Add(inst)
t2:Extend(t1)                                                   -- Now t2 manages all items in t1

-- 7. IsEmpty
if trove:IsEmpty() then ... end

-- Example:
local MyClass = {}
MyClass.__index = MyClass

function MyClass.new()
	local self = setmetatable({}, MyClass)
	self._trove = Trove.new()
	self._trove:Add(Instance.new("Part"))
	return self
end

function MyClass:Destroy()
	self._trove:Destroy()
end

local obj = MyClass.new()
obj:Destroy()                                                   -- all internal resources cleaned up

-- Caution:
    -- Passing arguments to functions is not supported; store references with upvalues if needed
    -- Use Trove for every object/class to avoid memory leaks

-- The Module: https://create.roblox.com/store/asset/13012417971/Trove
