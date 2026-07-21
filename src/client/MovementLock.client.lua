local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

pcall(function()
	player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
	player.DevTouchMovementMode    = Enum.DevTouchMovementMode.Scriptable
end)

task.defer(function()
	local pm = player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
	local PlayerModule = require(pm)
	local Controls = PlayerModule:GetControls()
	Controls:Disable()
end)

local function lockHumanoid(h)
	if not h then return end
	h.WalkSpeed = 0
	h.JumpPower = 0
	h.AutoRotate = false
	-- Disallow entering the Jumping state
	pcall(function()
		h:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
	end)
	-- Cancel any pending jump requests 
	if not UserInputService.JumpRequest._locked then
		UserInputService.JumpRequest._locked = true
		UserInputService.JumpRequest:Connect(function()
			if h then h.Jump = false end
		end)
	end
end

local function onCharacterAdded(char)
	local humanoid = char:WaitForChild("Humanoid")
	lockHumanoid(humanoid)
	-- If something tries to change WalkSpeed later, clamp it back to 0
	humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed ~= 0 then humanoid.WalkSpeed = 0 end
	end)
	-- Prevent external Jump toggles
	humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
		if humanoid.Jump then humanoid.Jump = false end
	end)
end

if player.Character then onCharacterAdded(player.Character) end
player.CharacterAdded:Connect(onCharacterAdded)


local BLOCKED = {
	[Enum.KeyCode.W] = true, [Enum.KeyCode.A] = true,
	[Enum.KeyCode.S] = true, [Enum.KeyCode.D] = true,
	[Enum.KeyCode.Space] = true,
}
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.UserInputType == Enum.UserInputType.Keyboard and BLOCKED[input.KeyCode] then

	end
end)
