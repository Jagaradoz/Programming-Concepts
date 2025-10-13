local Lighting = game:GetService("Lighting")

-- Properties
    -- Ambient                        : base light color that affects all parts globally (even in shadows)
    -- Brightness                     : multiplier for sun/moon light intensity (0 = no light, default ~2)
    -- ColorShift_Bottom              : tints surfaces facing downward (can simulate environmental bounce)
    -- ColorShift_Top                 : tints surfaces facing upward (sky tint or sunlight color)
    -- EnvironmentDiffuseScale        : controls intensity of indirect light diffusion (0 = none, 1 = full)
    -- EnvironmentSpecularScale       : controls how strong surface reflections are
    -- GlobalShadows                  : enables/disables dynamic shadows cast by sun/moon
    -- OutdoorAmbient                 : ambient color for unlit outdoor areas (like shaded terrain)
    -- ShadowSoftness                 : softness of dynamic shadows (0 = sharp, 1 = very soft)
    -- Technology                     : rendering system (e.g. ShadowMap, Compatibility, Voxel)
    -- ClockTime                      : current time of day in float (e.g. 12 = noon, 18 = 6 PM)
    -- GeographicLatitude             : controls sun angle/seasons (use 41.733 for realistic Earth)
    -- TimeOfDay                      : formatted version of ClockTime (e.g. "12:00:00")
    -- Name / ClassName / Parent      : default Roblox object properties
    -- Archivable                     : determines whether the Lighting object can be saved in models/files
    -- ExposureCompensation           : adjusts camera exposure manually (-10 to 10); brightens/darkens entire scene
    -- FogColor                       : color of the fog effect
    -- FogStart                       : distance from the camera where fog begins (0 = starts immediately)
    -- FogEnd                         : distance where fog reaches full strength (higher = farther away)

-- Post-Processing Effects
    -- Atmosphere
        -- Density                        : how thick the air appears (higher = more fog/haze)
        -- Offset                         : vertical offset for where fog appears in world space
        -- Color                          : tint of the air/fog
        -- Decay                          : color fade based on distance (used for realistic sunsets)
        -- Glare                          : how intense sunlight glow appears through haze
        -- Haze                           : light diffusion and glow around bright areas
    -- SunRaysEffect
        -- Intensity                      : brightness of the rays coming from the sun
        -- Spread                         : width of the sun rays (0 = narrow, 1 = wide and diffused)
    -- ColorCorrectionEffect
        -- Brightness                     : adds/subtracts global brightness to the whole scene
        -- Contrast                       : adjusts contrast between light/dark areas
        -- Saturation                     : changes intensity of color (0 = grayscale, 1 = original, >1 = more vibrant)
        -- TintColor                      : applies a color overlay (e.g. blue tint for cold feel)
    -- BloomEffect
        -- Intensity                      : strength of the bloom glow effect around bright pixels
        -- Size                           : how far the bloom effect spreads
        -- Threshold                      : minimum brightness required to trigger bloom
    -- BlurEffect
        -- Size                           : strength of screen-wide blur (0 = no blur, higher = more blur)
    -- Sky
        -- CelestialBodiesShown           : whether the sun and moon are visible
        -- SunAngularSize                 : how large the sun appears (in degrees)
        -- MoonAngularSize                : same for moon
        -- StarCount                      : number of visible stars (only appears at night)
        -- SkyboxBk/Ft/Lf/Rt/Up/Dn        : texture asset IDs for the 6 skybox faces (Back, Front, Left, etc.)

-- Example (24 Hours cycle):

local dayLength = 300                       -- Real-time duration of full day-night cycle (in seconds)
local interval = 0.1                        -- Update rate in seconds

local hoursPerSecond = 24 / dayLength
local hoursPerTick = hoursPerSecond * interval

while task.wait(interval) do
    Lighting.ClockTime = (Lighting.ClockTime + hoursPerTick) % 24
end
