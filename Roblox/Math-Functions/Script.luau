local x = -3.7
local y = 2
local angleDeg = 45
local angleRad = math.rad(angleDeg)

-- Constants
math.pi                                     -- The constant π ≈ 3.14159
math.huge                                   -- Represents positive infinity
-math.huge                                  -- Negative infinity

-- Basic Math Functions
math.abs(x)                                 -- Absolute value of x → 3.7
math.sign(x)                                -- -1 if x<0, 0 if x==0, 1 if x>0 → -1
math.floor(x)                               -- Largest integer ≤ x → -4
math.ceil(x)                                -- Smallest integer ≥ x → -3
math.round(x)                               -- Nearest integer → -4
math.clamp(x, -2, 2)                        -- Constrain x between min and max → -2
math.min(1, 5, -10)                         -- Smallest of values → -10
math.max(1, 5, -10)                         -- Largest of values → 5
math.fmod(7, 3)                             -- Remainder like 7 % 3 → 1
math.modf(3.75)                             -- Returns integer part and fractional part → 3, 0.75

-- Trigonometric Functions (radians)
math.sin(angleRad)                          -- Sine of angle → 0.707...
math.cos(angleRad)                          -- Cosine of angle → 0.707...
math.tan(angleRad)                          -- Tangent (sin/cos) → 1
math.asin(math.sin(angleRad))               -- Inverse sine → ~0.785 rad
math.acos(math.cos(angleRad))               -- Inverse cosine → ~0.785 rad
math.atan(math.tan(angleRad))               -- Inverse tangent → ~0.785 rad
math.atan2(1, 1)                            -- Full-angle version of atan → 0.785 rad (45°)

-- Angle Conversion
math.rad(180)                               -- Degrees → radians (180° = π) → 3.14159
math.deg(math.pi)                           -- Radians → degrees (π = 180°) → 180

-- Hyperbolic Functions
math.sinh(1)                                -- Hyperbolic sine of x
math.cosh(1)                                -- Hyperbolic cosine of x
math.tanh(1)                                -- Hyperbolic tangent of x

-- Exponential & Logarithmic
math.exp(2)                                 -- e^2 → ~7.389
math.log(8, 2)                              -- Log base 2 of 8 → 3
math.log10(1000)                            -- Base-10 logarithm → 3
math.pow(2, 5)                              -- 2^5 → 32
math.sqrt(16)                               -- Square root of 16 → 4

-- Bit/Float Helpers
math.frexp(10)                              -- Returns m, e such that x = m * 2^e
math.ldexp(0.625, 4)                        -- Reconstructs 10 from m and e

-- Interpolation & Mappings
math.lerp(0, 10, 0.5)                       -- Linear interpolate between a and b by t → 5
math.map(5, 0, 10, 0, 100)                  -- Remap 5 from range 0–10 to 0–100 → 50

-- Noise & Random
math.noise(1, 2, 3)                         -- Perlin noise in 3D space → smooth pseudo-random
math.randomseed(os.time())                  -- Seeds RNG using current time
math.random(1, 100)                         -- Random integer between 1 and 100
