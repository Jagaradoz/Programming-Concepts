-- CFrame Creation
local cfA = CFrame.new(10, 5, -3)                                       -- (x, y, z) position, no rotation
local cfB = CFrame.new(Vector3.new(1, 2, 3))                            -- Vector3 position, no rotation
local cfC = CFrame.new(1,2,3, 1,0,0, 0,1,0, 0,0,1)                      -- Full 12-parameter matrix: (pos, rotation matrix 3x3)
local cfD = CFrame.Angles(math.rad(45), math.rad(0), math.rad(0))       -- Rotation-only, radians (x,y,z)
local cfE = CFrame.fromAxisAngle(Vector3.new(0,1,0), math.pi/2)         -- Rotates by angle around axis
local cfF = CFrame.fromMatrix(                                          -- Sets position + orientation using custom axes
    Vector3.new(0,0,0),          -- Position
    Vector3.new(1,0,0),          -- X (Right)
    Vector3.new(0,1,0),          -- Y (Up)
    Vector3.new(0,0,1)           -- Z (Back)
)
local cfG = CFrame.lookAt(Vector3.new(0,5,0), Vector3.new(10,5,10))     -- Creates a CFrame at (0,5,0) looking at (10,5,10)
local cfH = CFrame.lookAlong(Vector3.new(0,0,-1))                       -- Creates a CFrame facing along the -Z direction

local cfIdentity = CFrame.identity                                      -- Constant for no translation/rotation

-------------------------------------------------------------------------------------------------------------------------------------------

-- Properties
local pos = cfA.Position                                                -- Vector3: translation part
local orient = {cfA:GetComponents()}                                    -- 12 floats: position (x,y,z) and rotation matrix (R00..R22)
local rightVec = cfA.RightVector                                        -- (1,0,0) unit vector for right direction
local upVec = cfA.UpVector                                              -- (0,1,0) unit vector for up direction
local lookVec = cfA.LookVector                                          -- (0,0,-1) unit vector for forward direction

-------------------------------------------------------------------------------------------------------------------------------------------

-- Methods
local cfI = cfA:Inverse()                                               -- Returns inverse CFrame (undoes cfA)
local cfJ = cfA:Lerp(cfB, 0.5)                                          -- Interpolates (blends) between cfA and cfB
local cfK = cfA:ToWorldSpace(CFrame.new(1,2,3))                         -- Local -> World transform (like parenting)
local cfL = cfA:ToObjectSpace(cfK)                                      -- World -> Local transform (relative to cfA)
local cfM = cfA:Orthonormalize()                                        -- Fixes skew in rotation axes (returns closest valid rotation)
local cfN = cfA:PointToWorldSpace(Vector3.new(1,0,0))                   -- Transforms a point from object to world
local cfO = cfA:PointToObjectSpace(Vector3.new(1,0,0))                  -- World point to object space
local cfP = cfA:VectorToWorldSpace(Vector3.new(0,1,0))                  -- Transforms direction vector (ignores translation)
local cfQ = cfA:VectorToObjectSpace(Vector3.new(0,1,0))                 -- World direction to object local space

-------------------------------------------------------------------------------------------------------------------------------------------

-- Operators
local cfR = cfA * cfB                                                   -- Composition: transforms cfB by cfA (applies cfA then cfB)
local cfS = cfA + Vector3.new(0,1,0)                                    -- Shifts position by vector (rarely used)
local eq = (cfA == cfA)                                                 -- Returns true if both CFrames are numerically identical

-------------------------------------------------------------------------------------------------------------------------------------------

-- Conversions
local arr = {cfA:GetComponents()}                                       -- CFrame to 12 numbers (x,y,z, R00..R22)
local cfT = CFrame.new(table.unpack(arr))                               -- 12 numbers to CFrame

-------------------------------------------------------------------------------------------------------------------------------------------

-- Special and Edge cases
local angle, axis = cfA:ToAxisAngle()                                   -- Decompose rotation into axis, angle
local x,y,z, R00,R01,R02,R10,R11,R12,R20,R21,R22 = cfA:GetComponents()  -- All 12 components

-------------------------------------------------------------------------------------------------------------------------------------------

-- Notes
    -- CFrame stores both position and orientation (rotation).
    -- Use CFrame.new() for position, CFrame.Angles() or lookAt/lookAlong for rotation.
    -- * and :ToWorldSpace/:ToObjectSpace are essential for relative movement and parenting logic.
    -- RightVector, UpVector, LookVector give orientation axes.
    -- Use :GetComponents() for serialization/replication.
    -- :Orthonormalize() is needed if your CFrame may have accumulated floating-point error.
    -- CFrames are immutable (methods return new CFrames).
