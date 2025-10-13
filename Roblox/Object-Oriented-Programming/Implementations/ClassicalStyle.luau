-- Class Definition

local Animal = {}
Animal.__index = Animal 

function Animal.new(name, sound)
	local self = setmetatable({}, Animal) 
	self.name = name
	self.sound = sound
	return self
end

function Animal:Speak()
	print(self.name .. " says " .. self.sound)
end

function Animal:Rename(newName)
	self.name = newName
end

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Instance Usage

local dog = Animal.new("Dog", "Woof")
local cat = Animal.new("Cat", "Meow")

dog:Speak()         
cat:Speak()        

dog:Rename("Puppy")
dog:Speak()        
