local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Frame.Position = UDim2.new(0.35, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "KEY SYSTEM"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

TextBox.Parent = Frame
TextBox.PlaceholderText = "Enter your key..."
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.8, 0, 0, 30)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)

VerifyBtn.Parent = Frame
VerifyBtn.Text = "Verify"
VerifyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
VerifyBtn.Size = UDim2.new(0.35, 0, 0, 30)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
VerifyBtn.TextColor3 = Color3.fromRGB(255,255,255)

GetKeyBtn.Parent = Frame
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Position = UDim2.new(0.55, 0, 0.55, 0)
GetKeyBtn.Size = UDim2.new(0.35, 0, 0, 30)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
GetKeyBtn.TextColor3 = Color3.fromRGB(255,255,255)

Status.Parent = Frame
Status.Text = ""
Status.Position = UDim2.new(0, 0, 0.8, 0)
Status.Size = UDim2.new(1, 0, 0, 30)
Status.BackgroundTransparency = 1
Status.TextColor3 = Color3.fromRGB(255,255,255)

-- CONFIG
local VERIFY_URL = "https://keysystem-6299.onrender.com/verify?key="
local GETKEY_URL = "https://lootdest.org/s?8jdjlp2t"

-- VERIFY
VerifyBtn.MouseButton1Click:Connect(function()
    local key = TextBox.Text

    if key == "" then
        Status.Text = "❌ Enter key first"
        return
    end

    Status.Text = "Checking..."

    local success, response = pcall(function()
        return game:HttpGet(VERIFY_URL .. key)
    end)

    if not success then
        Status.Text = "❌ Error connecting"
        return
    end

    local data = game:GetService("HttpService"):JSONDecode(response)

    if data.success then
        Status.Text = "✅ Key valid!"
        wait(1)
        ScreenGui:Destroy()

        -- 🚀 SCRIPT CHÍNH
        print("SCRIPT LOADED")
    else
        Status.Text = "❌ Invalid / Expired key"
    end
end)

-- GET KEY
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(GETKEY_URL)
    Status.Text = "📋 Link copied!"
end)
