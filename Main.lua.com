-- SCRIPT TROLL ADMIN PANEL V2 BY PHAT
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- 1. TẠO GIAO DIỆN MÀN HÌNH TRẮNG (LOADING)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminTrollGui"
ScreenGui.Parent = PlayerGui
ScreenGui.IgnoreGuiInset = true

local WhiteFrame = Instance.new("Frame")
WhiteFrame.Size = UDim2.new(1, 0, 1, 0)
WhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WhiteFrame.BorderSizePixel = 0
WhiteFrame.Parent = ScreenGui

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(0.8, 0, 0.2, 0)
LoadingText.Position = UDim2.new(0.1, 0, 0.4, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.TextColor3 = Color3.fromRGB(0, 0, 0)
LoadingText.TextScaled = true
LoadingText.Font = Enum.Font.SpecialElite
LoadingText.Text = "Đang loadstring..."
LoadingText.Parent = WhiteFrame

-- 2. TẠO BẢNG THÔNG BÁO ADMIN Ở GÓC PHẢI (SAU KHI LOAD XONG)
local AdminInfoFrame = Instance.new("Frame")
AdminInfoFrame.Size = UDim2.new(0.25, 0, 0.15, 0)
AdminInfoFrame.Position = UDim2.new(1, 5, 0.1, 0) -- Bắt đầu ở ngoài màn hình bên phải
AdminInfoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminInfoFrame.BackgroundTransparency = 0.3
AdminInfoFrame.BorderSizePixel = 0
AdminInfoFrame.Parent = ScreenGui

-- Bo góc cho bảng thông báo
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = AdminInfoFrame

local AdminRankText = Instance.new("TextLabel")
AdminRankText.Size = UDim2.new(1, -10, 0.5, 0)
AdminRankText.Position = UDim2.new(0, 5, 0, 0)
AdminRankText.BackgroundTransparency = 1
AdminRankText.TextColor3 = Color3.fromRGB(255, 215, 0) -- Màu vàng Gold cực VIP
AdminRankText.Text = 'You are currently ranked "Admin"'
AdminRankText.TextScaled = true
AdminRankText.Font = Enum.Font.SourceSansBold
AdminRankText.Parent = AdminInfoFrame

local AdminDoorText = Instance.new("TextLabel")
AdminDoorText.Size = UDim2.new(1, -10, 0.5, 0)
AdminDoorText.Position = UDim2.new(0, 5, 0.5, 0)
AdminDoorText.BackgroundTransparency = 1
AdminDoorText.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminDoorText.Text = "You have opened the admin panel doors."
AdminDoorText.TextScaled = true
AdminDoorText.Font = Enum.Font.SourceSansItalic
AdminDoorText.Parent = AdminInfoFrame

-- 3. XỬ LÝ HIỆU ỨNG
task.spawn(function()
    task.wait(2)
    LoadingText.Text = "Đang kiểm tra quyền Admin..."
    task.wait(3)
    LoadingText.Text = "Chúc mừng! Script Admin Panel đã load xong!!"
    LoadingText.TextColor3 = Color3.fromRGB(0, 170, 0)
    
    task.wait(5) -- Đợi đủ 10 giây
    
    -- Xóa màn hình trắng
    WhiteFrame:Destroy()
    
    -- Hiệu ứng bảng Admin trượt từ phải vào
    AdminInfoFrame:TweenPosition(UDim2.new(0.74, 0, 0.1, 0), "Out", "Back", 1)
    
    -- Cho bảng Admin hiện trong 15 giây rồi biến mất hoặc giữ nguyên tùy bạn
    task.wait(15)
    AdminInfoFrame:TweenPosition(UDim2.new(1, 5, 0.1, 0), "In", "Quad", 1)
    task.wait(1)
    ScreenGui:Destroy()
end)
