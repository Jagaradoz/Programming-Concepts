local CollectionService = game:GetService("CollectionService")
-- Methods:
    -- GetTagged(tag): returns table of instances with that tag
    -- GetTags(instance): returns table of tags assigned to instance
    -- GetAllTags(): returns all tags in the game
    -- AddTag(instance, tag): adds tag to instance
    -- RemoveTag(instance, tag): removes tag from instance
    -- HasTag(instance, tag): returns true if instance has the tag, else false
CollectionService:AddTag(part, "Enemy")                                 -- Add tag "Enemy" to part
CollectionService:HasTag(part, "Enemy")                                 -- Check if part has tag "Enemy" (true or false)
CollectionService:GetTagged("Enemy")                                    -- Get all instances tagged "Enemy"
CollectionService:GetTags(part)                                         -- Get all tags belonged to the instance
CollectionService:GetAllTags()                                          -- Get all existing tags in the entire game

-- Events:
    -- InstanceAdded: fired when an instance is tagged
    -- InstanceRemoved: fired when a tag is removed from an instance
CollectionService.InstanceAdded:Connect(function(instance) ... end)     -- Connect to tag added event
CollectionService.InstanceRemoved:Connect(function(instance) ... end)   -- Connect to tag removed event
