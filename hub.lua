game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made By BR3XALITY";
    Text = "@boostedreality On YT";
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
    local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v81=v2(v0(v30,16));if v19 then local v92=0;local v93;while true do if (v92==1) then return v93;end if (v92==0) then v93=v5(v81,v19);v19=nil;v92=1;end end else return v81;end end end);local function v20(v31,v32,v33) if v33 then local v82=0;local v83;while true do if (v82==(0 -0)) then v83=(v31/((5 -3)^(v32-(1 -0))))%((4 -2)^(((v33-(620 -(555 + (941 -(282 + 595))))) -(v32-(932 -(857 + 74)))) + 1)) ;return v83-(v83%(569 -(367 + 201))) ;end end else local v84=2^(v32-(928 -(214 + 713))) ;return (((v31%(v84 + v84))>=v84) and ((1638 -(1523 + 114)) + 0)) or (0 + 0) ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=0 + 0 ;local v36;local v37;while true do if (v35==(0 -0)) then v36,v37=v1(v16,v18,v18 + (1067 -(68 + 997)) );v18=v18 + (1272 -(226 + 1044)) ;v35=1;end if (v35==((4 + 0) -3)) then return (v37 * (373 -(32 + 85))) + v36 ;end end end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + 3 );v18=v18 + 1 + 3 ;return (v41 * (16778173 -(892 + 65))) + (v40 * 65536) + (v39 * (610 -354)) + v38 ;end local function v24() local v42=(18 -(10 + 8)) -0 ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==1) then v45=1 -0 ;v46=(v20(v44,351 -((334 -247) + 263) ,200 -(67 + 113) ) * ((2 + 0)^(78 -46))) + v43 ;v42=2;end if (v42==(3 + 0)) then if (v47==(0 -0)) then if (v46==((3039 -2087) -(802 + 150))) then return v48 * (0 -0) ;else v47=1 -0 ;v45=0 + 0 ;end elseif (v47==((1932 -(416 + 26)) + 557)) then return ((v46==(997 -(915 + 82))) and (v48 * (((440 -(145 + 293)) -1)/0))) or (v48 * NaN) ;end return v8(v48,v47-(596 + 427) ) * (v45 + (v46/((2 -(430 -(44 + 386)))^52))) ;end if ((1187 -(1069 + 118))==v42) then v43=v23();v44=v23();v42=2 -1 ;end if (v42==(3 -1)) then v47=v20(v44,21,31);v48=((v20(v44,6 + 26 )==(1 -(1486 -(998 + 488)))) and  -(1 + 0)) or (792 -(368 + 423)) ;v42=9 -6 ;end end end local function v25(v49) local v50;if  not v49 then local v85=1138 -(116 + 1022) ;while true do if (v85==((859 -(814 + 45)) + (0 -0))) then v49=v23();if (v49==(0 + 0)) then return "";end break;end end end v50=v3(v16,v18,(v18 + v49) -(1 + 0) );v18=v18 + v49 ;local v51={};for v65=773 -(201 + 31 + 540) , #v50 do v51[v65]=v2(v1(v3(v50,v65,v65)));end return v6(v51);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return 700 -(271 + 429) ;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(fun    
                end)
