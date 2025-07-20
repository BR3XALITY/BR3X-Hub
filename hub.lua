game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made By Team Sauce",
    Text = "Rebranded to Team Sauce (july 2025)",
    Icon = "rbxassetid://127075522746007"
})
setclipboard("https://youtube.com/@boostedreality")  -- Fixed the URL string
wait(1.0)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZZZ/Kavo-UI-Library/main/Kavo.lua"))()

local Window = Library.CreateLib("Team Sauce Hub", "BloodTheme")

local Tab1 = Window:NewTab("Scripts")

local Section1 = Tab1:NewSection("Universal")

Section1:NewButton("Fly GUI V3", "Allows You To Fly", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/2f343c8bdfb2a6d254ba45cb191ab9e2/raw/073c9c09a874958264386abe50f5554a66fd849e/fly.lua'))()
end)

Section1:NewButton("Subplace Finder", "Allows You To Access Secret Subplaces In Games", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/BR3XALITY/c2faac9cf981bab2859421f5e310f788/raw/abbcfdc96b90f69ed2ad304edcf371bc4d037c64/subspace.lua'))()
end)

local Section2 = Tab1:NewSection("GUI")

Section2:NewButton("Sussy Hub", "My Name Is Diddy, Dad, I Want Some Kiddies, Diddy", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/BR3XALITY/450114532ad56ca0dfe426f57202bed1/raw/3ad8790a5e04f47758ce2b41aceb631eba1ef79f/Cool.lua"))()
end)

Section2:NewButton("Teleport GUI", "if my calculations are correct, when this baby hits eighty-eight miles per hour… you're gonna see some serious ####", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/BR3XALITY/999cd637f186ed2ec6998a78b48a935b/raw/2341291a7ea44ad5c2c88357153688ac24ab21a7/tp.lua"))()
end)

Section2:NewButton("Wizard Tycoon GUI", "Dylan said it was epic", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Wizard%20Tycoon%20-%202%20Player/2pWizardTycoonGUI"))()
end)

Section2:NewButton("Brookhaven GUI", "Dylan said it was epic^²", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua"))()
    end)
