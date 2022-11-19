local form = require(script.Parent.Settings.Form)

script.Parent.ReadyButton.MouseButton1Click:Connect(function()
    script.Parent.Visible = false
    script.Parent.Parent.QUIZ.Visible = true
    local result = form:Start():Random()
end)