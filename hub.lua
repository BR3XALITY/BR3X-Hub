game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made By BR3XALITY";
    Text = "@boostedreality On YT";
    Icon = "rbxassetid://110743274616354"
})
wait(3.0)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZZZ/Kavo-UI-Library/main/Kavo.lua"))()

local Window = Library.CreateLib("BR3X Hub", "DarkTheme")

local Tab1 = Window:NewTab("Universal")

local Section1 = Tab1:NewSection("Scripts")
Section1:NewButton("Fly GUI V3", "Allows You To Fly", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/2f343c8bdfb2a6d254ba45cb191ab9e2/raw/073c9c09a874958264386abe50f5554a66fd849e/fly.lua'))()
end)
