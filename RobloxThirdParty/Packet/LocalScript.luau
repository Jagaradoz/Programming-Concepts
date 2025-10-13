local Packet = require(path.to.Packet)

-- ===== Remote Events =====
local myRemote = Packet("MyRemote", Packet.NumberU8, Packet.String)             -- Create a Remote Event with data types
myRemote:Fire(123, "Hi Server!")                                                -- Fire to the server
myRemote.OnClientEvent:Connect(function(num, text)                              -- Listen for events from the server
    print("Server says:", num, text)
end)

-- ===== Remote Functions =====
local myFunction = Packet("MyFunction", Packet.NumberU8):Response(Packet.String)    -- Create a Remote Function expecting a response
myFunction.OnClientEvent:Connect(function(num)                                      -- Listen for the server calling this function
    print("Server requested:", num)
    return "Client Got: " .. tostring(num)
end)
local response = myFunction:Fire(999)                                               -- Fire a function request to the server and get the response
print("Response from server:", response)

-- ===== All Packet Types =====
local types = {
    "Any", "Nil",
    "NumberS8", "NumberS16", "NumberS24", "NumberS32",
    "NumberU8", "NumberU16", "NumberU24", "NumberU32",
    "NumberF16", "NumberF24", "NumberF32", "NumberF64",
    "String", "StringLong",
    "Buffer", "BufferLong",
    "Instance", "Boolean8", "NumberRange", "BrickColor",
    "Color3", "UDim", "UDim2", "Rect",
    "Vector2S16", "Vector2F24", "Vector2F32",
    "Vector3S16", "Vector3F24", "Vector3F32",
    "NumberU4", "BooleanNumber", "Boolean1",
    "CFrameF24U8", "CFrameF32U8", "CFrameF32U16",
    "Region3", "NumberSequence", "ColorSequence",
    "Characters", "EnumItem",
    "Static1", "Static2", "Static3",
}

-- Moduled by Suphi Kaner