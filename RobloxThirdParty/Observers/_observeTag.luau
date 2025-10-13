-- observeTag: Observe All Instances With a CollectionService Tag
local stopObserver = observeTag(
    tag: string,
    callback: (instance: Instance) -> (() -> ())?,
    ancestors: {Instance}?
)
    -- Observes all instances with a given tag (uses CollectionService:GetInstanceAdded/RemovedSignal)
    -- Runs callback(instance) when a tagged instance appears; expects optional cleanup function as return
    -- If the tag is removed, instance destroyed, or moves outside allowed ancestors (if given), cleanup is run
    -- Returns stop function; call stopObserver() to disconnect and clean up all instances

-- Example: Only observe tagged parts in Workspace
local stop = observeTag("Goal", function(part)
    print("Start observing", part)
    return function()
        print("Stopped observing", part)
    end
end, {workspace})
task.wait(10)
stop()

-- Notes:
    -- ancestors (optional): restricts to instances descended from these objects (e.g., workspace only)
    -- Cleans up robustly if instance is destroyed, untagged, or leaves ancestor scope
    -- Callback can error; errors are warned and do not break observer
    -- Always call stop() when you no longer need to observe

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
