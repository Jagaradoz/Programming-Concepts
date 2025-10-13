--!strict -- Enables full type checking (not counted)

-- 1. Dynamically typed (no type annotation)
local var1 = "Hello"
local var2 = 123

-- 2. Statically typed
local staticString: string = "World"
local staticNumber: number = 456

-- 3. Type inference (Luau infers this is a number)
local inferred = 99

-- 4. Parameter type annotation and return type
function Greet(name: string): string
	return "Hello, " .. name
end

-- 5. Union types (value can be string or number)
local unionVar: string | number = "hello"
unionVar = 100

-- 6. Type refinement (using typeof check)
if typeof(unionVar) == "number" then
	local doubled = unionVar * 2
end

-- 7. Variadic types (variable number of number args)
function Sum(...: number): number
	local total = 0
	for _, n in {...} do
		total += n
	end
	return total
end

-- 8. Literal types (restrict values to specific strings)
type Direction = "Up" | "Down" | "Left" | "Right"
local move: Direction = "Left"

-- 9. Variable type annotation
local speed: number = 12.5

-- 10. Custom types (structured user-defined type)
type Player = {
	Name: string,
	Score: number,
	Alive: boolean
}
local player1: Player = {
	Name = "Alex",
	Score = 100,
	Alive = true
}

-- 11. Intersection types (combine fields from types)
type WithId = { Id: number }
type WithName = { Name: string }
type WithIdAndName = WithId & WithName
local thing: WithIdAndName = {
	Id = 1,
	Name = "PowerUp"
}

-- 12. Function type annotation (typedef for a function)
type MathFunc = (number, number) -> number
local add: MathFunc = function(a, b)
	return a + b
end

-- 13. Type casting (force type onto untyped value)
local raw = {} :: Player
raw.Name = "Jordan"
raw.Score = 80
raw.Alive = false

-- 14. Optional functionwee parameters (can be nil)
function Say(message: string?, fallback: string): string
	return message or fallback
end

-- 15. Generics (create reusable type-safe containers)
type Container<T> = {
	value: T
}
local numBox: Container<number> = { value = 123 }
local strBox: Container<string> = { value = "Hello" }
