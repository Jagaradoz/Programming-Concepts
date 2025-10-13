-- coroutine.create() makes coroutine object (new thread).
-- coroutine.resume() runs or continues coroutine.
-- coroutine.yield() pauses coroutine, optionally returning values.
-- coroutine.status() checks coroutine state.
-- coroutine.wrap() creates a function to handle resume internally.
-- coroutine.close() stops coroutine permanently.

-- 1. coroutine.create(func)
local co = coroutine.create(function() ... end)

-- 2. coroutine.resume(co, ...)
coroutine.resume(co)
-- Starts or resumes execution of coroutine 'co', passing optional arguments.
-- Returns true plus any values yielded or returned by coroutine.

-- 3. coroutine.status(co)
print(coroutine.status(co))
-- Returns the status of coroutine as a string:
-- "running", "suspended", "normal", or "dead"

-- 4. coroutine.yield(...)
coroutine.yield(...)
-- Must be only in coroutine function.
-- Suspends the coroutine, optionally passing values back to the caller.
-- The coroutine can later be resumed.
-- Crucial Tip: task.wait() is coroutine.yield(...) with the given time

-- 5. coroutine.wrap(func)
local wrapped = coroutine.wrap(function() ... end)
-- Similar to coroutine.create but returns a function that, when called,
-- resumes the coroutine and returns values directly or throws errors.

-- 6. coroutine.close(co)
coroutine.close(co)
-- Closes a coroutine, stopping it permanently.
-- The coroutine cannot be resumed after closing.
-- Useful to clean up or forcibly terminate a coroutine.

