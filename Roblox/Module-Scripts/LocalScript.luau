local moduleScript = require(script.Parent.ModuleScript)    -- load module

print(moduleScript.myString)                                -- prints "Hello World!"
print(moduleScript.myNumber)                                -- prints 10

local result1 = moduleScript.firstFunction()                -- call normal function
local result2 = moduleScript:secondFunction()               -- call method (with self)