local WindShake = require(path.to.WindShake)

local part = workspace.Tree.Trunk
WindShake.Add(part) -- starts with default settings

-- Add with custom options:
WindShake.Add(part, {
    Speed = 1.5,        -- how fast the wind moves (default 1)
    Power = 0.3,        -- intensity of sway/shake (default 0.15)
    Sway = Vector3.new(1,0,1), -- which axes to sway (1 = yes, 0 = no)
    Bend = 0.5,         -- how much to bend vs. just shake (0 = rigid, 1 = very bendy)
    Seed = 42,          -- random seed for unique motion
    Offset = 0.0,       -- phase offset (default 0)
})

-- Add wind to an entire Model (uses PrimaryPart):
WindShake.Add(workspace.TreeModel, { Power = 0.2 })

-- Remove wind effect at any time:
WindShake.Remove(part)

-- Update wind settings live:
WindShake.Update(part, { Power = 0.1, Speed = 2.0 })

-- List all affected objects:
for inst in WindShake.GetActives() do
    print(inst)
end

-- Set global wind params (affects all objects unless locally overridden):
WindShake.SetGlobalWind({ Speed = 1.5, Power = 0.2 })

-- To affect Accessories, pass the Accessory or its Attachment:
WindShake.Add(player.Character:FindFirstChildWhichIsA("Accessory"))

-- Stop ALL wind effects:
WindShake.RemoveAll()

-- Methods
    -- WindShake.Add(instance, [settings])         : Start wind on a Part, Model, Attachment, or Accessory
    -- WindShake.Remove(instance)                  : Stop wind on a specific object
    -- WindShake.Update(instance, settings)        : Change wind settings for an object already affected
    -- WindShake.SetGlobalWind(settings)           : Change global wind settings
    -- WindShake.GetActives()                      : Returns iterator of all objects being wind-animated
    -- WindShake.RemoveAll()                       : Removes all wind effects

-- Notes
    -- Only works on the client (visual only, no physics/network impact)
    -- Perfect for trees, plants, flags, cloth, etc. Works in real-time and with dynamic settings
    -- Requires no editing of the objects—just call Add/Remove as needed
    -- Very low performance impact, scalable to thousands of parts

-- The Module: https://create.roblox.com/store/asset/6377120469/WindShake