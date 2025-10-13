-- Class Definition

local Animal

Animal = {
	__index = nil, 

	Speak = function(self)
		print(self.name .. " says " .. self.sound)
	end,

	Rename = function(self, newName)
		self.name = newName
	end,

	new = function(name, sound)
		local self = setmetatable({}, Animal)
		self.name = name
		self.sound = sound
		return self
	end,
}

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Instance Usage

Animal.__index = Animal

local dog = Animal.new("Dog", "Woof")
local cat = Animal.new("Cat", "Meow")

dog:Speak()
cat:Speak()

dog:Rename("Puppy")
dog:Speak()
