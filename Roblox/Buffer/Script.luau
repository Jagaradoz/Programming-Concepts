-- Basic Api
local buf = buffer.create(capacity: number)                 -- Creates a new buffer with byte capacity (fixed size)

-- Writing Bytes
buf:writeU8(offset, value)                                  -- Write unsigned 8-bit integer at byte offset
buf:writeI8(offset, value)                                  -- Write signed 8-bit integer
buf:writeU16(offset, value)                                 -- Write unsigned 16-bit integer (little-endian)
buf:writeI16(offset, value)                                 -- Write signed 16-bit integer
buf:writeU32(offset, value)                                 -- Write unsigned 32-bit integer
buf:writeI32(offset, value)                                 -- Write signed 32-bit integer
buf:writeF32(offset, value)                                 -- Write 32-bit float
buf:writeF64(offset, value)                                 -- Write 64-bit float (double)
buf:writeBytes(offset, readBuffer, readOffset, count)       -- Copy 'count' bytes from another buffer

-- Reading Bytes
value = buf:readU8(offset)                                  -- Read unsigned 8-bit integer at offset
value = buf:readI8(offset)                                  -- Read signed 8-bit integer
value = buf:readU16(offset)                                 -- Read unsigned 16-bit integer
value = buf:readI16(offset)                                 -- Read signed 16-bit integer
value = buf:readU32(offset)                                 -- Read unsigned 32-bit integer
value = buf:readI32(offset)                                 -- Read signed 32-bit integer
value = buf:readF32(offset)                                 -- Read 32-bit float
value = buf:readF64(offset)                                 -- Read 64-bit float
buf:readBytes(offset, writeBuffer, writeOffset, count)      -- Copy 'count' bytes into another buffer

-- Buffer Properties & Utility
buf.size()                                                  -- Returns the byte capacity of the buffer
buf:toString()                                              -- Converts buffer contents to a string (raw bytes, for transmission/storage)
buf:fill(value, startOffset, count)                         -- Sets 'count' bytes from startOffset to 'value' (default 0 = zero out)

-- Buffer Slices (Views/Sub-Buffers)
local slice = buf:slice(startOffset, length)                -- Returns a new buffer that views (shares memory with) a portion of the original buffer

-- Buffer Comparison
bufferLib.equals(bufA, bufB)                                -- Returns true if both buffers have identical contents and length

-- Example
local bufferLib = require(buffer)
local buf = bufferLib.create(16)                            -- 16 bytes
buf:writeU16(1, 12345)                                      -- Write number at first two bytes
print(buf:readU16(1))                                       -- 12345

local view = buf:slice(1, 4)                                -- A sub-buffer (first 4 bytes)
print(view:toString())

-- Copying Between Buffers
local src = bufferLib.create(8)
local dst = bufferLib.create(8)
src:writeU32(1, 42)
dst:writeBytes(1, src, 1, 4)
print(dst:readU32(1))                                       -- 42

-- Buffer Equality
local a = bufferLib.create(4)
local b = bufferLib.create(4)
a:writeU8(1, 1)
b:writeU8(1, 1)
print(bufferLib.equals(a, b))                               -- true

-- Patterns & Use Cases
    -- Pack multiple values in a single buffer for custom networking, file IO, or compressed storage
    -- Serialize/deserialize game state efficiently
    -- Store pixel/image/raw binary data for plugins or custom systems
    -- Implement binary protocols

-- Notes
    -- Buffer indices start at 1 (not 0!)
    -- Buffers are fixed in size after creation
    -- All read/write is little-endian
    -- Use :fill(0) to zero out (reset) a buffer
    -- :slice() shares memory; modifying the slice modifies the original buffer
    -- :toString() and equals() are useful for comparison/transmission