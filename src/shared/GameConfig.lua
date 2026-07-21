local GameConfig = {
	PlayerDefaults = {
		credits = 350,
		xp = 0,
		lvl = 0,

		banner = "Basic",
		banners = {
			"Basic",
		},

		avatar = "Default",
		avatars = {
			"Default",
		},

		currEmotes = {},
		emotes = {},
	},

	Matchmaking = {
		PlayersPerMatch = 2,

		-- How long an item read from MemoryStore remains invisible.
		InvisibilityTimeout = 60,

		-- How long a queued player entry remains stored.
		QueueTTL = 60,

		-- Maximum wait time for a blocking queue read.
		ReadWaitTimeout = 10,

		-- How often a waiting player is placed back into the queue.
		SoftRequeueInterval = 10,

		-- Time before the player is sent to a bot match.
		HardBotDeadline = 25,

		-- Delay between matchmaking loop iterations.
		PollInterval = 1,

		-- Defined in the current matchmaking script, although it is not
		-- presently used by its reservation logic.
		MaxReserveAttempts = 3,

		DefaultMode = "Classic",

		SupportedModes = {
			Classic = true,
			Survival = true,
		},

		DefaultBanner = "Basic",
		DefaultAvatar = "Default",

		MaxEquippedEmotes = 3,
	},

	DataStore = {
		AutosaveInterval = 60,

		MaxSaveAttempts = 3,

		RetryBackoff = {
			InitialDelay = 1,
			MaximumDelay = 8,
			Multiplier = 2,
		},

		PreventNegativeCredits = true,
		PreventNegativeExperience = true,
	},

	TeleportRewards = {
		DefaultResult = "ok",

		AcceptOnlySameUniverse = true,

		PreventDuplicateApplication = true,

		MinimumCredits = 0,
		MinimumExperience = 0,
	},

	LoadingScreen = {
		ProgressSteps = 10,
		ProgressTweenDuration = 0.15,
		MaximumStepDelay = 1,

		BackgroundPanDuration = 8,
		MainFrameFadeDuration = 3,
		LogoRevealDuration = 3,

		BackgroundRightPosition = UDim2.new(0.52, 0, 0.5, 0),
		BackgroundLeftPosition = UDim2.new(0.48, 0, 0.5, 0),

		LogoFinalPosition = UDim2.new(0.5, 0, 0.3, 0),
	},

	UIAnimations = {
		ConfirmationOpenSize = UDim2.new(0.6, 0, 0.6, 0),
		ConfirmationClosedSize = UDim2.new(0, 0, 0, 0),

		ConfirmationButtonSize = UDim2.new(0.6, 0, 0.6, 0),
		ConfirmationCloseButtonSize = UDim2.new(0.35, 0, 0.35, 0),

		ErrorVisiblePosition = UDim2.new(0.5, 0, 0.9, 0),
		ErrorHiddenPosition = UDim2.new(0.5, 0, 1.9, 0),

		ConfirmationOpenDuration = 0.3,
		ConfirmationCloseDuration = 0.25,
	},

	Menu = {
		PlayButtonSize = UDim2.new(1, 0, 0.6, 0),
		ShopButtonSize = UDim2.new(0.5, 0, 0.3, 0),
		InventoryButtonSize = UDim2.new(0.5, 0, 0.3, 0),
		HelpButtonSize = UDim2.new(0.2, 0, 0.15, 0),
		GamepassButtonSize = UDim2.new(0.2, 0, 0.15, 0),

		ButtonRevealDuration = 0.4,

		LevelDisplayPosition = UDim2.new(0.075, 0, 0.1, 0),
	},
}

return table.freeze(GameConfig)
