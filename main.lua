local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "PHÁT HUB | DESTRUCTION 😈",
   LoadingTitle = "Đang chuẩn bị hủy diệt...",
   LoadingSubtitle = "by Phát",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Hủy Diệt", 4483345998)

local player = game.Players.LocalPlayer
local shirtId = ""
if player.Character and player.Character:FindFirstChildOfClass("Shirt") then
    shirtId = player.Character:FindFirstChildOfClass("Shirt").ShirtTemplate
end

Tab:CreateToggle({
   Name = "Skybox Áo Của Tôi 🌌",
   CurrentValue = false,
   Flag = "SkyToggle",
   Callback = function(Value)
      if Value then
         local sky = Instance.new("Sky", game.Lighting)
         sky.Name = "DestructionSky"
         sky.SkyboxBk = shirtId
         sky.SkyboxDn = shirtId
         sky.SkyboxFt = shirtId
         sky.SkyboxLf = shirtId
         sky.SkyboxRt = shirtId
         sky.SkyboxUp = shirtId
      else
         if game.Lighting:FindFirstChild("DestructionSky") then
            game.Lighting.DestructionSky:Destroy()
         end
      end
   end,
})

Tab:CreateToggle({
   Name = "Hủy Diệt Map (Dán Áo) 🔥",
   CurrentValue = false,
   Flag = "MapToggle",
   Callback = function(Value)
      _G.DestroyMap = Value
      while _G.DestroyMap do
         for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") then
               local decal = Instance.new("Decal", obj)
               decal.Texture = shirtId
               decal.Face = Enum.NormalId.Front
            end
         end
         wait(5)
      end
   end,
})

l.lua
