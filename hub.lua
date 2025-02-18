game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made By BR3XALITY",
    Text = "@boostedreality On YT",
    Icon = "rbxassetid://110743274616354"
})
wait(3.0)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZZZ/Kavo-UI-Library/main/Kavo.lua"))()

local Window = Library.CreateLib("BR3X Hub", "DarkTheme")

local Tab1 = Window:NewTab("Scripts")

local Section1 = Tab1:NewSection("Universal")

Section1:NewButton("Fly GUI V3", "Allows You To Fly", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/2f343c8bdfb2a6d254ba45cb191ab9e2/raw/073c9c09a874958264386abe50f5554a66fd849e/fly.lua'))()
end)

Section1:NewButton("Noclip", "Toggleable Noclipping", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/2f343c8bdfb2a6d254ba45cb191ab9e2/raw/073c9c09a874958264386abe50f5554a66fd849e/noclip.lua'))()
end)

Section1:NewButton("Subplace Finder", "Allows You To Access Secret Subplaces In Games", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/c2faac9cf981bab2859421f5e310f788/raw/abbcfdc96b90f69ed2ad304edcf371bc4d037c64/subspace.lua'))()
end)

Section1:NewButton("Chat Bypass", "Bypasses Chat, Language Must Be Set To Қазақ Тілі", function()
    loadstring(game:HttpGet('https://pastefy.app/9hWD0emH/raw'))()
end)

local Section2 = Tab1:NewSection("GUI")

Section2:NewButton("Sussy Hub", "My Name Is Diddy, Dad, I Want Some Kiddies, Diddy", function()
    
end)
