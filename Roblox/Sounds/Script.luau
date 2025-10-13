-- Sound:
local sound = Instance.new("Sound")
local soundId = "rbxassetid://123456789"

-- Properties:
    -- RollOffMaxDistance (10000): max distance to hear sound
    -- RollOffMinDistance (10): full volume within this distance
    -- RollOffMode ("InverseTapered"): how volume fades with distance
    -- Looped (false): repeat sound if true
    -- PlaybackLoudness (read-only): current loudness after effects/distance
    -- PlaybackRegionsEnabled (false): enables streaming regions for large audio
    -- PlaybackSpeed (1): speed of playback (1 = normal)
    -- Playing (false): whether sound is playing
    -- TimePosition (0): current play position (seconds)
    -- Volume (0.5): base volume (0 to 1)
sound.SoundId = soundId
sound.Volume = 0.5
sound.RollOffMinDistance = 10
sound.RollOffMaxDistance = 10000
sound.RollOffMode = Enum.RollOffMode.InverseTapered
sound.Looped = false

-- Sound methods:
    -- :Play() starts or resumes the sound
    -- :Pause() pauses sound, keeps position
    -- :Stop() stops sound, resets position
    -- :Resume() resumes from pause (same as :Play())
sound:Play()
sound:Pause()
sound:Stop()
sound:Resume()

-- Sound Effect Presets:
    -- ChorusSoundEffect: thickens sound with layered delay
    -- DistortionSoundEffect: adds gritty distortion
    -- PitchSoundEffect: changes pitch higher or lower
    -- ReverbSoundEffect: adds echo/reverb effect
    -- EchoSoundEffect: adds echo repeats
    -- EqualizerSoundEffect: adjusts bass/mid/treble frequencies

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- SoundGroups control groups of sounds for volume/effects
-- SoundService manages global audio behavior & 3D sound

-- Types of sounds:
    -- Global Sound: plays at same volume for all players, no spatial effect
    -- Local Sound: plays only for one player/client (e.g., UI sounds)
    -- Proximity Sound: 3D positional sound changes volume by distance