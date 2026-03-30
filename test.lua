-- SHIBA GET KEY GUI

local linkvertiseLink = "https://link-target.net/4248703/NMAFeKXYONqb"
local lootlabsLink = "https://loot-link.com/s?i55LYZnQ"

-- 🔥 VERIFY URL
local verifyURL = "https://keysystem-6299.onrender.com/verify?key="

local keyFile = "ShibaKey.txt"

-- ✅ HWID (ĐÃ NÂNG CẤP)
local hwid = game:GetService("RbxAnalyticsService"):GetClientId() .. game.Players.LocalPlayer.UserId

-- 🔥 AUTO LOGIN (FIX KHÔNG XOÁ KEY NGAY + ANTI FAIL)
if isfile and isfile(keyFile) then
	local savedKey = readfile(keyFile)

	local success = false

	pcall(function()
		local response = game:HttpGet(verifyURL .. savedKey .. "&hwid=" .. hwid)

		if response and response:find("true") then
			success = true
		end
	end)

	if success then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/loot.lua"))()
		return
	else
		-- ❗ KHÔNG xoá key nữa → tránh hiện GUI lại
		warn("Verify failed, retry later")
	end
end

local TweenService = game:GetService("TweenService")

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://12221967"
clickSound.Volume = 1
clickSound.Parent = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,0,0,0)
frame.Position = UDim2.new(0.5,-170,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(90,100,255)
stroke.Thickness = 1
stroke.Transparency = 0.5

TweenService:Create(
	frame,
	TweenInfo.new(0.35, Enum.EasingStyle.Quad),
	{Size = UDim2.new(0,340,0,230)}
):Play()

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Shiba"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,25,0,25)
close.Position = UDim2.new(1,-30,0,8)
close.Text = "X"
close.BackgroundTransparency = 1
close.TextColor3 = Color3.new(1,1,1)

close.MouseButton1Click:Connect(function()
	clickSound:Play()
	gui:Destroy()
end)

local info = Instance.new("TextLabel")
info.Parent = frame
info.Position = UDim2.new(0,0,0.18,0)
info.Size = UDim2.new(1,0,0,25)
info.BackgroundTransparency = 1
info.Text = "Enter your key to begin."
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 14

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0.75,0,0,35)
box.Position = UDim2.new(0.12,0,0.33,0)

box.PlaceholderText = "Paste your key"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.GothamBold
box.TextSize = 16

box.ClearTextOnFocus = false
box.Text = ""

Instance.new("UICorner",box)

local paste = Instance.new("TextButton")
paste.Parent = frame
paste.Size = UDim2.new(0,30,0,30)
paste.Position = UDim2.new(0.88,0,0.33,2)
paste.Text = "📋"
paste.BackgroundTransparency = 1

paste.MouseButton1Click:Connect(function()

	clickSound:Play()

	if getclipboard then
		box.Text = getclipboard()
	end

end)

-- LINKVERTISE BUTTON
local linkv = Instance.new("TextButton")
linkv.Parent = frame
linkv.Size = UDim2.new(0.35,0,0,35)
linkv.Position = UDim2.new(0.1,0,0.55,0)
linkv.Text = "       Linkvertise"
linkv.BackgroundColor3 = Color3.fromRGB(40,40,45)
linkv.TextColor3 = Color3.new(1,1,1)
linkv.Font = Enum.Font.Gotham
linkv.TextSize = 14
linkv.TextXAlignment = Enum.TextXAlignment.Left

Instance.new("UICorner",linkv)

local lvicon = Instance.new("Frame")
lvicon.Parent = linkv
lvicon.Size = UDim2.new(0,10,0,10)
lvicon.Position = UDim2.new(0,10,0.5,-5)
lvicon.BackgroundColor3 = Color3.fromRGB(255,210,0)

Instance.new("UICorner",lvicon).CornerRadius = UDim.new(1,0)

linkv.MouseButton1Click:Connect(function()

	clickSound:Play()

	if setclipboard then
		setclipboard(linkvertiseLink)
	end

	game.StarterGui:SetCore("SendNotification",{
		Title = "Shiba",
		Text = "Linkvertise link copied - paste in browser",
		Duration = 4
	})

end)

-- LOOTLABS BUTTON
local loot = Instance.new("TextButton")
loot.Parent = frame
loot.Size = UDim2.new(0.35,0,0,35)
loot.Position = UDim2.new(0.55,0,0.55,0)
loot.Text = "       LootLabs"
loot.BackgroundColor3 = Color3.fromRGB(40,40,45)
loot.TextColor3 = Color3.new(1,1,1)
loot.Font = Enum.Font.Gotham
loot.TextSize = 14
loot.TextXAlignment = Enum.TextXAlignment.Left

Instance.new("UICorner",loot)

local llicon = Instance.new("Frame")
llicon.Parent = loot
llicon.Size = UDim2.new(0,10,0,10)
llicon.Position = UDim2.new(0,10,0.5,-5)
llicon.BackgroundColor3 = Color3.fromRGB(170,80,255)

Instance.new("UICorner",llicon).CornerRadius = UDim.new(1,0)

loot.MouseButton1Click:Connect(function()

	clickSound:Play()

	if setclipboard then
		setclipboard(lootlabsLink)
	end

	game.StarterGui:SetCore("SendNotification",{
		Title = "Shiba",
		Text = "LootLabs link copied - paste in browser",
		Duration = 4
	})

end)

local verify = Instance.new("TextButton")
verify.Parent = frame
verify.Size = UDim2.new(0.8,0,0,35)
verify.Position = UDim2.new(0.1,0,0.78,0)
verify.Text = "Verify Key"
verify.Font = Enum.Font.GothamBold
verify.TextSize = 15
verify.TextColor3 = Color3.new(1,1,1)
verify.BackgroundColor3 = Color3.fromRGB(70,90,255)

Instance.new("UICorner",verify)

verify.MouseButton1Click:Connect(function()

	clickSound:Play()

	local entered = box.Text

	local response = game:HttpGet(verifyURL .. entered .. "&hwid=" .. hwid)

	if response:find("true") then

		if writefile then
			writefile(keyFile, entered)
		end

		gui:Destroy()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/loot.lua"))()

	else

		game.StarterGui:SetCore("SendNotification",{
			Title = "Shiba",
			Text = "Invalid or Expired Key",
			Duration = 4
		})

	end

end)
