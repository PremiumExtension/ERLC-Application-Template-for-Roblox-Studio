local webhookurl = 'https://discord.com/api/webhooks/1043120444217241640/TELZBbykOh5Ryv55HutciEsyPZga8XjmIFJTRdXHPxikr-YIwjM9IfX57bSnDnCu6HIm'
local HttpService = game:GetService('HttpService')
local function request(player,API)
	
	local Embedded = {
		["content"] = "<@0>", -- Replace 0 with the role id of moderators; remove '["content"] = "<@0>",' if you don\'t want to be mentioned.'
		["embeds"] = {{
			["title"] = player.Name.."\'s Answer ("..player.UserId..")",
			["description"] = ""
		}}
	}
	for _,con in pairs(API:split('/')) do
		if con:find('=') then
			local QUESTION,ANSWER = con:split('=')[1],nil
			local TAB2 = con:split('=')[2]
			local TIME = TAB2:split(':')[2]
			if TAB2:split(':')[1] then
				ANSWER = TAB2:split(':')[1]
			end
			Embedded.embeds[1].description = Embedded.embeds[1].description..'\n**Q: '..QUESTION..'**\n> **A: **'..ANSWER..'\n> **Speed: **'..TIME..'\n'
		else
			continue
		end
	end
	local Processed = HttpService:JSONEncode(Embedded)
	HttpService:PostAsync(webhookurl, Processed)
end
game.ReplicatedStorage.ContactAPI.OnServerEvent:Connect(request)