--  1. Character Movement                            : The client can move their own character, and the server (and others) will see it.
--  2. Physics Forces on Own Character               : BodyMovers or LinearVelocity applied locally to your character are replicated.
--  3. Animation on  Humanoid                        : Animations played locally on your character are seen by all.
--  4. Camera and Screen Effects                     : Only affect the client’s own view.
--  5. Humanoid State Transitions                    : State changes (jumping, swimming, etc.) controlled by the client are replicated.
--  6. Appearance Customization                      : Character clothing/accessory changes by the client replicate to others.
--  7. Sound Playback (own character)                : Sounds parented to your character may replicate; others are local only.
--  8. JumpPower / WalkSpeed                         : Can be changed by the client, but the server can override or reset them.

-- Character Movement
humanoid:Move(Vector3.new(0, 0, -1), false)

-- Physics Forces on Own Character
local rootPart = humanoid.Parent:FindFirstChild("HumanoidRootPart")
local bodyVelocity = Instance.new("BodyVelocity", rootPart)
bodyVelocity.Velocity = rootPart.CFrame.LookVector * 50
bodyVelocity.MaxForce = Vector3.new(10000, 0, 10000)

-- Animation on Humanoid
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://123456789"
local animTrack = humanoid:LoadAnimation(animation)
animTrack:Play()

-- Camera and Screen Effects
local camera = workspace.CurrentCamera
camera.FieldOfView = 120

-- Humanoid State Transitions
humanoid.Jump = true

-- Appearance Customization 
local shirt = Instance.new("Shirt", humanoid.Parent)
shirt.ShirtTemplate = "rbxassetid://144076760"

-- Sound Playback (own character)
local sound = Instance.new("Sound", rootPart)
sound.SoundId = "rbxassetid://6026984224"
sound:Play()

-- JumpPower / WalkSpeed    
humanoid.WalkSpeed = 100

-- What is NOT trusted (for contrast):
-- Game stats, damage, health, and inventory must be set by the server to be seen by others.