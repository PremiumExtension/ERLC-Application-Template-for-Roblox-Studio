local webhookurl = 'https://discord.com/api/webhooks/1043120444217241640/TELZBbykOh5Ryv55HutciEsyPZga8XjmIFJTRdXHPxikr-YIwjM9IfX57bSnDnCu6HIm'
local settings = require(script.Parent)
local HttpService = game:GetService('HttpService')
Timer={}function Timer:new()
	local SPD = 0
	local PLAYING = false
	function self:Play()
		PLAYING = true
		spawn(function()
			while wait(0.1) do
				if PLAYING then
					SPD += 1
				end
			end
		end)
	end
	function self:Stop()
		PLAYING = false
		return SPD..'ms',SPD
	end
	return self
end
local API='testaccount87000.roblox/'..game.GameId
local Form = {}

function Form:Show(Question,Answers)
	local A,B,C,D = Answers[1],Answers[2],Answers[3],Answers[4]
	local call
	if settings.Objects.ALabel then
		settings.Objects.ALabel.Text = A
		settings.Objects.BLabel.Text = B
		settings.Objects.CLabel.Text = C
		settings.Objects.DLabel.Text = D
	else
		settings.Objects.AButton.Text = A
		settings.Objects.BButton.Text = B
		settings.Objects.CButton.Text = C
		settings.Objects.DButton.Text = D
	end
	settings.Objects.Question.Text = Question
	self.Clicked = {}
	function self.Clicked:Connect(callback)
		call = callback
	end
	local function back(chosen)
		call(chosen)
	end
	settings.Objects.AButton.MouseButton1Click:Connect(function()
		back(A)
	end)
	settings.Objects.BButton.MouseButton1Click:Connect(function()
		back(B)
	end)
	settings.Objects.CButton.MouseButton1Click:Connect(function()
		back(C)
	end)
	settings.Objects.DButton.MouseButton1Click:Connect(function()
		back(D)
	end)
	return self
end
function Form:Start()
	function self:Random()--Random Question
		local questions,questionsCreated,answerList = {},{},{}
		local prqu
		for quest, answe in pairs(settings.Questions) do
			table.insert(questions,answe.Q)
			answerList[answe.Q]=answe.A
		end
		local function CreateQuestion()
			prqu = questions[math.random(1,#questions)]
			if questionsCreated[prqu] then
				repeat wait()
					prqu = questions[math.random(1,#questions)]
				until not questionsCreated[prqu]
			else
				questionsCreated[prqu] = answerList[prqu]
			end
		end
		for quest = 1, #questions do
			local receiveAClick = false
			local Time = Timer:new()
			Time:Play()
			CreateQuestion()
			self:Show(prqu,answerList[prqu]).Clicked:Connect(function(chosen)
				if not receiveAClick then
					receiveAClick = true
					self:ServeAPI(prqu..'='..chosen..':'..Time:Stop())
				end
			end)
			repeat wait()
			until receiveAClick
		end
		return self:ResetAPI()
	end
	function self:Order()--Order Question depending on table
		for quest, answe in pairs(settings.Questions) do
			local receiveAClick = false
			local Time = Timer:new()
			Time:Play()
			self:Show(answe.Q,answe.A).Clicked:Connect(function(chosen)
				if not receiveAClick then
					receiveAClick = true
					self:ServeAPI(answe.Q..'='..chosen..':'..Time:Stop())
				end
			end)
			repeat wait()
			until receiveAClick
		end
		return self:ResetAPI()
	end
	return self
end
function Form:ServeAPI(app)
	warn(app)
	local player = game.Players.LocalPlayer
	if not player then
		error('The API is client side only!',2)
	else
		if API == 'testaccount87000.roblox/'..game.GameId then
			API = API..'/'..player.UserId
		end
		API = API..'/'..app
		warn('new request: ',API)
	end
end
function Form:ResetAPI()
	script.Parent.Parent.RequestAPI:Fire(API)
	task.wait(0.25)
	if settings.KickPlayerOnAnswer then
		game.Players.LocalPlayer:Kick('Your results will be announced at '..settings.DiscordInvite)
	end
	return API
end

return Form