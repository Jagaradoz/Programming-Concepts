local model = Instance.new("Model")
local root = Instance.new("Part")

-- Properties:
-- model.PrimaryPart                    : BasePart | nil: reference part for movement/CFrame ops
-- model.WorldPivot                     : CFrame: computed pivot, model-space or primary part
-- model.LevelOfDetail                  : Enum.ModelLevelOfDetail: LOD for streaming/visualization
-- model.Scale                          : number (readonly): hierarchical scale factor (since 2023)
root.Name = "Root"
root.Parent = model
model.PrimaryPart = root
model:PivotTo(CFrame.new(0, 10, 0) * CFrame.Angles(0, math.pi/4, 0))

-- Methods:
-- :GetExtentsSize()                    : Vector3: tight-fit bounding box size
-- :GetBoundingBox()                    : (CFrame, Vector3): bounding box center, size
-- :GetPivot()                          : CFrame: model's pivot (PrimaryPart or WorldPivot)
-- :PivotTo(cframe)                     : nil: move/rotate model to new pivot (best practice)
-- :SetPrimaryPartCFrame(cf)            : nil: LEGACY, use :PivotTo()
-- :MoveTo(pos: Vector3)                : boolean: move so primary part at pos (AABB center if none)
-- :TranslateBy(delta: Vec)             : nil: shift model in space
-- :ScaleTo(newScale)                   : nil: set model's scale (affects all descendants)
-- :GetScale()                          : number: retrieve current scale
-- :MakeJoints()                        : auto-create joints in descendants
-- :BreakJoints()                       : break all joints in descendants
local bboxCF, bboxSize = model:GetBoundingBox()
local currentScale = model:GetScale()
local extents = model:GetExtentsSize()
model:PivotTo(bboxCF)
model:ScaleTo(currentScale * 2)
model:TranslateBy(Vector3.new(0, extents.Y / 2, 0))

-- Multiplayer/streaming persistence:
-- :AddPersistentPlayer(player)         : Always keeps this Model streamed in for the specified player, regardless of distance or streaming.
-- :GetPersistentPlayers()              : Returns a list of players for whom this Model is always streamed in.
-- :RemovePersistentPlayer(player)      : Stops forcing this Model to be streamed in for the specified player.
model:AddPersistentPlayer(player)      
print(model:GetPersistentPlayers()[1]) 
model:RemovePersistentPlayer(player)   

-- Notes:
    -- Use PrimaryPart for consistent model pivot/rotation.
    -- :PivotTo() and :GetPivot() are preferred for all new code (support scale, streaming, pivots).
    -- Model supports custom attributes for gameplay data.
    -- Events inherited; listen for .Changed/.AttributeChanged for runtime reactions.
    -- .Scale/.ScaleTo() are best for whole-model scaling (parts, meshes, attachments).
