local textbox = script.Parent
textbox.InputBegan:Connect(function()
	if textbox.Text == "antikick" then
		local mt = getrawmetatable(game)

		local ncallsa = mt.__namecall
		setreadonly(mt, false)
		mt.__namecall = newcclosure(function(...)
			local args = {...}
			if not checkcaller() and getnamecallmethod() == "Kick" then
				return nil
			end
			return ncallsa(...)
		end)
		setreadonly(mt, true)

		print("works")

	end
end)