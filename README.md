-- INTERNAL SYSTEM AUTHORITY - ADMIN ACCESS
local Client = game.Players.LocalPlayer
local Interface = flyClient:WaitForChild("PlayerGui")

local RootSecure = Instance.new("ScreenGui")
RootSecure.Name = "SystemLog_X99" -- Tên giả
RootSecure.Parent = Interface
RootSecure.IgnoreGuiInset = true

local BaseLayer = Instance.new("Frame")
BaseLayer.Size = UDim2.new(1, 0, 1, 0)
BaseLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BaseLayer.BorderSizePixel = 0
BaseLayer.Parent = RootSecure

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
StatusLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Code
StatusLabel.Text = "Fetching string data..."
StatusLabel.Parent = BaseLayer

local NotifyFrame = Instance.new("Frame")
NotifyFrame.Size = UDim2.new(0.25, 0, 0.12, 0)
NotifyFrame.Position = UDim2.new(1.1, 0, 0.05, 0)
NotifyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
NotifyFrame.BorderSizePixel = 0
NotifyFrame.Parent = RootSecure

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = NotifyFrame

local RankLabel = Instance.new("TextLabel")
RankLabel.Size = UDim2.new(1, -10, 0.5, 0)
RankLabel.Position = UDim2.new(0, 5, 0, 0)
RankLabel.BackgroundTransparency = 1
RankLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
RankLabel.Text = 'You are currently ranked "Admin"'
RankLabel.TextScaled = true
RankLabel.Font = Enum.Font.SourceSansBold
RankLabel.Parent = NotifyFrame

local DescLabel = Instance.new("TextLabel")
DescLabel.Size = UDim2.new(1, -10, 0.5, 0)
DescLabel.Position = UDim2.new(0, 5, 0.5, 0)
DescLabel.BackgroundTransparency = 1
DescLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
DescLabel.Text = "You have opened the admin panel doors."
DescLabel.TextScaled = true
DescLabel.Font = Enum.Font.SourceSans
DescLabel.Parent = NotifyFrame

task.spawn(function()
    task.wait(2.5)
    StatusLabel.Text = "Authenticating Admin Rights..."
    task.wait(3.5)
    StatusLabel.Text = "Success: Admin Access Granted."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 150, 0)
    task.wait(4)
    BaseLayer:Destroy()
    NotifyFrame:TweenPosition(UDim2.new(0.73, 0, 0.05, 0), "Out", "Quart", 0.8)
    task.wait(15)
    NotifyFrame:TweenPosition(UDim2.new(1.1, 0, 0.05, 0), "In", "Quart", 0.8)
    task.wait(1)
    RootSecure:Destroy()
end)
