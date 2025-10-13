-- Load the vector library
local vector = require(game:GetService("ReplicatedStorage"):WaitForChild("vector"))

-- Properties
local zero = vector.zero            -- (0, 0, 0)
local one = vector.one              -- (1, 1, 1)

-- Creation
local a = vector.create(3, -4, 2)
local b = vector.create(1, 5, -7)

-- Basic Math
local added      = vector.add(a, b)
local subtracted = vector.sub(a, b)
local scaled     = vector.mul(a, 2)
local divided    = vector.div(b, 2)
local negated    = vector.neg(a)

-- Length & Direction
local mag_a      = vector.magnitude(a)
local norm_a     = vector.normalize(a)
local dist_ab    = vector.distance(a, b)

-- Dot, Cross, Angle
local dot_ab     = vector.dot(a, b)
local cross_ab   = vector.cross(a, b)
local angle_ab   = vector.angle(a, b)

-- Interpolation & Projection
local midpoint   = vector.lerp(a, b, 0.5)
local projected  = vector.project(a, b)

-- Component-wise Math
local floored    = vector.floor(a)
local ceiled     = vector.ceil(a)
local rounded    = vector.round(a)
local absed      = vector.abs(a)
local signed     = vector.sign(a)
local clamped    = vector.clamp(a, vector.create(0, 0, 0), vector.create(1, 1, 1))
local maxed      = vector.max(a, b)
local mined      = vector.min(a, b)

-- Logical
local isEqual    = vector.eq(a, vector.create(3, -4, 2)) -- true if same x/y/z

-- Conversion for Roblox API
local toVector3 = function(v)
    return Vector3.new(v.x, v.y, v.z)
end

-- Example: Use with Roblox Part
workspace.Part.Position = toVector3(norm_a)
workspace.Part.Size     = toVector3(added)
workspace.Part.Velocity = toVector3(cross_ab)
