local Players            = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")

local player       = Players.LocalPlayer
local Remotes      = ReplicatedStorage:WaitForChild("Remotes")
local updDataEvent = Remotes:WaitForChild("UpdData") 

local shopRoot    = script.Parent                           -- the parent containing items + ConfirmBG
local itemsHolder = shopRoot:WaitForChild("GamepassScroll")          -- container of item frames
local confirm     = shopRoot:WaitForChild("ConfirmBG")
local confirmBtn  = confirm:WaitForChild("ConfirmButton")
local closeBtn    = confirm:WaitForChild("CloseButton")
local costLabel   = confirm:WaitForChild("Cost")

-- State
local selectedProductId = nil
local selectedReward = 0
local busy = false


local function openConfirm(productId, displayText, rewardAmount)
	if busy then return end
	busy = true
	selectedProductId = productId
	selectedReward    = rewardAmount or 0

	costLabel.Text = tostring(displayText)
	confirm.Visible = true
	confirm.Interactable = true
	confirm:TweenSize(UDim2.new(0.6, 0, 0.6, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
	confirmBtn.Interactable = true
	closeBtn.Interactable = true
end

local function closeConfirm()
	confirmBtn.Interactable = false
	closeBtn.Interactable = false
	confirm:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.25, true)
	task.delay(0.26, function()
		confirm.Visible = false
		confirm.Interactable = false
		selectedProductId = nil
		selectedReward    = 0
		busy = false
	end)
end

for _, item in ipairs(itemsHolder:GetChildren()) do
	if item:IsA("ImageLabel") then
		local btn    = item:FindFirstChild("Button", true)
		local idVal  = item:FindFirstChild("ID")            
		local costVl = item:FindFirstChild("Cost")         
		local prodVl = item:FindFirstChild("Product")     
		
		print(btn.Text.Text)
		if btn and idVal and idVal:IsA("IntValue") then
			btn.MouseButton1Click:Connect(function()
				print("boom")
				openConfirm(idVal.Value, prodVl.Value, costVl.Value)
			end)
		end
	end
end

-- Close
closeBtn.MouseButton1Click:Connect(function()
	if not busy then return end
	closeConfirm()
end)

-- Confirm
confirmBtn.MouseButton1Click:Connect(function()
	if not busy or not selectedProductId then return end
	MarketplaceService:PromptProductPurchase(player, selectedProductId)
end)

-- Purchase finished 
MarketplaceService.PromptProductPurchaseFinished:Connect(function(plr, purchasedProductId, wasPurchased)
	if purchasedProductId ~= selectedProductId then return end

	if wasPurchased and selectedReward > 0 then
		shopRoot.Parent.Credits.Value += selectedReward
	end

	closeConfirm()
end)

