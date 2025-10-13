local MessagingService = game:GetService("MessagingService")

-- topic: string (max 80 chars)
-- message: any serializable data (string, table, number, etc.)
-- It can only has up to 5 active subscriptions per server.

local topic = "GlobalAnnouncements"

-- PUBLISH: Send a message to a topic
MessagingService:PublishAsync(topic, {
	Text = "Hello from another server!",
	Sender = "Server_1",
	Time = os.time(),
})

-- SUBSCRIBE: Listen for messages on a topic
MessagingService:SubscribeAsync(topic, function(message)
	print(" Received message from topic:", topic)
	print("Data:", message.Data)
end)

-- LIMITS & NOTES
-- Rate limit: ~150 messages per minute per topic per server
-- Message size limit: 1 KB max
-- Not reliable for real-time systems (use DataStores for persistence)
-- Messages may be delayed or lost — always use safely with pcall()
