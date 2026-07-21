local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local currentHumanoid = nil

local function lockHumanoid(humanoid)
	currentHumanoid = humanoid

	humanoid.WalkSpeed = 0
	humanoid.JumpPower = 0
	humanoid.AutoRotate = false
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)

	humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed ~= 0 then
			humanoid.WalkSpeed = 0
		end
	end)

	humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
		if humanoid.Jump then
			humanoid.Jump = false
		end
	end)
end

UserInputService.JumpRequest:Connect(function()
	if currentHumanoid then
		currentHumanoid.Jump = false
	end
end)

local function onCharacterAdded(character)
	lockHumanoid(character:WaitForChild("Humanoid"))
end

if player.Character then
	onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)
