local Promise = require(game.ReplicatedStorage.Promise)

-- 1. Creating Promises
	-- resolve	: Call this function to fulfill (resolve) the promise with a result value.
	-- reject	: Call this function to reject the promise with an error message or value.
	-- onCancel	: Call this function to set up what happens if the promise is cancelled.
local function asyncOperation(success)
	return Promise.new(function(resolve, reject, onCancel)
		onCancel(function()
			print("Cancelled!")
		end)
		
		if success then
			resolve("Operation Succeeded!")
		else
			reject("Something went wrong.")
		end
	end)
end

-- 2. Consuming Promises
	-- :andThen        : Runs if the promise is resolved. Receives the resolved value(s).
	-- :catch          : Runs if the promise is rejected or a prior chain step fails. Receives the rejection reason.
	-- :finally        : Runs regardless of resolve/reject (always executes at the end).
	-- :andThenCall    : Like andThen, but calls a function directly with the resolved value (shortcut for :andThen(function(x) return f(x) end)).
	-- :tap            : Runs if resolved, for side effects, does NOT modify the value (good for logging or debugging).
	-- :timeout        : Rejects the promise if it is not settled within the given number of seconds.
	-- :now            : Runs a function immediately if the promise is already settled, returns the promise.
	-- :awaitStatus    : Waits for the promise to settle and returns the status ("Resolved"/"Rejected") and value/error.
	-- :await          : [Yields] Waits for the promise to settle and returns its value (or error, if rejected).
	-- :done           : Like andThen/catch, but will rethrow errors that are not caught (used for debugging).
	-- :cancel         : Cancels the promise if it is still pending, triggering any onCancel handlers in its executor.
	-- :catchOnCancel  : Runs if the promise was cancelled (specific catch for cancellation only).
	-- :finallyCall    : Like finally, but calls a function directly (shortcut for :finally(function() f() end)).
	-- :andThenReturn  : Shortcut to return a specific value if resolved (no need for full function).
	-- :catchReturn    : Shortcut to return a specific value if rejected.
	-- :catchError     : Runs on rejection, only if the error matches a certain type/class (pattern matching).
asyncOperation(true)
	:andThen(function(result)
		print("Resolved:", result)
		return "Chained value"
	end)
	:andThenCall(print) 
	:tap(function(value)
		print("Tap saw:", value)
	end)
	:timeout(2)
	:catch(function(err)
		warn("Caught after timeout or error:", err)
	end)
	:finally(function()
		print("This always runs (finally)")
	end)

-- 3. Static helpers
	-- .resolve        			: Instantly creates a resolved promise with the given value.
	-- .reject         			: Instantly creates a rejected promise with the given error value.
	-- .delay          			: Creates a promise that resolves after a set amount of time (in seconds).
	-- .retry          			: Retries a function returning a promise multiple times until it resolves, or gives up after N attempts.
	-- .all            			: Returns a promise that resolves when all given promises have resolved; returns their results as an array.
	-- .any            			: Returns a promise that resolves as soon as any of the given promises resolves.
	-- .race           			: Returns a promise that settles (resolves or rejects) as soon as any given promise settles.
	-- .allSettled     			: Returns a promise that resolves when all given promises settle (resolve or reject); provides the outcome of each.
	-- .some           			: Resolves when a specified number of promises resolve, rejects if too many fail.
	-- .first          			: Returns the result of the first promise to resolve (ignores rejections).
	-- .isPromise      			: Returns true if the value is a promise, false otherwise.
	-- .promisify      			: Converts a synchronous function into one that returns a promise.
	-- .fromEvent      			: Creates a promise that resolves on the next occurrence of a Roblox event.
	-- .defer          			: Creates a promise resolved on the next Heartbeat (useful for deferring work).
	-- .try            			: Runs a function and wraps the result in a promise, capturing thrown errors as rejections.
	-- .onUnhandledRejection 	: Sets a global callback for all unhandled rejections (good for logging/debugging).
	-- .extend         			: Mixes additional methods into the Promise prototype (advanced usage).
	-- .cast           			: Converts a value to a promise (resolves immediately if not already a promise).
Promise.resolve(123):andThen(print)
Promise.reject("Oops"):catch(warn)

Promise.delay(2):andThen(function()
	print("Waited 2 seconds")
end)

Promise.retry(function(attempt)
	if attempt < 3 then
		return Promise.reject("Failed, retrying...")
	end
	return Promise.resolve("Success on attempt " .. attempt)
end, 5):andThen(print)

Promise.all(promises):andThen(function(results)
	print("All finished!", table.concat(results, ", "))
end)

Promise.any(promises):andThen(function(result)
	print("First successful:", result)
end)

Promise.race(promises):andThen(function(result)
	print("First settled (resolved):", result)
end)

Promise.allSettled(promises):andThen(function(settled)
	for i, result in ipairs(settled) do
		print(i, result.status, result.value)
	end
end)

-- 4. Cancellation
	-- :cancel		: Cancels the promise if it's still pending, triggering any onCancel handlers.
local promise = asyncOperation(true)
local cancelToken = promise:cancel()
promise:catch(function(err)
	print("Cancelled promise caught:", err)
end)

-- The Module: https://create.roblox.com/store/asset/11373035067/Promise-Library-for-Luau-v400
