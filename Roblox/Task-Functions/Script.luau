-- task.wait(seconds?): Pauses the current thread for the given time in seconds (fractional allowed).
    -- If no argument, waits roughly one frame (~1/60th second).
    -- More precise and reliable than the old wait().
-- task.delay(seconds, callback): Calls the callback function after the specified delay asynchronously.
    -- Does NOT pause the current thread.
    -- Returns a task object that can be cancelled.
-- task.cancel(taskId): Cancels a delayed task created by task.delay() before it runs.
-- task.isCancelled(taskId): Checks if a delayed task was cancelled.
-- task.defer(callback): Defers the callback to run after the current thread finishes (asynchronously).
-- task.spawn(callback): Starts running the callback asynchronously immediately (Similar to coroutine.wrap).
    
task.wait(2)                                                -- pauses for 2 seconds

local delayedTask = task.delay(3, function() ... end)
task.cancel(delayedTask)                                    -- cancels before 3 seconds pass
print(task.isCancelled(delayedTask))                        -- true if cancelled, false otherwise

task.defer(function() ... end)
task.spawn(function() ... end)
