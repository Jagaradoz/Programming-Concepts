-- LinearVelocity (replaces BodyVelocity)
    -- .Velocity                                                : Target velocity vector (in world or relative space)
    -- .RelativeTo                                              : World, Attachment0, or Attachment1
    -- .Attachment0                                             : Reference attachment used when RelativeTo is not World
    -- .MaxForce                                                : Max linear force that can be applied (Vector3, per-axis)
    -- .Enabled                                                 : Enables or disables the force
-- AngularVelocity (replaces BodyAngularVelocity)
    -- .AngularVelocity                                         : Target angular velocity (radians/sec around X, Y, Z)
    -- .RelativeTo                                              : World, Attachment0, or Attachment1
    -- .Attachment0                                             : Reference attachment
    -- .MaxTorque                                               : Max torque applied (Vector3)
    -- .Enabled                                                 : Whether it’s active
-- AlignPosition (replaces BodyPosition)
    -- .Position                                                : Target world position
    -- .Attachment0                                             : Object being moved
    -- .Attachment1                                             : Optional target attachment (follows its position)
    -- .RigidityEnabled                                         : If true, force is constant; otherwise springs back smoothly
    -- .Responsiveness                                          : How fast it responds (higher = snappier)
    -- .MaxForce                                                : Limit on force applied
-- AlignOrientation (replaces BodyGyro)
    -- .CFrame                                                  : Target rotation (if not using Attachment1)
    -- .Attachment0                                             : Object being rotated
    -- .Attachment1                                             : Optional target attachment (follows its orientation)
    -- .RigidityEnabled                                         : True = locks to rotation immediately
    -- .Responsiveness                                          : Controls how quickly it aligns
    -- .MaxTorque                                               : Maximum torque applied to rotate
-- VectorForce
    -- .Force                                                   : Force applied constantly (world or relative to attachment)
    -- .RelativeTo                                              : World, Attachment0, or Attachment1
    -- .Attachment0                                             : Where force is applied
-- Torque
    -- .Torque                                                  : Constant torque applied (Vector3)
    -- .RelativeTo                                              : Frame of reference
    -- .Attachment0                                             : Base for torque application
-- AssemblyLinearVelocity / AssemblyAngularVelocity (read-only)
    -- .AssemblyLinearVelocity                                  : Actual linear velocity of the full assembly (Vector3)
    -- .AssemblyAngularVelocity                                 : Actual angular velocity (Vector3)
-- AssemblyMass
    -- .AssemblyMass                                            : Total mass of the object and all its connected parts (kg)
-- CustomPhysicalProperties
    -- .CustomPhysicalProperties                                : Sets density, friction, elasticity, etc.
    -- Fields include:
        -- Density                                              : How heavy the material is
        -- Friction                                             : Resistance to sliding
        -- Elasticity                                           : Bounciness
        -- FrictionWeight / ElasticityWeight                    : Blending factor with connected surfaces
-- Constraints
    -- HingeConstraint                                          : Allows rotation around one axis (like a door hinge)
    -- BallSocketConstraint                                     : Allows full rotation around all axes (like a shoulder joint)
    -- SpringConstraint                                         : Applies a spring-like force between two attachments
    -- PrismaticConstraint                                      : Restricts movement to a single linear axis (like a drawer)
    -- CylindricalConstraint                                    : Allows rotation + sliding along one axis (like a piston rod)
    -- RodConstraint                                            : Rigid connector between two attachments with fixed length (like a beam)
    -- PlaneConstraint                                          : Constrains movement to a plane defined by Attachment0
    -- LineForce                                                : Constant force toward or away from another attachment (like gravity or tether)
    -- TorsionSpringConstraint                                  : Applies torque around a rotational axis with spring behavior
    -- AngularVelocityConstraint                                : Maintains constant angular velocity around a chosen axis
    -- VectorForce (used as constraint)                         : Applies force in a constant direction or toward a reference frame
    -- Torque (used as constraint)                              : Applies constant torque (can simulate motors or propellers)

-- Usage Examples:

-- Make a part float upward
local part = workspace:WaitForChild("Part")
local attachment = Instance.new("Attachment", part)

local linear = Instance.new("LinearVelocity")
linear.Attachment0 = attachment
linear.Velocity = Vector3.new(0, 50, 0)
linear.MaxForce = Vector3.new(1e5, 1e5, 1e5)
linear.RelativeTo = Enum.ActuatorRelativeTo.World
linear.Parent = part

-- Make a part spin
local part = workspace:WaitForChild("Part")
local attachment = Instance.new("Attachment", part)

local angular = Instance.new("AngularVelocity")
angular.Attachment0 = attachment
angular.AngularVelocity = Vector3.new(0, math.rad(180), 0) -- 180° per second
angular.MaxTorque = Vector3.new(0, 1e5, 0)
angular.RelativeTo = Enum.ActuatorRelativeTo.World
angular.Parent = part
