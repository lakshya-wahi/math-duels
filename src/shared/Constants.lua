local Constants = {
	DataStores = {
		PlayerData = "PlayerData",
		PlayerKeyPrefix = "user_",
	},

	Remotes = {
		Folder = "Remotes",

		Matchmaking = "Matchmaking",
		GetData = "GetData",
		UpdateData = "UpdData",
		TeleportRewards = "TP",
	},

	Places = {
		PvP = 119889798448967,
		Bot = 121468471958121,
	},

	Matchmaking = {
		MessagingTopic = "mm_teleport_v1",

		QueueNames = {
			Classic = "MatchmakingQueue_Classic",
			Survival = "MatchmakingQueue_Survival",
		},

		Modes = {
			Classic = "Classic",
			Survival = "Survival",
		},
	},

	PlayerDataFields = {
		Credits = "credits",
		Experience = "xp",
		Level = "lvl",

		EquippedBanner = "banner",
		OwnedBanners = "banners",

		EquippedAvatar = "avatar",
		OwnedAvatars = "avatars",

		EquippedEmotes = "currEmotes",
		OwnedEmotes = "emotes",
	},

	DefaultCosmetics = {
		Banner = "Basic",
		Avatar = "Default",
	},

	UI = {
		PurchaseButtonImage = "rbxassetid://72507673176959",
		OwnedButtonImage = "rbxassetid://92391409868014",

		PurchaseText = "PURCHASE",
		OwnedText = "OWNED",
		InsufficientCreditsText = "NOT ENOUGH COINS!",
	},

	Sounds = {
		LogoReveal = "rbxassetid://9044783668",
		MenuReveal = "rbxassetid://80281677741848",
	},

	DeveloperProducts = {
		Credits1000 = {
			ProductId = 3371198282,
			Credits = 1000,
			Robux = 20,
			DisplayName = "1,000 Credits",
			Image = "rbxassetid://106551789319155",
		},

		Credits2500 = {
			ProductId = 3371199421,
			Credits = 2500,
			Robux = 45,
			DisplayName = "2,500 Credits",
			Image = "rbxassetid://90658389812552",
		},

		Credits5000 = {
			ProductId = 3371201719,
			Credits = 5000,
			Robux = 85,
			DisplayName = "5,000 Credits",
			Image = "rbxassetid://92925863539740",
		},

		Credits10000 = {
			ProductId = 3371204446,
			Credits = 10000,
			Robux = 165,
			DisplayName = "10,000 Credits",
			Image = "rbxassetid://74843863699462",
		},

		Credits25000 = {
			ProductId = 3371208814,
			Credits = 25000,
			Robux = 400,
			DisplayName = "25,000 Credits",
			Image = "rbxassetid://97649500473101",
		},

		Credits50000 = {
			ProductId = 3371210941,
			Credits = 50000,
			Robux = 750,
			DisplayName = "50,000 Credits",
			Image = "rbxassetid://100925512213920",
		},

		Credits100000 = {
			ProductId = 3371214443,
			Credits = 100000,
			Robux = 1450,
			DisplayName = "100,000 Credits",
			Image = "rbxassetid://135914062942496",
		},
	},
}

return table.freeze(Constants)
