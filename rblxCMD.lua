local ResponseTest1
local ResponseTest2
local Clip
local Noclipping
local FoundPlayer
local tempstr
local floatDied
local strtocompare
local arg
local HttpService = game:GetService'HttpService'
local plr = game:GetService'Players'.LocalPlayer
local plrs = game:GetService'Players'
local plrw = plr.Character
local plrh = plrw:FindFirstChild('Humanoid')
local plrhrp = plrw:FindFirstChild('HumanoidRootPart')
local RunService = game:GetService('RunService')
local workspace = game:GetService('Workspace')
local MPos = plr:GetMouse()
local gs = GetService
local notif = loadstring(game:HttpGet('https://raw.githubusercontent.com/fheahdythdr/ui-libs-ui-lib-backups/main/function%20things/notifs.lua'))() 
local SendNotif = notif:Init()
plr.CharacterAdded:Connect(function(nchar)
    plrh = nchar:WaitForChild('HumanoidRootPart')
    plrw = nchar
    plrh = plrw.Humanoid
end)
if game.PlaceId == 6456351776 then
    for i, connection in pairs(getconnections(game.Players.LocalPlayer.Character.Humanoid.Changed)) do
        connection:Disable()
    end
    
    
    plr.CharacterAdded:Connect(function()
    
        task.wait(.5)
    
        if plrhumanoid ~= nil then
            for _, conn in next, getconnections(plrhumanoid.Changed) do
                conn:Disable()
            end
        end
    
    end)
end

local function RefreshConsole(name, initialcolour, startingtext_or_nil)
    rconsoleclear()
    if name then
        rconsolename(name)
    else
        rconsolename(identifyexecutor().." Console")
    end
    if initialcolour then
        rconsoleprint(initialcolour)
    end
    if startingtext_or_nil then
        rconsoleprint(startingtext_or_nil)
    end
    rconsoleprint("@@WHITE@@")
end

local function clearconsole()
    RefreshConsole("rblx CMD", "@@MAGENTA@@")
end

local function AwaitConsoleInput()
    return rconsoleinput()
end
local function RefreshInput(input)
    input = AwaitConsoleInput()
end
local function NoclipLoop()
    if Clip == false    then
        for _, child in pairs(plrw:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true then
                child.CanCollide = false
            end
        end
    end
end
local function FindName(name)
    for _, v in next, game.Players:GetPlayers() do
        local subbedname = string.sub(v.Name:lower(), 1, string.len(name))
        local subbeddisplayname = string.sub(v.DisplayName:lower(), 1, string.len(name))
        
        if (subbedname == name) then
            return tostring(v)
        elseif (subbeddisplayname == name) then
            return tostring(v)
        end
    end
end
local function SendError(ErrorText)
    rconsoleprint("@@RED@@")
    rconsoleprint("<ERROR> "..ErrorText)
    rconsoleprint("@@WHITE@@")
end

RefreshConsole("rblx CMD", "@@MAGENTA@@")
local function SetCyan()
    rconsoleprint("@@MAGENTA@@")
end
local function SetWhite()
    rconsoleprint("@@WHITE@@")
end
local function SetRed()
    rconsoleprint("@@RED@@")
end
local function SetPurple()
    rconsoleprint("@@GREEN@@")
end

function ApplyModel(model)
    if not model:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = model.Character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
    end
function ApplyPlayer(model)
    if not model:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = model
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

local cmdtable =
{   
    {
        names = {"setws", "ws"},
        callback = function(speed)
            if speed ~= nil then
                SetCyan()
                rconsoleprint("setting walkspeed to "..speed.."\n")
                game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speed)
                wait(.25)
                rconsoleprint("walkspeed has been set to "..speed.."\n")
                SetWhite()
            end
        end
    }
}

task.spawn(function()
    while wait(1) do
        plrtable = {}
        for i,v in pairs(plrs:GetChildren()) do
            table.insert(plrtable, v)
        end
    end
end)

local function AddCmd(name, alias, func)
    local cmd = {}
    if alias then
        cmd.names = {name, alias}
    else
        cmd.names = {name}
    end
    cmd.callback = func
    table.insert(cmdtable, cmd)
end

local function ListCommands()
    SetCyan()
    rconsoleprint("Commands are:\n")
    for i,v in pairs(cmdtable) do
        if v.names[1] and v.names[2] then
            rconsoleprint(""..v.names[1].."/"..v.names[2].."\n")
        else
            rconsoleprint(""..v.names[1].."\n")
        end
    end
    SetPurple()
    rconsoleprint("\n\nEnter a command:\n\n")
    SetWhite()
end

AddCmd("clr", "clrlogs", function()
    clearconsole()
    ListCommands()
end)
AddCmd("float", "platform", function()
    if not plrw:FindFirstChild("oogeABAOGAGOBAOGOAG") then
        task.spawn(function()
            local Float = Instance.new('Part')
            Float.Name = "oogeABAOGAGOBAOGOAG"
            Float.Parent = plrw
            Float.Transparency = 1
            Float.Size = Vector3.new(2,0.2,1.5)
            Float.Anchored = true
            local FloatValue = -3.1
            Float.CFrame = plrhrp.CFrame * CFrame.new(0,FloatValue,0)
            qUp = MPos.KeyUp:Connect(function(KEY)
                if KEY == 'q' then
                    FloatValue = FloatValue + 0.5
                end
            end)
            eUp = MPos.KeyUp:Connect(function(KEY)
                if KEY == 'e' then
                    FloatValue = FloatValue - 0.5
                end
            end)
            qDown = MPos.KeyDown:Connect(function(KEY)
                if KEY == 'q' then
                    FloatValue = FloatValue - 0.5
                end
            end)
            eDown = MPos.KeyDown:Connect(function(KEY)
                if KEY == 'e' then
                    FloatValue = FloatValue + 0.5
                end
            end)
            floatDied = plrw:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                FloatingFunc:Disconnect()
                Float:Destroy()
                qUp:Disconnect()
                eUp:Disconnect()
                qDown:Disconnect()
                eDown:Disconnect()
                floatDied:Disconnect()
            end)
            local function FloatPadLoop()
                if plrw:FindFirstChild("oogeABAOGAGOBAOGOAG") and plrhrp then
                    Float.CFrame = plrhrp.CFrame * CFrame.new(0,FloatValue,0)
                else
                    FloatingFunc:Disconnect()
                    Float:Destroy()
                    qUp:Disconnect()
                    eUp:Disconnect()
                    qDown:Disconnect()
                    eDown:Disconnect()
                    floatDied:Disconnect()
                end
            end			
            FloatingFunc = game:GetService('RunService').Heartbeat:Connect(FloatPadLoop)
        end)
    end
    SetCyan()
    rconsoleprint("Float has been enabled, Q and E to go up and down.\n")
    SetWhite()
end)
AddCmd("unfloat", "noplatform", function()
    if plrw:FindFirstChild("oogeABAOGAGOBAOGOAG") then
        plrw:FindFirstChild("oogeABAOGAGOBAOGOAG"):Destroy()
    end
    if floatDied then
        FloatingFunc:Disconnect()
        qUp:Disconnect()
        eUp:Disconnect()
        qDown:Disconnect()
        eDown:Disconnect()
        floatDied:Disconnect()
    end 
    SetCyan()
    rconsoleprint("Float has been disabled.\n")
    SetWhite()
end)
AddCmd("noclip", "nc", function()
    Clip = false
    Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    SetCyan()
    rconsoleprint("<INFO> Noclip enabled.\n")
    SetWhite()
end)
AddCmd("clip", "c", function()
    Clip = true
    Noclipping:Disconnect()
    SetCyan()
    rconsoleprint("<INFO> Noclip disabled.\n")
    SetWhite()
end)
AddCmd("setjp", "jp", function(arg)
    if arg ~= nil then
        SetCyan()
        rconsoleprint("<INFO> Setting jumppower to "..arg..".\n")
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = tonumber(arg)
        wait(.25)
        rconsoleprint("<INFO> Jumppower has been set to "..arg..".\n")
        SetWhite()
    end
end)
AddCmd("PFesp", "pfesp", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/pfesp.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> PFesp Active.\n")
            SetWhite()
end)
AddCmd("pfhbextr", "pfhitbox", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/pfhitboxexpander.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> pfhitboxexpander Active.\n")
            SetWhite()
end)
AddCmd("nmesp", "nameesp", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/nameesp.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> nameesp Active.\n")
            SetWhite()
end)
AddCmd("swavatar", "showavatar", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/showavatar.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> showavatar Active.\n")
            SetWhite()
end)
AddCmd("grpenchancer", "graphics", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/graphenchancer.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> graphicsenchancer Active.\n")
            SetWhite()
end)
AddCmd("bxesp", "boxesp", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/boxesp2.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> boxesp Active.\n")
            SetWhite()
end)
AddCmd("billboardremover", "bilremover", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/billboardremover.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> billboardremover Active.\n")
            SetWhite()
end)
AddCmd("aikick", "antikick", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/unknown-x10/test/main/antikick.lua", true))()
            SetCyan()
            rconsoleprint("<INFO> antikick Active.\n")
            SetWhite()
end) 

ListCommands()

while true do
    SetPurple()
    rconsoleprint(">")
    SetWhite()
    local str = AwaitConsoleInput()
    local FoundCommand = false
    for i,v in pairs(cmdtable) do
        strtocompare = string.split(str, " ")
        str = strtocompare[1]
        if #strtocompare >= 2 then
            arg = strtocompare[2]
        end
        if table.find(v.names, str) then
            FoundCommand = true
            v.callback(arg)
        end
    end
    if not FoundCommand then
        SendError("Failed to find command " .. str .. "!\n")
    end
end

