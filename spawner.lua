-- Place this in a LocalScript inside StarterPlayerScripts or StarterGui

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowFruitSpawner"
gui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", frame)
title.Text = "Shadow Fruit Spawner"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(180, 100, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- TextBox
local textBox = Instance.new("TextBox", frame)
textBox.PlaceholderText = "Enter fruit name..."
textBox.Size = UDim2.new(0.8, 0, 0, 40)
textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
textBox.TextColor3 = Color3.fromRGB(200, 200, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextScaled = true
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)

-- Spawn Button
local button = Instance.new("TextButton", frame)
button.Text = "Spawn"
button.Size = UDim2.new(0.8, 0, 0, 40)
button.Position = UDim2.new(0.1, 0, 0.6, 0)
button.BackgroundColor3 = Color3.fromRGB(60, 30, 90)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBlack
button.TextScaled = true
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

-- Side Notification Frame
local notifFrame = Instance.new("Frame", gui)
notifFrame.Size = UDim2.new(0, 250, 0, 60)
notifFrame.Position = UDim2.new(1, -260, 0.2, 0)
notifFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
notifFrame.Visible = false
Instance.new("UICorner", notifFrame).CornerRadius = UDim.new(0, 12)

local notifLabel = Instance.new("TextLabel", notifFrame)
notifLabel.Size = UDim2.new(1, -10, 1, -10)
notifLabel.Position = UDim2.new(0, 5, 0, 5)
notifLabel.BackgroundTransparency = 1
notifLabel.TextColor3 = Color3.fromRGB(255, 180, 255)
notifLabel.Font = Enum.Font.GothamSemibold
notifLabel.TextScaled = true
notifLabel.TextWrapped = true

-- Button click logic
button.MouseButton1Click:Connect(function()
	local fruitName = textBox.Text
	if fruitName == "" then
		notifLabel.Text = "❌ Enter a fruit name!"
		notifFrame.Visible = true
		wait(2)
		notifFrame.Visible = false
		return
	end

	notifLabel.Text = "Spawning " .. fruitName .. "..."
	notifFrame.Visible = true
	wait(2)

	-- Start fake loading
	for i = 1, 100 do
		notifLabel.Text = "Spawning " .. fruitName .. "... " .. i .. "%"
		wait(120) -- 2 minutes per 1%
	end

	notifLabel.Text = "✅ " .. fruitName .. " has been spawned!"
	wait(5)
	notifFrame.Visible = false
end)
