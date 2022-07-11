local textbox = script.Parent
textbox.InputBegan:Connect(function()
	if textbox.Text == "billboardremover" then
		while true do
		local localp = game:GetService'Players'.LocalPlayer
		for i,v in next,game:GetService'Players'.LocalPlayer.Character:GetDescendants() do
			if v:IsA("BillboardGui") then
				v:Destroy()
			end
		end
		localp.CharacterAdded:Connect(function(character)
			localp = character
		end)

		task.spawn(function()
			while wait(1) do
				if localp:FindFirstChildWhichIsA("BillboardGui", true) then
					localp:FindFirstChildWhichIsA("BillboardGui", true):Destroy()
				end
			end
		end)

		print("works")
		wait(20)
		end
	end
end)