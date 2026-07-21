local Constants = {
	DataStores = {
		PlayerData = "PlayerData",
	},

	Matchmaking = {
		PlayersPerMatch = 2,
		QueueName = "MatchmakingQueue",
	},

	DefaultPlayerData = {
		Coins = 0,
		EquippedAvatar = "Default",
		EquippedBanner = "Basic",
		EquippedEmote = "Emote1",
	},

	Remotes = {
		JoinQueue = "JoinQueue",
		LeaveQueue = "LeaveQueue",
		UpdateQueue = "UpdateQueue",
	},

	Teleport = {
		MatchPlaceId = 0, -- replace with the actual destination PlaceId
	},
}

return table.freeze(Constants)
