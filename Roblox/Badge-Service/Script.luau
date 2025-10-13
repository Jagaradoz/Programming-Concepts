local BadgeService = game:GetService("BadgeService")

local badgeId = 98765

-- Methods:
    -- 1. :AwardBadgeAsync(playerUserId, badgeId): Awards a badge to a player by their UserId (async)
    -- 2. :UserHasBadgeAsync(playerUserId, badgeId): Checks if a player owns a badge (returns true/false)
    -- 3. :GetBadgeInfoAsync(badgeId): Get the badge information (returns {...})
BadgeService:AwardBadgeAsync(12345678, badgeId)
BadgeService:UserHasBadgeAsync(12345678, badgeId)
BadgeService:GetBadgeInfoAsync(badgeId)