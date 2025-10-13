-- States (Enum.HumanoidStateType)
    -- .Freefall                                                            : In air, falling
    -- .FallingDown                                                         : After hard landing or ragdoll
    -- .GettingUp                                                           : Standing up after falling
    -- .Jumping                                                             : When jump triggered
    -- .Landed                                                              : After landing from fall
    -- .Running                                                             : Moving on ground
    -- .RunningNoPhysics                                                    : Running, but not touching floor
    -- .Climbing                                                            : While climbing
    -- .Seated                                                              : Sitting (e.g. in vehicle seat)
    -- .Swimming                                                            : In water
    -- .Dead                                                                : Health <= 0
    -- .Physics                                                             : Generic physics-controlled state
    -- .StrafingNoPhysics                                                   : Strafing animations (R15)
local state = humanoid:GetState()              
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

-- Properties:
    -- Health (number)                                                      : Current health, 0 = dead
    -- MaxHealth (number)                                                   : Maximum health possible
    -- WalkSpeed (number)                                                   : Horizontal movement speed (default 16)
    -- RunSpeed (number)                                                    : (R15 only) Running speed
    -- JumpPower (number)                                                   : Jump force (default 50; only used if UseJumpPower)
    -- JumpHeight (number)                                                  : How high the humanoid jumps
    -- UseJumpPower (bool)                                                  : True to use JumpPower, false to use JumpHeight
    -- AutoRotate (bool)                                                    : Auto-rotates towards MoveDirection if true
    -- MoveDirection (Vector3)                                              : Current input-based movement direction (unit vector)
    -- Jump (bool)                                                          : Set true to trigger jump
    -- PlatformStand (bool)                                                 : Disables controls/physics, ragdolls the character
    -- Sit (bool)                                                           : True if seated
    -- SeatPart (BasePart)                                                  : Seat part if seated, else nil
    -- HipHeight (number)                                                   : Offset from ground to hip, affects collision
    -- StepHeight (number)                                                  : Max height the character can step up
    -- RootPart (BasePart)                                                  : Main body part (HumanoidRootPart)
    -- RigType (enum)                                                       : R6 or R15
    -- BodyTypeScale/Width/Depth/HeightScale/HeadScale (numbers)            : Appearance scaling (R15)
    -- Animator (Animator)                                                  : Controls animation tracks
    -- WalkToPoint (Vector3)                                                : Where the humanoid is walking to (via MoveTo)
    -- NameDisplayDistance (number)                                         : Distance at which name is visible
    -- NameOcclusion (enum)                                                 : Name tag occlusion mode
    -- DisplayDistanceType (enum)                                           : Controls how name display distance is calculated
    -- DisplayName (string)                                                 : Displayed name
    -- ClimbSpeed (number)                                                  : Speed while climbing
    -- CameraOffset (Vector3)                                               : Camera offset from head
    -- HealthDisplayDistance (number)                                       : Distance at which health bar is shown
    -- HealthDisplayType (enum)                                             : When to show health bar
    -- FloorMaterial (Enum.Material)                                        : Material under feet (or Air if in air)
humanoid.Health = 0                         
humanoid.WalkSpeed = 24                     
humanoid.Jump = true                       
if humanoid.FloorMaterial == Enum.Material.Air then
    print("Character is airborne")
end
humanoid.Sit = true                       

-- Events:
    -- .HealthChanged(newHealth)                                            : Fires whenever health changes
    -- .Died()                                                              : Fires on death
    -- .Running(speed)                                                      : Fires when movement speed changes
    -- .Jumping(isActive)                                                   : Fires when jumping starts/stops
    -- .FreeFalling(isActive)                                               : Fires when freefalling starts/stops
    -- .FallingDown()                                                       : Fires when entering FallingDown state
    -- .GettingUp()                                                         : Fires when standing up after fall
    -- .Climbing(speed)                                                     : Fires when climbing speed changes
    -- .Swimming(speed)                                                     : Fires when swimming
    -- .StateChanged(oldState, newState)                                    : Fires when state changes
    -- .Seated(isSeated, seatPart)                                          : Fires when seated/standing
    -- .PlatformStanding(isActive)                                          : Fires when entering/leaving PlatformStand
    -- .MoveToFinished(reached)                                             : Fires when MoveTo target reached/stopped
    -- .MoveToBlocked()                                                     : Fires if path blocked during MoveTo
humanoid.Died:Connect(function()
    print("Character died")
end)
humanoid.HealthChanged:Connect(function(health)
    print("Health is now:", health)
end)
humanoid.Running:Connect(function(speed)
    if speed > 0 then print("Moving at", speed) end
end)
humanoid.Seated:Connect(function(isSeated, seat)
    print("Seated:", isSeated, seat)
end)
humanoid.StateChanged:Connect(function(old, new)
    print("Changed state from", old, "to", new)
end)

-- Methods:
    -- :Move(direction: Vector3, relativeToCamera: bool)                    : Moves humanoid in a direction (unit vector)
    -- :MoveTo(position: Vector3, part: BasePart?)                          : Walks humanoid to position or part
    -- :TakeDamage(amount: number)                                          : Reduces health by amount, triggers .Died if <= 0
    -- :ChangeState(state: Enum.HumanoidStateType)                          : Forces state change
    -- :GetState()                                                          : Gets current state (returns Enum.HumanoidStateType)
    -- :GetStateEnabled(state)                                              : Returns if state is enabled
    -- :SetStateEnabled(state, enabled)                                     : Enables/disables state
    -- :LoadAnimation(animation: Animation)                                 : Loads animation, returns AnimationTrack
    -- :ApplyDescription(desc: HumanoidDescription)                         : Changes appearance to match description
    -- :GetAppliedDescription()                                             : Gets current HumanoidDescription
    -- :AddAccessory(accessory: Accessory)                                  : Adds accessory to character
    -- :RemoveAccessories()                                                 : Removes all accessories
    -- :GetAccessories()                                                    : Returns array of current accessories
    -- :BuildRigFromAttachments()                                           : Rebuilds rig (advanced/R15)
    -- :Sit()                                                               : Forces humanoid to sit
humanoid:Move(Vector3.new(1, 0, 0), true)             
humanoid:TakeDamage(10)                               
humanoid:Sit()                                        
humanoid:MoveTo(Vector3.new(0,0,0))                   
local animTrack = humanoid:LoadAnimation(anim)        
local desc = humanoid:GetAppliedDescription()         
humanoid:ApplyDescription(desc)                       
