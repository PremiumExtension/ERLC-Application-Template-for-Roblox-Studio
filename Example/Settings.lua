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
	FORM = script.Parent,
	FormBackground = script.Parent.Questions,	-- Replace nil with Question Label 				(REQUIRED)
	AButton = script.Parent.Questions.A,			-- Replace nil with First Choice Button 		(REQUIRED)
	BButton = script.Parent.Questions.B,			-- Replace nil with Second Choice Button 		(REQUIRED)
	CButton = script.Parent.Questions.C,			-- Replace nil with Third Choice Button 		(REQUIRED)
	DButton = script.Parent.Questions.D,			-- Replace nil with Fourth Choice Button 		(REQUIRED)
	ALabel = script.Parent.Questions.A.TextLabel,			-- Replace nil with First Choice Text Label 	(OPTIONAL)
	BLabel = script.Parent.Questions.B.TextLabel,			-- Replace nil with Second Choice Text Label	(OPTIONAL)
	CLabel = script.Parent.Questions.C.TextLabel,			-- Replace nil with Third Choice Text Label 	(OPTIONAL)
	DLabel = script.Parent.Questions.D.TextLabel,			-- Replace nil with Fourth Choice Text Label	(OPTIONAL)
	Question = script.Parent.Questions.Question,			-- Replace nil with Question Label 				(REQUIRED)
	ContactAPI = game.ReplicatedStorage.ContactAPI		-- Replace nil with Server to Client Event		(REQUIRED)
}

return settings