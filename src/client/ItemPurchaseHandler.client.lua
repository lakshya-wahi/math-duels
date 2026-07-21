local item = script.Parent
local btn = item.Button

local confirm = item.Parent.Parent.ConfirmBG
local invFrame = item.Parent.Parent.Parent.InventoryBG
local currentCredits = item.Parent.Parent.Parent.Credits

local updDataEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes").UpdData

local this = false

btn.MouseButton1Click:Connect(function()
	this = true
	item.Parent.Interactable = false
	
	confirm.ConfirmButton.Interactable = false
	confirm.CloseButton.Interactable = false
	confirm.Cost.Text = item.Cost.Value
	confirm:TweenSize(UDim2.new(0.6, 0, 0.6, 0))
	wait(1)
	confirm.CloseButton:TweenSize(UDim2.new(0.35, 0, 0.35, 0))
	confirm.ConfirmButton:TweenSize(UDim2.new(0.6, 0, 0.6, 0))
	
	confirm.ConfirmButton.Interactable = true
	confirm.CloseButton.Interactable = true
end)

confirm.CloseButton.MouseButton1Click:Connect(function()
	this = false
	
	confirm.ConfirmButton.Interactable = false
	confirm.CloseButton.Interactable = false
	
	confirm.CloseButton:TweenSize(UDim2.new(0, 0, 0, 0))
	confirm.ConfirmButton:TweenSize(UDim2.new(0, 0, 0, 0))
	wait(1)
	confirm:TweenSize(UDim2.new(0, 0, 0, 0))
	wait(1)
	confirm.Cost.Text = 0
	item.Parent.Interactable = true
end)

confirm.ConfirmButton.MouseButton1Click:Connect(function()
	confirm.ConfirmButton.Interactable = false
	if this then
		if currentCredits.Value >= item.Cost.Value then
			confirm.ConfirmButton.Interactable = false
			confirm.CloseButton.Interactable = false
			
			currentCredits.Value -= item.Cost.Value
			item.Button.Interactable = false
			item.Button.Image = "rbxassetid://92391409868014"
			item.Button.Text.Text = "OWNED"
			
			invFrame.AvatarScroll:FindFirstChild(item.Name).Visible = true
			
			local allAvatars = {}
			for i, v in pairs (invFrame.EmoteScroll:GetChildren()) do
				if v:IsA("ImageLabel") and v.Visible == true then
					table.insert(allAvatars, v.Name)
				end
			end
			updDataEvent:FireServer({avatars = allAvatars or {}})
			confirm.CloseButton:TweenSize(UDim2.new(0, 0, 0, 0))
			confirm.ConfirmButton:TweenSize(UDim2.new(0, 0, 0, 0))
			wait(1)
			confirm:TweenSize(UDim2.new(0, 0, 0, 0))
			wait(1)
			confirm.Cost.Text = 0
			item.Parent.Interactable = true
		else
			invFrame.Parent.ErrorBG.Error.Text = "NOT ENOUGH COINS!"
			invFrame.Parent.ErrorBG:TweenPosition(UDim2.new(0.5, 0, 0.9, 0))
			wait(1)
			invFrame.Parent.ErrorBG:TweenPosition(UDim2.new(0.5, 0, 1.9, 0))
			invFrame.Parent.ErrorBG.Error.Text = ""
			confirm.ConfirmButton.Interactable = true
			item.Parent.Interactable = true
		end
	end
end)
