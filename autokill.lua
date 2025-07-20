local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "CompactKillGUI"
ScreenGui.ResetOnSpawn = false

local main = Instance.new("Frame", ScreenGui)
main.Size = UDim2.new(0, 220, 0, 300)
main.Position = UDim2.new(0, 20, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "👤 Player List"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamSemibold
title.TextSize = 18

local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0, 5, 0, 35)
scroll.Size = UDim2.new(1, -10, 0, 180)
scroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.BorderSizePixel = 0

local playerListLayout = Instance.new("UIListLayout", scroll)
playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
playerListLayout.Padding = UDim.new(0, 4)

-- Kill Button
local killButton = Instance.new("TextButton", main)
killButton.Position = UDim2.new(0, 5, 0, 225)
killButton.Size = UDim2.new(1, -10, 0, 30)
killButton.Text = "🔪 Kill Selected"
killButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
killButton.TextColor3 = Color3.new(1,1,1)
killButton.Font = Enum.Font.GothamBold
killButton.TextSize = 16
killButton.Visible = false

-- Auto Kill Toggle
local autoButton = Instance.new("TextButton", main)
autoButton.Position = UDim2.new(0, 5, 0, 265)
autoButton.Size = UDim2.new(1, -10, 0, 30)
autoButton.Text = "⚙️ Auto Kill Nearest: OFF"
autoButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
autoButton.TextColor3 = Color3.new(1,1,1)
autoButton.Font = Enum.Font.GothamBold
autoButton.TextSize = 16

-- Variables
local selectedPlayer = nil
local killing = false
local autoKillEnabled = false
local spinning = false

-- Refresh player list
local function refreshPlayerList()
	for _, item in ipairs(scroll:GetChildren()) do
		if item:IsA("TextButton") then
			item:Destroy()
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, -10, 0, 25)
			btn.Text = player.Name
			btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.Parent = scroll

			btn.MouseButton1Click:Connect(function()
				selectedPlayer = player
				killButton.Visible = true
			end)
		end
	end
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
refreshPlayerList()

-- Kill function
local function startKilling(target)
	if killing then return end
	if not target or not target.Character or target.Character:FindFirstChild("ForceField") then return end

	killing = true
	spinning = true

	local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if not tool then killing = false spinning = false return end

	while killing
		and target.Character
		and target.Character:FindFirstChild("Humanoid")
		and target.Character.Humanoid.Health > 0
	do
		if target.Character:FindFirstChild("ForceField") then break end

		local myChar = LocalPlayer.Character
		local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
		local theirRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
		local currentTool = myChar and myChar:FindFirstChildOfClass("Tool")

		if not (myChar and myRoot and theirRoot and currentTool) then break end

		-- Teleport and attack
		myRoot.CFrame = theirRoot.CFrame * CFrame.new(0, 0, 1)
		pcall(function() currentTool:Activate() end)

		task.wait(0.1)
	end

	killing = false
	spinning = false
end

-- Get nearest valid player
local function getClosestPlayer()
	local minDist = math.huge
	local closest = nil
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

	if not myRoot then return nil end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer
			and player.Character
			and player.Character:FindFirstChild("HumanoidRootPart")
			and player.Character:FindFirstChild("Humanoid")
		then
			if not player.Character:FindFirstChild("ForceField")
				and player.Character.Humanoid.Health > 0
			then
				local dist = (myRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
				if dist < minDist then
					minDist = dist
					closest = player
				end
			end
		end
	end

	return closest
end

-- Kill selected
killButton.MouseButton1Click:Connect(function()
	if selectedPlayer then
		startKilling(selectedPlayer)
	end
end)

-- Auto toggle
autoButton.MouseButton1Click:Connect(function()
	autoKillEnabled = not autoKillEnabled
	autoButton.Text = "⚙️ Auto Kill Nearest: " .. (autoKillEnabled and "ON" or "OFF")
end)

-- Auto kill loop
RunService.RenderStepped:Connect(function()
	if autoKillEnabled and not killing then
		local target = getClosestPlayer()
		if target then
			startKilling(target)
		end
	end
end)

-- Spin Effect (while killing)
RunService.RenderStepped:Connect(function()
	if spinning then
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(45), 0)
		end
	end
end)local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "CompactKillGUI"
ScreenGui.ResetOnSpawn = false

local main = Instance.new("Frame", ScreenGui)
main.Size = UDim2.new(0, 220, 0, 300)
main.Position = UDim2.new(0, 20, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "👤 Player List"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamSemibold
title.TextSize = 18

local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0, 5, 0, 35)
scroll.Size = UDim2.new(1, -10, 0, 180)
scroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.BorderSizePixel = 0

local playerListLayout = Instance.new("UIListLayout", scroll)
playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
playerListLayout.Padding = UDim.new(0, 4)

-- Kill Button
local killButton = Instance.new("TextButton", main)
killButton.Position = UDim2.new(0, 5, 0, 225)
killButton.Size = UDim2.new(1, -10, 0, 30)
killButton.Text = "🔪 Kill Selected"
killButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
killButton.TextColor3 = Color3.new(1,1,1)
killButton.Font = Enum.Font.GothamBold
killButton.TextSize = 16
killButton.Visible = false

-- Auto Kill Toggle
local autoButton = Instance.new("TextButton", main)
autoButton.Position = UDim2.new(0, 5, 0, 265)
autoButton.Size = UDim2.new(1, -10, 0, 30)
autoButton.Text = "⚙️ Auto Kill Nearest: OFF"
autoButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
autoButton.TextColor3 = Color3.new(1,1,1)
autoButton.Font = Enum.Font.GothamBold
autoButton.TextSize = 16

-- Variables
local selectedPlayer = nil
local killing = false
local autoKillEnabled = false
local spinning = false

-- Refresh player list
local function refreshPlayerList()
	for _, item in ipairs(scroll:GetChildren()) do
		if item:IsA("TextButton") then
			item:Destroy()
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, -10, 0, 25)
			btn.Text = player.Name
			btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.Parent = scroll

			btn.MouseButton1Click:Connect(function()
				selectedPlayer = player
				killButton.Visible = true
			end)
		end
	end
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
refreshPlayerList()

-- Kill function
local function startKilling(target)
	if killing then return end
	if not target or not target.Character or target.Character:FindFirstChild("ForceField") then return end

	killing = true
	spinning = true

	local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if not tool then killing = false spinning = false return end

	while killing
		and target.Character
		and target.Character:FindFirstChild("Humanoid")
		and target.Character.Humanoid.Health > 0
	do
		if target.Character:FindFirstChild("ForceField") then break end

		local myChar = LocalPlayer.Character
		local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
		local theirRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
		local currentTool = myChar and myChar:FindFirstChildOfClass("Tool")

		if not (myChar and myRoot and theirRoot and currentTool) then break end

		-- Teleport and attack
		myRoot.CFrame = theirRoot.CFrame * CFrame.new(0, 0, 1)
		pcall(function() currentTool:Activate() end)

		task.wait(0.1)
	end

	killing = false
	spinning = false
end

-- Get nearest valid player
local function getClosestPlayer()
	local minDist = math.huge
	local closest = nil
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

	if not myRoot then return nil end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer
			and player.Character
			and player.Character:FindFirstChild("HumanoidRootPart")
			and player.Character:FindFirstChild("Humanoid")
		then
			if not player.Character:FindFirstChild("ForceField")
				and player.Character.Humanoid.Health > 0
			then
				local dist = (myRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
				if dist < minDist then
					minDist = dist
					closest = player
				end
			end
		end
	end

	return closest
end

-- Kill selected
killButton.MouseButton1Click:Connect(function()
	if selectedPlayer then
		startKilling(selectedPlayer)
	end
end)

-- Auto toggle
autoButton.MouseButton1Click:Connect(function()
	autoKillEnabled = not autoKillEnabled
	autoButton.Text = "⚙️ Auto Kill Nearest: " .. (autoKillEnabled and "ON" or "OFF")
end)

-- Auto kill loop
RunService.RenderStepped:Connect(function()
	if autoKillEnabled and not killing then
		local target = getClosestPlayer()
		if target then
			startKilling(target)
		end
	end
end)

-- Spin Effect (while killing)
RunService.RenderStepped:Connect(function()
	if spinning then
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(45), 0)
		end
	end
end)
