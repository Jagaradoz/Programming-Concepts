-- 1. Function Definition:
function greet(name)
    print("Hello, " .. name)
end

-- 2. Return Values:
function add(a, b)
    return a + b
end

-- 3. Anonymous Functions:
local multiply = function(x, y)
    return x * y
end

-- 4. Multiple Return Values:
function swap(a, b)
    return b, a
end

-- 5. Variable Arguments:
function sumAll(...)
    local s = 0
    for _, v in ipairs{...} do
        s = s + v
    end
    return s
end

greet("Alice")                  -- Output: Hello, Alice
local sum = add(3, 5)           -- Output: sum = 8
print(multiply(2, 4))           -- Output: 8
local x, y = swap(1, 2)         -- Output: x=2, y=1
print(sumAll(1, 2, 3, 4))       -- Output: 10
