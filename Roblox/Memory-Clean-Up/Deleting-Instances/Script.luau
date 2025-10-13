-- Remove()
-- Deprecated method to remove an instance from the game.
-- Does NOT properly clean up memory or connections.
-- Avoid using this in modern Roblox scripts.
instance:Remove()  

-- Destroy()
-- Proper method to remove an instance safely.
-- Cleans up all connections and memory.
instance:Destroy()

-- Debris Service (:AddItem)
-- Automatically destroys an instance after a given time.
game:GetService("Debris"):AddItem(instance, 5) 