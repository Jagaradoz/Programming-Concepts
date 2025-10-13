-- Methods
    -- .new(policy):                        -- Create a scheduler ("FIFO" or "LIFO", default FIFO)
    -- :BindCallback(fn):                   -- Bind the function that handles tasks (required before adding)
    -- :UnbindCallback():                   -- Unbinds the handler, clears queue, stops scheduler
    -- :AddTask(...):                       -- Add tasks to the queue
    -- :DoneHandlingTask():                 -- Must be called by your handler when done with a task
    -- :AddPredicate(id, fn):               -- Filter out tasks before handling; return false to remove
    -- :RemovePredicate(id):                -- Remove predicate by id
    -- :ChangePolicy(policy):               -- Switch between FIFO and LIFO at any time
    -- :GetNumberOfTasks():                 -- Returns number of pending tasks
    -- :ConnectToQueueEmptySignal(fn):      -- Fires when queue becomes empty
    -- :Destroy():                          -- Cleanup scheduler

local Scheduler = require(ReplicatedStorage.Scheduler)

local queue = Scheduler.new("FIFO")                                         -- "LIFO" or "FIFO" (default is "FIFO")

-- Bind a handler for queued tasks
queue:BindCallback(function(task)
    print("Handling task:", task)
    -- Simulate async work, then signal done:
    task.wait(1)
    queue:DoneHandlingTask() -- <== IMPORTANT! Notifies ready for next task
end)

-- Optional: add a filter (predicate) to skip tasks that aren't numbers
queue:AddPredicate("NumbersOnly", function(task)
    return typeof(task) == "number"
end)

-- Listen for queue empty event
queue:ConnectToQueueEmptySignal(function()
    print("All tasks finished!")
end)

-- Add tasks (can be anything: number, string, table, function, etc.)
queue:AddTask(1)
queue:AddTask("not a number") -- will be skipped due to predicate
queue:AddTask(2, 3, 4) -- can add multiple at once

-- Change the policy (switch to LIFO/stack mode)
queue:ChangePolicy("LIFO")

-- Remove the predicate if desired
queue:RemovePredicate("NumbersOnly")

-- Get number of tasks currently in queue
print("Tasks in queue:", queue:GetNumberOfTasks())

-- Cleanup when done
queue:Destroy()

-- The Module: https://create.roblox.com/store/asset/17080824419/Scheduler