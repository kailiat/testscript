-- SHIBA GET KEY GUI (FINAL FIXED)

local linkvertiseLink = "https://link-center.net/4248703/7sIsVJuQAVLG"
local lootlabsLink = "https://lootdest.org/s?zY7I2x6A"

local verifyURL = "https://keysystem-6299.onrender.com/verify?key="

local keyFile = "ShibaKey.txt"

-- AUTO LOGIN
if isfile and isfile(keyFile) then
	local savedKey = readfile(keyFile)

	local response = game:HttpGet(verifyURL .. savedKey)

	if response:find("true") then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/loot.lua"))()
		return
	else
		if delfile then
			delfile(keyFile)
		end
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

TweenService:Create(frame,TweenInfo.new(0.35),{Size = UDim2.new(0,340,0,230)}):Play()

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.75,0,0,35)
box.Position = UDim2.new(0.12,0,0.33,0)
box.PlaceholderText = "Paste your key"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)
box.Text = ""

Instance.new("UICorner",box)

local verify = Instance.new("TextButton", frame)
verify.Size = UDim2.new(0.8,0,0,35)
verify.Position = UDim2.new(0.1,0,0.78,0)
verify.Text = "Verify Key"
verify.BackgroundColor3 = Color3.fromRGB(70,90,255)

Instance.new("UICorner",verify)

verify.MouseButton1Click:Connect(function()

	clickSound:Play()

	local entered = box.Text
	local response = game:HttpGet(verifyURL .. entered)

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
