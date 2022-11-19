local settings = {}


settings.ManualCheck = true -- If this is enabled, settings.Answers is not required.
settings.Questions = { -- Maximum Choices: 4
	['1']={Q='What will you do first?',A={'I will kick all','I will communicate with other people to get known more','I will protect everyone in the server','None of the above'}},
	['2']={Q='What will you do if you saw a exploiter?',A={'I will kick all','I will report it','I will try to ban the exploiter','do nothing'}},
}
settings.KickPlayerOnAnswer = true -- Kicks the player if it has answered
settings.DiscordInvite = 'discord.gg/xpzc7MJpvP' -- Tells the player where the results will be given.
settings.Answers = { -- You don't have to do this if the manual check is enabled.
	['1']='I will kick all',
	['2']='do nothing'
}

settings.Objects = {
	FORM = nil,
	FormBackground = nil,	-- Replace nil with Question Label 				(REQUIRED)
	AButton = nil,			-- Replace nil with First Choice Button 		(REQUIRED)
	BButton = nil,			-- Replace nil with Second Choice Button 		(REQUIRED)
	CButton = nil,			-- Replace nil with Third Choice Button 		(REQUIRED)
	DButton = nil,			-- Replace nil with Fourth Choice Button 		(REQUIRED)
	ALabel = nil,			-- Replace nil with First Choice Text Label 	(OPTIONAL)
	BLabel = nil,			-- Replace nil with Second Choice Text Label	(OPTIONAL)
	CLabel = nil,			-- Replace nil with Third Choice Text Label 	(OPTIONAL)
	DLabel = nil,			-- Replace nil with Fourth Choice Text Label	(OPTIONAL)
	Question = nil,			-- Replace nil with Question Label 				(REQUIRED)
	ContactAPI = nil		-- Replace nil with Server to Client Event		(REQUIRED)
}

return settings