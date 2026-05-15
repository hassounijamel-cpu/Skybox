local Libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/hassounijamel-cpu/0777/refs/heads/main/%D9%88%D8%A7%D8%AC%D9%87%D9%87%20%D9%85%D8%B3%D8%AA%D8%B7%D9%8A%D9%84%D8%A9.txt"))()
Libary.SoundSettings = {
    Enabled = true,
    SoundId = "rbxassetid://18998603679",
    Volume = 1
}
Libary.BackgroundSettings = {
    Enabled = true,
    ImageId = "rbxassetid://125602848737897",
    Transparency = 0.2
}
Libary.IntroSettings = {
    Enabled = true
}

local function PlayClickSound()
    if Libary.SoundSettings.Enabled then
        local sound = Instance.new("Sound", game:GetService("SoundService"))
        sound.SoundId = Libary.SoundSettings.SoundId
        sound.Volume = Libary.SoundSettings.Volume
        sound:Play()
        sound.Ended:Connect(function() sound:Destroy() end)
    end
end

local function ConnectButtons(parent)
    local function check(obj)
        if obj:IsA("TextButton") or obj:IsA("ImageButton") then
            obj.Activated:Connect(PlayClickSound)
        end
    end
    for _, item in pairs(parent:GetDescendants()) do check(item) end
    parent.DescendantAdded:Connect(check)
end

if Libary.IntroSettings.Enabled then
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local SoundService = game:GetService("SoundService")
    local LocalPlayer = Players.LocalPlayer
    local audioUrl = "https://raw.githubusercontent.com/hassounijamel-cpu/0777/refs/heads/main/Morneymar.mp3"
    local getAsset = getcustomasset or getsynasset
    local fileName = "Morneymar.mp3"
    task.spawn(function()
        if not isfile(fileName) then
            local success, data = pcall(function() return game:HttpGet(audioUrl) end)
            if success and data then writefile(fileName, data) end
        end
        local introSound = Instance.new("Sound", SoundService)
        introSound.SoundId = getAsset(fileName)
        introSound.Volume = 3
        introSound:Play()
        task.wait(7)
        TweenService:Create(introSound, TweenInfo.new(1), {Volume = 0}):Play()
        task.wait(1)
        introSound:Stop()
        introSound:Destroy()
    end)
    local IntroGui = Instance.new("ScreenGui", CoreGui)
    IntroGui.Name = "IntroLoader"    
    local MainFrame = Instance.new("Frame", IntroGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 0, 0, 30)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)  
    local Label = Instance.new("TextLabel", MainFrame)
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = " نورت/ي يا " .. LocalPlayer.DisplayName
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextTransparency = 1
    TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 220, 0, 30)}):Play()
    task.wait(0.4)
    TweenService:Create(Label, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    task.wait(2.5)
    TweenService:Create(Label, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    task.wait(0.4)
    Label.Text = "تحميل التابات... "
    TweenService:Create(Label, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    task.wait(2.5)
    TweenService:Create(Label, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    task.wait(0.2)
    TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 30)}):Play()
    task.wait(0.7)
    IntroGui:Destroy()
end

workspace.FallenPartsDestroyHeight = -math.huge
local Window = Libary:MakeWindow({
    Title = "Neymar HUB                       ",
    SubTitle = "             BY Neymar              ",
    LoadText = "Neymar ",
    Flags = "Neymar_Broookhaven"
})

task.spawn(function()
    local coreGui = game:GetService("CoreGui")
    local gui = coreGui:WaitForChild("bruton hub with bruton library", 10)
    if gui then
        if Libary.BackgroundSettings.Enabled then
            local mainFrame = gui:FindFirstChild("Hub")
            if mainFrame then
                local WindowBackground = Instance.new("ImageLabel")
                WindowBackground.Size = UDim2.new(1, 0, 1, 0)
                WindowBackground.BackgroundTransparency = 1
                WindowBackground.Image = Libary.BackgroundSettings.ImageId
                WindowBackground.ImageTransparency = Libary.BackgroundSettings.Transparency
                WindowBackground.ScaleType = Enum.ScaleType.Crop
                WindowBackground.ZIndex = 0
                WindowBackground.Parent = mainFrame
                Instance.new("UICorner", WindowBackground).CornerRadius = UDim.new(0, 15)
            end
        end
        ConnectButtons(gui)
    end
end)

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://125602848737897", BackgroundTransparency = 0 }, 
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({ Title = "حقوق", Icon = "rbxassetid://10723415903" })
Tab1:AddDiscordInvite({
    Name = "Neymar ",
    Description = "TIKTOK ",
    Logo = "rbxassetid://125602848737897",
    Invite = "https://TIKTOK.com/Wlv27",
})
Tab1:AddParagraph({"CREDIT", "Neymar"})
Tab1:AddButton({
	Name = "تم صنع هذا السكربت بواسطة حسنين ",
	Callback = function()
		setclipboard("حسنين عمك")
	end
})
-- neymar hub
local TabAnti = Window:MakeTab({"المضادات", "rbxassetid://10734951847"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = nil
local humanoid = nil
local root = nil
local invisible = false
local savedParts = {}
local function cacheParts()
savedParts = {}
for _,v in ipairs(character:GetDescendants()) do
if v:IsA("BasePart") and v.Transparency < 1 then
		table.insert(savedParts, v)
	      	end
end
end
local function setInvisible(state)
invisible = state
for _,p in ipairs(savedParts) do
if invisible then
p.Transparency = 0.5
else
p.Transparency = 0
		end
	end
end
local function onCharacter(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	root = char:WaitForChild("HumanoidRootPart")
	cacheParts()
	setInvisible(false)
end

player.CharacterAdded:Connect(onCharacter)
if player.Character then
	onCharacter(player.Character)
end
RunService.Heartbeat:Connect(function()
	if invisible and root and humanoid then
		local oldCF = root.CFrame
		local oldOffset = humanoid.CameraOffset
local newCF = oldCF * CFrame.new(0, -200000, 0)
		local rel = newCF:ToObjectSpace(CFrame.new(oldCF.Position)).Position
root.CFrame = newCF
		      humanoid.CameraOffset = rel
	RunService.RenderStepped:Wait()
root.CFrame = oldCF
humanoid.CameraOffset = oldOffset
	end
end)
TabAnti:AddToggle({
	Name = "مضاد بانج",
	Default = false,
	Callback = function(v)
		setInvisible(v)
	end
})
local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local RS=game:GetService("ReplicatedStorage")
local LocalPlayer=Players.LocalPlayer
local Remotes=RS:WaitForChild("Remotes")
local resetRemote=Remotes:WaitForChild("ResetCharacterAppearance")
local enabled=false

local function getAccSet(desc)
    local t={}
    for _,a in ipairs(desc:GetAccessories(true)) do
        if a.AssetId then t[a.AssetId]=true end
    end
    return t
end

local function countMatch(a,b)
    local c=0
    for id in pairs(a) do
        if b[id] then c+=1 end
    end
    return c
end
local function tweenTo(plr)
    if not (plr.Character and LocalPlayer.Character) then return end
    local hrp=LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local thrp=plr.Character:FindFirstChild("HumanoidRootPart")
    if not (hrp and thrp) then return end
    TweenService:Create(hrp,TweenInfo.new(0.2,Enum.EasingStyle.Linear),{CFrame=thrp.CFrame}):Play()
end
local function watch(plr)
    if plr==LocalPlayer then return end
    task.spawn(function()
        while enabled and plr.Parent do
            if plr.Character and LocalPlayer.Character then
                local lhum=LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local thum=plr.Character:FindFirstChildOfClass("Humanoid")
                if lhum and thum then
                    local lset=getAccSet(lhum:GetAppliedDescription())
                    local tset=getAccSet(thum:GetAppliedDescription())
                    if countMatch(lset,tset)>=3 then
                        resetRemote:FireServer()
                        task.wait(0.1)
                        tweenTo(plr)
                        task.wait(0.00001)
                    end
                end
            end
            task.wait(0.2)
        end
    end)
end
TabAnti:AddToggle({
    Name="مضاد نسخ سكنات",
    Default=false,
    Callback=function(v)
        enabled=v
        if v then
            for _,p in ipairs(Players:GetPlayers()) do watch(p) end
            Players.PlayerAdded:Connect(watch)
        end
    end
})

local conexaoAutoRemocao
local alvo = "1Gu1nSound1s"
local objetosRestaurados = {} 

local function removerAlvo()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj.Name == alvo then
            pcall(function()
                local clone = obj:Clone()
                local parentOriginal = obj.Parent
                table.insert(objetosRestaurados, {Clone = clone, Parent = parentOriginal})
                obj:Destroy()
            end)
        end
    end
end

local function restaurarAlvo()
    for _, dados in ipairs(objetosRestaurados) do
        pcall(function()
            dados.Clone.Parent = dados.Parent
        end)
    end
    objetosRestaurados = {}
end

TabAnti:AddToggle({
    Name = "مضاد ازعاج الصوت",
    Description = "",
    Default = false,
    Callback = function(v)
        if v then
            removerAlvo()
            conexaoAutoRemocao = game.DescendantAdded:Connect(function(obj)
                if obj.Name == alvo then
                    task.wait(0.1)
                    pcall(function()
                        local clone = obj:Clone()
                        local parentOriginal = obj.Parent
                        table.insert(objetosRestaurados, {Clone = clone, Parent = parentOriginal})
                        obj:Destroy()
                    end)
                end
            end)
        else
            if conexaoAutoRemocao then
                conexaoAutoRemocao:Disconnect()
                conexaoAutoRemocao = nil
            end
            restaurarAlvo()
        end
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local lastSafePos = Vector3.new(-26.09, 2.79, 6.11)
local avoidConn
TabAnti:AddToggle({
    Name = "مضاد فويد",
    Description = "",
    Default = false,
    Callback = function(Value)
        if avoidConn then
            avoidConn:Disconnect()
            avoidConn = nil
        end

        if Value then
            avoidConn = RunService.Stepped:Connect(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local pos = hrp.Position

                if pos.Y > -20 and pos.Y < 1000 and math.abs(pos.X) < 2000 and math.abs(pos.Z) < 2000 then
                    lastSafePos = pos
                end

                if pos.Y < -50 or pos.Y > 1500 or math.abs(pos.X) > 3000 or math.abs(pos.Z) > 3000 then
                    hrp.CFrame = CFrame.new(lastSafePos)

                    pcall(function()
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "LOC4T HUB",
                            Text = "انت محمي من الموت تحت الارض",
                            Duration = 2
                        })
                    end)
                end
            end)
        end
    end
})
local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local backupTables = {
    Vehicles = {},
    Canoes = {},
    Jets = {},
    Helis = {},
    Balls = {}
}
local TeleportCarro = {}
function TeleportCarro:MostrarNotificacao(msg)
    print("LOC4T "..msg)
end
local function AntiFlingLoop(name, getFolderFunc)
    local active = false
    task.spawn(function()
        while true do
            if active and LocalPlayer.Character then
                local folder = getFolderFunc()
                if folder then
                    for _, item in ipairs(folder:GetChildren()) do
                        local isMine = false
                        if name == "Vehicles" then
                            for _, seat in ipairs(item:GetDescendants()) do
                                if (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant and seat.Occupant.Parent == LocalPlayer.Character then
                                    isMine = true
                                    break
                                end
                            end
                        elseif name == "Canoes" then
                            local owner = item:FindFirstChild("Owner")
                            isMine = owner and owner.Value == LocalPlayer
                        elseif name == "Jets" or name == "Helis" then
                            isMine = item.Name == LocalPlayer.Name
                        end
                        if not isMine then
                            table.insert(backupTables[name], item:Clone())
                            item:Destroy()
                        end
                    end
                end
            end
            task.wait(0.03)
        end
    end)
    return function(state)
        active = state
        TeleportCarro:MostrarNotificacao(name.." "..(state and "ativado!" or "desativado!"))
        if not state then
            for _, item in ipairs(backupTables[name]) do
                local parentFolder = getFolderFunc()
                if parentFolder then item.Parent = parentFolder end
            end
            backupTables[name] = {}
        end
    end
end
TabAnti:AddToggle({
    Name = "مضاد فلنق ",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Vehicles", function()
        return Workspace:FindFirstChild("Vehicles")
    end)
})
TabAnti:AddToggle({
    Name = "مضاد فلنق قارب الصيد",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Canoes", function()
        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
        return workspaceCom and workspaceCom:FindFirstChild("001_CanoeStorage")
    end)
})

TabAnti:AddToggle({
    Name = "مضاد فلنق طائرة",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Jets", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        if folder and folder:FindFirstChild("001_Airport") then
            local storage = folder["001_Airport"]:FindFirstChild("AirportHanger")
            if storage then return storage:FindFirstChild("001_JetStorage") and storage["001_JetStorage"]:FindFirstChild("JetAirport") end
        end
    end)
})
TabAnti:AddToggle({
    Name = "مضاد فلنق هيليكوبتر",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Helis", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_HeliStorage") and folder["001_HeliStorage"]:FindFirstChild("PoliceStationHeli")
    end)
})
TabAnti:AddToggle({
    Name = "مضاد فلنق كرة",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Balls", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_SoccerBalls")
    end)
})
local antiSitActive = false
TabAnti:AddToggle({
    Name = "مضاد جلوس",
    Description = "",
    Default = false,
    Callback = function(state)
        antiSitActive = state
        TeleportCarro:MostrarNotificacao("Anti Sit "..(state and "ativado!" or "desativado!"))
        task.spawn(function()
            while antiSitActive and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end
                task.wait(0.05)
            end
            if not antiSitActive then
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end)
    end
})
TabAnti:AddToggle({
    Name = "مضاد لاق الادوات",
    Description = "",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local dedupLock = {}
        local IGNORED_PLAYER

        if not state then return end

        local function marcarIgnorado(player)
            IGNORED_PLAYER = player
        end

        local function isTargetTool(inst)
            return inst:IsA("Tool")
        end

        local function gatherTools(player)
            local found = {}
            local containers = {}
            if player.Character then table.insert(containers, player.Character) end
            local backpack = player:FindFirstChildOfClass("Backpack")
            if backpack then table.insert(containers, backpack) end
            local sg = player:FindFirstChild("StarterGear")
            if sg then table.insert(containers, sg) end
            for _, container in ipairs(containers) do
                for _, child in ipairs(container:GetChildren()) do
                    if isTargetTool(child) then table.insert(found, child) end
                end
            end
            return found
        end

        local function dedupePlayer(player)
            if player == IGNORED_PLAYER then return end
            if dedupLock[player] then return end
            dedupLock[player] = true
            local tools = gatherTools(player)
            if #tools > 1 then
                for i = 2, #tools do pcall(function() tools[i]:Destroy() end) end
            end
            dedupLock[player] = false
        end

        local function hookPlayer(player)
            if not IGNORED_PLAYER then marcarIgnorado(player) end
            task.defer(dedupePlayer, player)
            local function setupChar(char)
                task.delay(0.5, function() dedupePlayer(player) end)
                char.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            if player.Character then setupChar(player.Character) end
            player.CharacterAdded:Connect(setupChar)
            local backpack = player:WaitForChild("Backpack", 10)
            if backpack then
                backpack.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            local sg = player:FindFirstChild("StarterGear") or player:WaitForChild("StarterGear", 10)
            if sg then
                sg.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
        end

        Players.PlayerAdded:Connect(hookPlayer)
        for _, plr in ipairs(Players:GetPlayers()) do hookPlayer(plr) end

        task.spawn(function()
            while state do
                for _, plr in ipairs(Players:GetPlayers()) do dedupePlayer(plr) end
                task.wait(2)
            end
        end)
    end
})
TabAnti:AddToggle({
    Name = "مضاد الابواب",
    Description = "",
    Default = false,
    Callback = function(state)
        if not _G.hiddenDoors then _G.hiddenDoors = {} end
        if state then
            _G.hiddenDoors = {}
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("door") then
                    local doorData = {
                        door = obj,
                        originalTransparency = obj.Transparency,
                        originalCanCollide = obj.CanCollide,
                        originalCastShadow = obj.CastShadow
                    }
                    obj.Transparency = 1
                    obj.CanCollide = false
                    obj.CastShadow = false
                    for _, child in ipairs(obj:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 1
                            child.CanCollide = false
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = false
                        end
                    end
                    table.insert(_G.hiddenDoors, doorData)
                end
            end
            print("LOC4T " .. #_G.hiddenDoors .. " LOC4T HUB ")
        else
            for _, doorData in ipairs(_G.hiddenDoors or {}) do
                if doorData.door and doorData.door.Parent then
                    doorData.door.Transparency = doorData.originalTransparency
                    doorData.door.CanCollide = doorData.originalCanCollide
                    doorData.door.CastShadow = doorData.originalCastShadow
                    for _, child in ipairs(doorData.door:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 0
                            child.CanCollide = true
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = true
                        end
                    end
                end
            end
            print("LOC4T " .. #(_G.hiddenDoors or {}) .. "LOC4THUB ")
            _G.hiddenDoors = {}
        end
    end
})

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local TweenService=game:GetService("TweenService")
local LocalPlayer=Players.LocalPlayer
local enabled=false
local lastCF=nil

local function voidBack()
    local char=LocalPlayer.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    lastCF=hrp.CFrame
    hrp.CFrame=hrp.CFrame*CFrame.new(0,-200,0)
    task.wait(2)
    if hrp and lastCF then
        TweenService:Create(
            hrp,
            TweenInfo.new(0.2,Enum.EasingStyle.Linear),
            {CFrame=lastCF}
        ):Play()
    end
end

RunService.Heartbeat:Connect(function()
    if not enabled then return end
    local char=LocalPlayer.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and workspace:FindFirstChild(p.Name) then
            local follow=workspace[p.Name]:FindFirstChild("FollowCharacter")
            if follow and follow:FindFirstChild("Torso") then
                local torso=follow.Torso
                if (torso.Position-hrp.Position).Magnitude<6 then
 voidBack()
 task.wait(2.5)
     break
                end
      end
        end
    end
end)
TabAnti:AddToggle({
  Name="مضاد الأطفال ",
    Default=false,
    Callback=function(v)
 enabled=v
    end
})

local Tab4 = Window:MakeTab({ Title = "نسخ سكنات و مؤاثرات", Icon = "rbxassetid://10734952036" })
Tab4:AddSection({ Name = "          v1 نسخ  سكنات", Icon = "rbxassetid://10734952036" })
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local lastValidTarget = nil
local copyType = "بروكهافن"
local Target = nil

local function Wear(id)
    pcall(function()
        Rep.Remotes.Wear:InvokeServer(tonumber(id))
    end)
end

local function RESETBLOCK()
     args = {
        [1] = {0, 0, 0, 0, 0, 0},
        [2] = "AllBlocky"
    }
    pcall(function()
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function ApplySkinToneFromUserId(userId)
    pcall(function()
        local info = Players:GetCharacterAppearanceInfoAsync(userId)
        if info.bodyColors then
            local headColor = info.bodyColors.HeadColor
            if headColor then
                Rep.Remotes.ChangeBodyColor:FireServer(tostring(headColor))
            end
        end
    end)
end

local function CopyClothing(desc)
    local items = {desc.Shirt, desc.Pants, desc.GraphicTShirt, desc.Face}
    for _, id in ipairs(items) do
        if tonumber(id) and id ~= 0 then
            Wear(id)
            task.wait(0.1)
        end
    end
end

local function CopyAccessories(desc)
    pcall(function()
        for _, v in ipairs(desc:GetAccessories(true)) do
            if v.AssetId then
                Wear(v.AssetId)
                task.wait(0.1)
            end
        end
    end)
end

local function CopyBodyParts(desc, source)
     args = {
        [1] = {
            tonumber(desc.Torso),
            tonumber(desc.RightArm),
            tonumber(desc.LeftArm),
            tonumber(desc.RightLeg),
            tonumber(desc.LeftLeg),
            tonumber(desc.Head)
        },
        [2] = source
    }
    pcall(function()
        Rep.Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end)
end

local function CopyAnimations(desc)
    local anims = {
        desc.IdleAnimation,
        desc.WalkAnimation,
        desc.RunAnimation,
        desc.JumpAnimation,
        desc.FallAnimation,
        desc.SwimAnimation
    }
    for _, animId in ipairs(anims) do
        if tonumber(animId) and animId ~= 0 then
            Wear(animId)
            task.wait(0.1)
        end
    end
end

local function CopyBrookhaven(targetPlayer)
    local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local desc = humanoid:GetAppliedDescription()
    local bodyColors = targetPlayer.Character:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        local headColor = bodyColors.HeadColor
        if headColor then
            Rep.Remotes.ChangeBodyColor:FireServer(tostring(headColor))
        end
    end

    pcall(function()
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "اكتب هناااا")
        CopyClothing(desc)
        CopyAnimations(desc)
    end)
end

local function CopyOriginalAvatar(userId)
    pcall(function()
        local desc = Players:GetHumanoidDescriptionFromUserId(userId)
        CopyAccessories(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription())
        RESETBLOCK()
        CopyAccessories(desc)
        task.wait(0.1)
        CopyBodyParts(desc, "اكتب هنااااااا")
        CopyClothing(desc)
        CopyAnimations(desc)
        ApplySkinToneFromUserId(userId)
    end)
end

local function findPlayerByName(partialName)
    if not partialName or partialName == "" then return nil end
    partialName = partialName:lower()
    
    local foundPlayers = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower():find(partialName, 1, true) then
            table.insert(foundPlayers, player)
        end
    end

    table.sort(foundPlayers, function(a, b)
        local aStart = a.Name:lower():sub(1, #partialName) == partialName
        local bStart = b.Name:lower():sub(1, #partialName) == partialName
        if aStart and not bStart then return true end
        if not aStart and bStart then return false end
        return #a.Name < #b.Name
    end)
    
    return foundPlayers[1]
end

Tab4:AddTextBox({
    Name = "اسم اللاعب",
    Default = "",
    Callback = function(text)
        if text == "" then
            if lastValidTarget then
                text = lastValidTarget
            else
                return
            end
        end
        local targetPlayer = findPlayerByName(text)
        if targetPlayer then
            Target = targetPlayer
            lastValidTarget = targetPlayer.Name
        end
    end
})

Tab4:AddDropdown({
    Name = "طريقة النسخ",
    Options = {"بروكهافن", "سكن لاساسي"},
    Callback = function(option)
        copyType = option
    end
})

Tab4:AddButton({
    Name = "نسخ",
    Callback = function()
        if not Target then return end
        if copyType == "بروكهافن" then
            CopyBrookhaven(Target)
        else
            CopyOriginalAvatar(Target.UserId)
        end
    end
})
Tab4:AddSection({ Name = "          v2 نسخ سكنات", Icon = "rbxassetid://10734952036" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

local Dropdown = Tab4:AddDropdown({
    Name = "اختيار لاعب",
    Options = GetPlayerNames(),
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)
Tab4:AddButton({
    Name = "نسخ",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                local LDesc = LHumanoid:GetAppliedDescription()

                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

local Section = Tab4:AddSection({"المؤاثرات"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ApplyEmmiter = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ApplyEmmiter")

local particleData = {
    {display="أبيض مجاني",server="0002FreeWhite",asset="rbxassetid://18635845425"},
    {display="أصفر مجاني",server="0003FreeYellow",asset="rbxassetid://18635841291"},
    {display="برتقالي مجاني",server="0004FreeOrange",asset="rbxassetid://18635859639"},
    {display="أخضر مجاني",server="0005FreeGreen",asset="rbxassetid://18635848788"},
    {display="أزرق مجاني",server="0006FreeBlue",asset="rbxassetid://18635847163"},
    {display="بنفسجي مجاني",server="0007FreePurple",asset="rbxassetid://18635843697"},
    {display="وردي مجاني",server="0008FreePink",asset="rbxassetid://18635852477"},
    {display="أحمر مجاني",server="0009FreeRed",asset="rbxassetid://18635837646"},

    {display="قلوب صفراء",server="001HeartsYellow",asset="rbxassetid://18635672195"},
    {display="قلوب خضراء",server="002HeartsGreen",asset="rbxassetid://18635727693"},
    {display="قلوب زرقاء",server="003HeartsBlue",asset="rbxassetid://18635732186"},
    {display="قلوب بنفسجية",server="004HeartsPurple",asset="rbxassetid://18635723426"},
    {display="قلوب وردية",server="005HeartsPink",asset="rbxassetid://18635726250"},
    {display="قلوب حمراء",server="006HeartsRed",asset="rbxassetid://18635729673"},

    {display="نقاط برتقالية",server="010DotsOrange",asset="rbxassetid://18637252424"},
    {display="نقاط صفراء",server="011DotsYellow",asset="rbxassetid://18637263004"},
    {display="نقاط بيضاء",server="012DotsWhite",asset="rbxassetid://18637254199"},
    {display="نقاط خضراء",server="013DotsGreen",asset="rbxassetid://18637265264"},
    {display="نقاط زرقاء",server="014DotsBlue",asset="rbxassetid://18637256859"},
    {display="نقاط بنفسجية",server="015DotsPurple",asset="rbxassetid://18637261058"},
    {display="نقاط وردية",server="016DotsPink",asset="rbxassetid://18637259328"},
    {display="نقاط حمراء",server="017DotsRed",asset="rbxassetid://18637267290"},

    {display="وميض أبيض",server="020TwinkleWhite",asset="rbxassetid://18637115654"},
    {display="وميض أصفر",server="021TwinkleYellow",asset="rbxassetid://18637118923"},
    {display="وميض أخضر",server="022TwinkleGreen",asset="rbxassetid://18637151114"},
    {display="وميض بنفسجي",server="023TwinklePurple",asset="rbxassetid://18637153880"},
    {display="وميض وردي",server="024TwinklePink",asset="rbxassetid://18637157071"},
    {display="وميض أحمر",server="025TwinkleRed",asset="rbxassetid://18637155247"},

    {display="نار بيضاء",server="030FireWhite",asset="rbxassetid://18637074370"},
    {display="نار برتقالية",server="031FireOrange",asset="rbxassetid://18637025451"},
    {display="نار خضراء",server="032FireGreen",asset="rbxassetid://18637078598"},
    {display="نار زرقاء",server="033FireBlue",asset="rbxassetid://18637076370"},
    {display="نار بنفسجية",server="034FirePurple",asset="rbxassetid://18637070174"},
    {display="نار سوداء",server="035FireBlack",asset="rbxassetid://18637072603"},

    {display="قلوب صغيرة صفراء",server="040SmallHeartsYellow",asset="rbxassetid://18637339451"},
    {display="قلوب صغيرة خضراء",server="041SmallHeartsGreen",asset="rbxassetid://18637337576"},
    {display="قلوب صغيرة زرقاء",server="042SmallHeartsBlue",asset="rbxassetid://18637345162"},
    {display="قلوب صغيرة بنفسجية",server="043SmallHeartsPurple",asset="rbxassetid://18637335865"},
    {display="قلوب صغيرة وردية",server="044SmallHeartsPink",asset="rbxassetid://18637343416"},
    {display="قلوب صغيرة حمراء",server="045SmallHeartsRed",asset="rbxassetid://18637341847"},

    {display="شرارات بيضاء",server="050SparksWhite",asset="rbxassetid://18637383085"},
    {display="شرارات خضراء",server="051SparksGreen",asset="rbxassetid://18637385236"},
    {display="شرارات زرقاء",server="052SparksBlue",asset="rbxassetid://18637386856"},
    {display="شرارات بنفسجية",server="053SparksPurple",asset="rbxassetid://18637442447"},
    {display="شرارات وردية",server="054SparksPink",asset="rbxassetid://18637445897"},
    {display="شرارات حمراء",server="055SparksRed",asset="rbxassetid://18637447550"},

    {display="فقاعات بيضاء",server="060BubbleWhite",asset="rbxassetid://18637495023"},
    {display="فقاعات خضراء",server="061BubbleGreen",asset="rbxassetid://18637493072"},
    {display="فقاعات زرقاء",server="062BubbleBlue",asset="rbxassetid://18637499282"},
    {display="فقاعات بنفسجية",server="063BubblePurple",asset="rbxassetid://18637497343"},
    {display="فقاعات حمراء",server="064BubbleRed",asset="rbxassetid://18637500927"},

    {display="موسيقى بيضاء",server="070MusicWhite",asset="rbxassetid://18637675173"},
    {display="موسيقى خضراء",server="071MusicGreen",asset="rbxassetid://18637677789"},
    {display="موسيقى زرقاء",server="072MusicBlue",asset="rbxassetid://18637680960"},
    {display="موسيقى بنفسجية",server="073MusicPurple",asset="rbxassetid://18637679384"},
    {display="موسيقى حمراء",server="074MusicRed",asset="rbxassetid://18637672698"},

    {display="دخان أبيض",server="080SmokeWhite",asset="rbxassetid://18637791748"},
    {display="دخان أصفر",server="081SmokeYellow",asset="rbxassetid://18637800482"},
    {display="دخان برتقالي",server="082SmokeOrange",asset="rbxassetid://18637793920"},
    {display="دخان أخضر",server="083SmokeGreen",asset="rbxassetid://18637789299"},
    {display="دخان أزرق",server="084SmokeBlue",asset="rbxassetid://18637803021"},
    {display="دخان بنفسجي",server="085SmokePurple",asset="rbxassetid://18637813360"},
    {display="دخان أحمر",server="086SmokeRed",asset="rbxassetid://18637796598"},
    {display="دخان أسود",server="087SmokeBlack",asset="rbxassetid://18637798529"},

    {display="نجوم بيضاء",server="090StarWhite",asset="rbxassetid://18637942956"},
    {display="نجوم برتقالية",server="091StarOrange",asset="rbxassetid://18637946172"},
    {display="نجوم خضراء",server="092StarGreen",asset="rbxassetid://18637934500"},
    {display="نجوم زرقاء",server="093StarBlue",asset="rbxassetid://18637940338"},
    {display="نجوم بنفسجية",server="094StarPurple",asset="rbxassetid://18637944796"},
    {display="نجوم وردية",server="095StarPink",asset="rbxassetid://18637947820"},
    {display="نجوم حمراء",server="096StarRed",asset="rbxassetid://18637949457"},
}

local Categories = {
    ["مجاني"] = {}
}

for _, v in ipairs(particleData) do
    if v.display:find("مجاني") then
        table.insert(Categories["مجاني"], v)
    else
        local cat = v.display:match("^(%S+)")
        Categories[cat] = Categories[cat] or {}
        table.insert(Categories[cat], v)
    end
end

local Selected = {}

for cat, items in pairs(Categories) do
    local options = {}
    for _, v in ipairs(items) do
        table.insert(options, v.display)
    end

    Tab4:AddDropdown({
        Name = cat .. " | المؤثرات",
        Options = options,
        Default = options[1],
        Callback = function(val)
            for _, v in ipairs(items) do
                if v.display == val then
                    Selected[cat] = v
                    break
                end
            end
        end
    })

    Tab4:AddButton({
        Name = "تفعيل " .. cat,
        Callback = function()
            local v = Selected[cat]
            if v then
                ApplyEmmiter:InvokeServer(
                    v.asset:gsub("rbxassetid://", ""),
                    v.server
                )
            end
        end
    })
end

local TabFE = Window:MakeTab({ Title = "FE", Icon = "rbxassetid://10709805838" })

local skyboxEnabled = false
local skyboxTrack = nil
local rigidTrack = nil
local savedNukeBody = {}

local function stopAllAnimations()
    if rigidTrack then
        pcall(function()
            rigidTrack:Stop()
            rigidTrack:Destroy()
        end)
        rigidTrack = nil
    end
    
    if skyboxTrack then
        pcall(function()
            skyboxTrack:Stop()
            skyboxTrack:Destroy()
        end)
        skyboxTrack = nil
    end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local animator = humanoid:FindFirstChild("Animator")
            if animator then
                for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                    if track.Animation then
                        local animId = track.Animation.AnimationId
                        if animId == "rbxassetid://70883871260184" or animId == "rbxassetid://3695333486" then
                            pcall(function()
                                track:Stop()
                            end)
                        end
                    end
                end
            end
        end
    end
end
TabFE:AddToggle({
    Name = "V1",
    Default = false,
    Callback = function(value)
        skyboxEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    skyboxTrack = humanoid:LoadAnimation(newAnim)
                    skyboxTrack.Priority = Enum.AnimationPriority.Action4
                    skyboxTrack:Play(0.1, 1, 0.01)
                    
                    task.wait(0.5)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    rigidTrack = humanoid:LoadAnimation(plankAnim)
                    rigidTrack.Priority = Enum.AnimationPriority.Movement
                    rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopAllAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeBody.Torso,
                            [2] = savedNukeBody.RightArm,
                            [3] = savedNukeBody.LeftArm,
                            [4] = savedNukeBody.RightLeg,
                            [5] = savedNukeBody.LeftLeg,
                            [6] = savedNukeBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeBody = {}
                    end
                end
            end
        end
    end
})
local nukeFlashEnabled = false
local nukeFlashTrack = nil
local flashRigidTrack = nil
local savedNukeFlashBody = {}

local function stopFlashAnimations()
    if flashRigidTrack then
        pcall(function()
            flashRigidTrack:Stop()
            flashRigidTrack:Destroy()
        end)
        flashRigidTrack = nil
    end
    
    if nukeFlashTrack then
        pcall(function()
            nukeFlashTrack:Stop()
            nukeFlashTrack:Destroy()
        end)
        nukeFlashTrack = nil
    end
end

TabFE:AddToggle({
    Name = "V2",
    Default = false,
    Callback = function(value)
        nukeFlashEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeFlashBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    nukeFlashTrack = humanoid:LoadAnimation(newAnim)
                    nukeFlashTrack.Priority = Enum.AnimationPriority.Action4
                    nukeFlashTrack:Play(0.1, 1, 1)
                    
                    task.wait(0.1)
                    nukeFlashTrack:AdjustSpeed(5)
                    
                    task.wait(0.3)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    flashRigidTrack = humanoid:LoadAnimation(plankAnim)
                    flashRigidTrack.Priority = Enum.AnimationPriority.Movement
                    flashRigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopFlashAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeFlashBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeFlashBody.Torso,
                            [2] = savedNukeFlashBody.RightArm,
                            [3] = savedNukeFlashBody.LeftArm,
                            [4] = savedNukeFlashBody.RightLeg,
                            [5] = savedNukeFlashBody.LeftLeg,
                            [6] = savedNukeFlashBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeFlashBody = {}
                    end
                end
            end
        end
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ChangeCharacterBody = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody")
local ResetAppearance = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance")

local LoopAnim = false
local CurrentTrack
local Initialized = false

local function ApplyFreshBang()
	pcall(function()
		local args = {
			[1] = {
				96655874457685,
				123402086843885,
				78300682916056,
				86276701020724,
				78409653958165,
				120668655481073
			}
		}
		ChangeCharacterBody:InvokeServer(unpack(args))
	end)
end

local function PlayAnimation()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://70883871260184"

	local track = animator:LoadAnimation(anim)
	track.Priority = Enum.AnimationPriority.Action
	track.Looped = false
	track:Play()

	CurrentTrack = track
end

local function StopEverything()
	LoopAnim = false

	if CurrentTrack then
		pcall(function()
			CurrentTrack:Stop()
		end)
		CurrentTrack = nil
	end

	pcall(function()
		ResetAppearance:FireServer()
	end)

	task.wait(0.5)

	local char = LocalPlayer.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Health = 0
		end
	end
end

TabFE:AddToggle({
	Name = "V4",
	Default = false,
	Callback = function(Value)
		if not Initialized then
			Initialized = true
			return
		end

		if Value then
			if LoopAnim then return end
			LoopAnim = true

			task.spawn(function()
				while LoopAnim do
					PlayAnimation()
					task.wait(0.1)
				end
			end)

			task.delay(1.2, ApplyFreshBang)
		else
			StopEverything()
		end
	end
})

local Section = TabFE:AddSection({"التحولات"})

Buttons = {
{"ناروتو","","https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas"},
{"باتمان","","https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas89"},
{"سونيك","","https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas86"},
{"بانيسو","","https://raw.githubusercontent.com/BRENOPOOF/yyyyyyyface/refs/heads/main/Main.txt"},
{"مورتي","","https://raw.githubusercontent.com/repositoryredzlib/Mortyyyyyy/refs/heads/main/Main.txt"},
{"ريك سانشيز","","https://raw.githubusercontent.com/BRENOPOOF/rick-Sanchez-/refs/heads/main/Main.txt"},
{"راعي البقر","","https://raw.githubusercontent.com/BRENOPOOF/wjsj/refs/heads/main/Main.txt"},
{"قيست 666","","https://raw.githubusercontent.com/lyrarepositorio-afk/swsw/refs/heads/main/Main.txt"},
{"اوبيتو","","https://cdn.authguard.org/virtual-file/c47b8a12ca6c4cef840280dafd893e7d"},
{"شادو","","https://raw.githubusercontent.com/267266273ffsfs/Shadow/refs/heads/main/Main.txt"},
{"قونر","يظهر للناس","https://raw.githubusercontent.com/lyrarepositorio-afk/GONER/refs/heads/main/Main.txt"},
{"نولي","يظهر للناس","https://raw.githubusercontent.com/lyrarepositorio-afk/gubby/refs/heads/main/Main.txt"},
{"تيوبرس","يظهر للناس","https://raw.githubusercontent.com/BRENOPOOF/1222/refs/heads/main/Main.txt"},
{"يد مقطوعة","في مسلسل وينزداي","https://raw.githubusercontent.com/BRENOPOOF/slafiznotedio/refs/heads/main/Main.txt"},
{"C00LKIDD","كولكيد","https://raw.githubusercontent.com/repositoryredzlib/xzzxsx/refs/heads/main/Main.txt"},
{"سكربت الرقصات المشهور","","https://raw.githubusercontent.com/Gazer-Ha/Free-emote/refs/heads/main/Delta%20mad%20stuffs"},
{"هيروبراين","يظهر للناس","https://raw.githubusercontent.com/lyrarepositorio-afk/hEROBRINE/refs/heads/main/Main.txt"},
{"قطة الكرتون","","https://raw.githubusercontent.com/lyrarepositorio-afk/cartoon-cat/refs/heads/main/Main.txt"},
{"الاومنيتريكس","","https://raw.githubusercontent.com/267266273ffsfs/Ominitrix/refs/heads/main/Main.txt"},
{"كاموي * ترونو","","https://raw.githubusercontent.com/267266273ffsfs/kamui/refs/heads/main/Main.txt"},
{"ضرب*18","","https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Edge.lua"},
{"سكربت مشيات ورقصات","","https://rawscripts.net/raw/Universal-Script-AFEM-Max-Open-Alpha-50210"},
{"القاتل","","https://raw.githubusercontent.com/267266273ffsfs/Jeff/refs/heads/main/Main.txt"}
}

for _,v in ipairs(Buttons) do
TabFE:AddButton({
Name = v[1],
Desc = v[2],
Callback = function()
pcall(function()
loadstring(game:HttpGet(v[3]))()
end)
end
})
end


TabFE:AddButton({
Name = "جون دي",
Description = "",
Callback = function()
pcall(function()

ChangeBodyColor = ReplicatedStorage.Remotes.ChangeBodyColor
ChangeCharacterBody = ReplicatedStorage.Remotes.ChangeCharacterBody
Wear = ReplicatedStorage.Remotes.Wear

ChangeBodyColor:FireServer("Really black")

ChangeCharacterBody:InvokeServer({
0,0,0,0,0,0
})

Wear:InvokeServer(119700638189201)
Wear:InvokeServer(82561279414761)
Wear:InvokeServer(108099676910294)
Wear:InvokeServer(82861921093234)
Wear:InvokeServer(124476454384081)
Wear:InvokeServer(5319900634)
Wear:InvokeServer(5319909330)
Wear:InvokeServer(5319922112)

end)
end
})

Tablag = Window:MakeTab({ 
Title = "لاق السيرفر", 
Icon = "rbxassetid://10723415903" })
Tablag:AddSection({
    Name = "ايقاف السيرفر"
})

Tablag:AddToggle({
  Name = "ايقاف الانترنت والوقت سريع جدا!",
  Callback = function(Ddos)
if Ddos then
    local fireXPath = workspace.WorkspaceCom["001_DayCare"].Tools.FireX

    tools = "FireX"
    lagserver = true

    if workspace:FindFirstChild("Camera") then
        workspace:FindFirstChild("Camera"):Destroy()
    end

    wait(0.1)

    if workspace:FindFirstChild("Camera") then
        workspace:FindFirstChild("Camera"):Destroy()
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        fireXPath.CFrame + Vector3.new(0,-15,0)

    task.wait(0.2)

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    ddos = true

    for i=1,700 do
        task.wait()

        if ddos == false then
            local args = {
                [1] = "ClearAllTools"
            }

            cleartoolremote:FireServer(unpack(args))
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999,-475,9999)
            return
        end

        if workspace:FindFirstChild("Camera") then
            workspace:FindFirstChild("Camera"):Destroy()
        end

        if game.Players.LocalPlayer.Character:FindFirstChild(tools) then
            game.Players.LocalPlayer.Character:FindFirstChild(tools):Destroy()
        end

        if ddos == false then
            return
        end

        fireclickdetector(workspace.WorkspaceCom["001_DayCare"].Tools.FireX.ClickDetector,0)
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-475,0)
    else
    ddos = false
    lagserver = false
    shutdownserver = false
end
  end
})

Tablag:AddToggle({
  Name = "اغلاق واطفاء السيرفر",
  Callback = function(state)
if state then
    local fireXPath = workspace.WorkspaceCom["001_DayCare"].Tools.FireX

    tools = "Iphone"
    lagserver = true

    if workspace:FindFirstChild("Camera") then
        workspace:FindFirstChild("Camera"):Destroy()
    end

    wait(0.1)

    if workspace:FindFirstChild("Camera") then
        workspace:FindFirstChild("Camera"):Destroy()
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        fireXPath.CFrame + Vector3.new(0,-15,0)

    task.wait(0.2)

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    ddos = true

    for i=1,700 do
        task.wait()

        if ddos == false then
            local args = {
                [1] = "ClearAllTools"
            }

            cleartoolremote:FireServer(unpack(args))
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999,-475,9999)
            return
        end

        if workspace:FindFirstChild("Camera") then
            workspace:FindFirstChild("Camera"):Destroy()
        end

        if game.Players.LocalPlayer.Character:FindFirstChild(tools) then
            game.Players.LocalPlayer.Character:FindFirstChild(tools):Destroy()
        end

        if ddos == false then
            return
        end

        fireclickdetector(workspace.WorkspaceCom["001_DayCare"].Tools.FireX.ClickDetector,0)
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-475,0)
 
    else ddos = false
    lagserver = false
    shutdownserver = false 
end
  end
})
Tablag:AddSection({
    Name = "لاق باص"
})
 runLag = false
local lagCoroutine
Tablag:AddToggle({
    Name = "لاق باص(الافضل)",
    Default = false,
    Callback = function(Value)
        runLag = Value

        if runLag then
             Players = game:GetService("Players")  
             ReplicatedStorage = game:GetService("ReplicatedStorage")  
             LocalPlayer = Players.LocalPlayer  

            if not LocalPlayer then  
                warn("LocalPlayer não encontrado.")  
                return  
            end  

             character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
             humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)  
            if not humanoidRootPart then  
                warn("HumanoidRootPart não encontrado.")  
                return  
            end  

             function GetBus()  
                 vehicles = workspace:FindFirstChild("Vehicles")  
                if vehicles then  
                    return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")  
                end  
                return nil  
            end  

             remoteEvent = ReplicatedStorage:FindFirstChild("RE")  
            if not remoteEvent then  
                warn("RemoteEvent 'RE' não encontrado em ReplicatedStorage.")  
                return  
            end  

            if not remoteEvent:FindFirstChild("1Ca1r") then  
                warn("Evento filho '1Ca1r' não encontrado dentro de 'RE'.")  
                return  
            end  

            lagCoroutine = coroutine.wrap(function()  
                while runLag do  
                    local success, err = pcall(function()  
                        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  
                         bus = GetBus()  
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")  
                    end)  

                    if not success then  
                        warn("Erro ao executar lag loop: " .. tostring(err))  
                        runLag = false  
                        break  
                    end  

                    task.wait(0)
                end  
            end)  
            lagCoroutine()
        end
    end
})

LagToggles = { Phone = false, Bomb = false }

function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        pcall(fireclickdetector, clickDetector)
    end
end
Tablag:AddSection({
    Name = "لاق لابتوب+لاق هاتف"
})
Tablag:AddToggle({
    Name = "لاق بالهاتف(V2)",
    Default = false,
    Callback = function(state)
        LagToggles.Phone = state

        if not state then return end

        local phonePath =
            workspace:FindFirstChild("WorkspaceCom")
            and workspace.WorkspaceCom:FindFirstChild("001_CommercialStores")
            and workspace.WorkspaceCom["001_CommercialStores"]:FindFirstChild("CommercialStorage1")
            and workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1:FindFirstChild("Store")
            and workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store:FindFirstChild("Tools")
            and workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools:FindFirstChild("Iphone")
        if not phonePath then
            local buyButton =
                workspace.WorkspaceCom["001_CommercialStores"]
                .CommercialPlot1Buttons
                .Commercial1Store1

            if buyButton then
                clickNormally(buyButton)
                task.wait(0.2)
            end
        end

        task.spawn(function()
            local player = game.Players.LocalPlayer

            while LagToggles.Phone do
                local char = player.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")

                if not root then
                    task.wait()
                    continue
                end
                if not phonePath or not phonePath.Parent then
                    phonePath =
                        workspace.WorkspaceCom["001_CommercialStores"]
                        .CommercialStorage1.Store.Tools:FindFirstChild("Iphone")
                end

                if phonePath then
                    root.CFrame = phonePath.CFrame

                    for i = 1, 6 do
                        clickNormally(phonePath)
                    end
                end

                task.wait(0.05)
            end
        end)
    end
})
local LaptopLoop = false
Tablag:AddToggle({
    Name = "لاق باللابتوب",
    Default = false,
    Callback = function(state)
        LaptopLoop = state
        if not state then return end

         player = game.Players.LocalPlayer

        task.spawn(function()
            while LaptopLoop do
                 char = player.Character
                 root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then
                    task.wait()
                    continue
                end

                 laptop =
                    workspace.WorkspaceCom["001_CommercialStores"]
                    .CommercialStorage1.Store.Tools.Laptop

             clickDetector = laptop and laptop:FindFirstChild("ClickDetector")

                if laptop and clickDetector then
                    root.CFrame = laptop.CFrame
                    fireclickdetector(clickDetector)
                end

                task.wait(0.05)
            end
        end)
    end
})
Tablag:AddButton({
    Name = "تفعيل متجر الهواتف",
    Callback = function()
         Players = game:GetService("Players")
         Workspace = game:GetService("Workspace")
         player = Players.LocalPlayer


         char = player.Character or player.CharacterAdded:Wait()
         root = char:WaitForChild("HumanoidRootPart")

        root.CFrame = CFrame.new(-130.48, 20.84, 237.21)
        task.wait(0.2)
        local button = Workspace:FindFirstChild("WorkspaceCom")
        if button then
            button = button:FindFirstChild("001_CommercialStores")
            if button then
                button = button:FindFirstChild("CommercialPlot1Buttons")
                if button then
                    button = button:FindFirstChild("Commercial1Store1")
                    if button then
                         clickDet = button:FindFirstChildOfClass("ClickDetector")
                        if clickDet then
                            fireclickdetector(clickDet)
                        end
                    end
                end
            end
        end
    end
})
Tablag:AddParagraph({
    Title = "ملاحظة",
    Text = "انتظر 20 ثانية لظهور تأثير اللاق"
})
Tablag:AddSection("لاق قنابل")
Tablag:AddToggle({
    Name = "لاق قنابل",
    Default = false,
    Callback = function(state)
        LagToggles.Bomb = state
        if state then
             Player = game.Players.LocalPlayer
             Character = Player.Character or Player.CharacterAdded:Wait()
             RootPart = Character:WaitForChild("HumanoidRootPart")
             ReplicatedStorage = game:GetService("ReplicatedStorage")

             Bomb = workspace:FindFirstChild("WorkspaceCom")
                and workspace.WorkspaceCom:FindFirstChild("001_CriminalWeapons")
                and workspace.WorkspaceCom["001_CriminalWeapons"]:FindFirstChild("GiveTools")
                and workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools:FindFirstChild("Bomb")

            if not Bomb or not Bomb:FindFirstChild("ClickDetector") then
                Tablag:AddNotification({
                    Name = "خطأ",
                    Content = "القنبلة غير موجودة!",
                    Time = 5
                })
                return
            end
            task.spawn(function()
                while LagToggles.Bomb and Bomb and RootPart do
                    pcall(function()
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector)
                    end)
                    task.wait(0.0001)
                end
            end)

        
            task.spawn(function()
                while LagToggles.Bomb do
                    pcall(function()
                         VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)

                         args = { [1] = "Bomb" .. Player.Name }
                         BombServer = ReplicatedStorage:FindFirstChild("RE"):FindFirstChild("1Blo1wBomb1sServe1r")
                        if BombServer then
                            BombServer:FireServer(unpack(args))
                        end
                    end)
                    task.wait(1.5)
                end
            end)
        end
    end
})
FireXLoop = false
Tablag:AddToggle({
    Name = "تجميع FireX",
    Default = false,
    Callback = function(state)
        FireXLoop = state
        if not state then return end

        task.spawn(function()
             Players = game:GetService("Players")
             player = Players.LocalPlayer

            while FireXLoop do   
                 char = player.Character or player.CharacterAdded:Wait()
                 root = char:FindFirstChild("HumanoidRootPart")
                if not root then
                    task.wait()
                    continue
                end           
                 fireXPath =
                    workspace.WorkspaceCom["001_DayCare"]
                    .Tools.FireX

                 clickDetector = fireXPath:FindFirstChild("ClickDetector")

                if fireXPath and clickDetector then
                
                    root.CFrame = fireXPath.CFrame
                    
                    fireclickdetector(clickDetector)
                end

                task.wait(0.01)
            end
        end)
    end
})
Tablag:AddParagraph({
    Title = "ملاحظة",
    Text = "انتظر 35 ثانية لظهور تأثير اللاق"
})
LagToggles = { Sniper = false }
Tablag:AddSection("لاق سنايبر")
Tablag:AddToggle({
    Name = "لاق سنايبر",
    Default = false,
    Callback = function(state)
        LagToggles.Sniper = state
        if state then
            Player = game.Players.LocalPlayer
            Character = Player.Character or Player.CharacterAdded:Wait()
            RootPart = Character:WaitForChild("HumanoidRootPart")
             ReplicatedStorage = game:GetService("ReplicatedStorage")

            Sniper =
                workspace:FindFirstChild("WorkspaceCom")
                and workspace.WorkspaceCom:FindFirstChild("001_CriminalWeapons")
                and workspace.WorkspaceCom["001_CriminalWeapons"]:FindFirstChild("GiveTools")
                and workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools:FindFirstChild("Sniper")

            if not Sniper or not Sniper:FindFirstChild("ClickDetector") then
                Tablag:AddNotification({
                    Name = "خطأ",
                    Content = "السنايبر غير موجود!",
                    Time = 5
                })
                return
            end

            task.spawn(function()
                while LagToggles.Sniper and Sniper and RootPart do
                    pcall(function()
                        RootPart.CFrame = Sniper.CFrame
                        fireclickdetector(Sniper.ClickDetector)
                    end)
                    task.wait(0.0001)
                end
            end)


            task.spawn(function()
                while LagToggles.Sniper do
                    pcall(function()
                         VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(0.2)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)

                         sniperRemote =
                            ReplicatedStorage:FindFirstChild("RE")
                            and ReplicatedStorage.RE:FindFirstChild("1Sn1pe1rServe1r")

                        if sniperRemote then
                            sniperRemote:FireServer(Player.Name)
                        end
                    end)
                    task.wait(0.3)
                end
            end)
        end
    end
})

local RbgTab = Window:MakeTab({ Title = "الاسماء و التلوين", Icon = "rbxassetid://10747830374" })
RbgTab:AddSection({ Name = "تلوين الاسم والبابو          ", Icon = "rbxassetid://10709782758" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local NameRemote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eColo1r")

local t = 0
local rainbowSpeed = 2 
local nameRainbow = false
local bioRainbow = false
local nameFast = false
local bioFast = false

local function updateRainbow(dt)
    t += dt
    local speed = rainbowSpeed
    if nameFast then speed = 20 end
    local r = math.sin(t * speed) * 0.5 + 0.5
    local g = math.sin(t * speed + 2) * 0.5 + 0.5
    local b = math.sin(t * speed + 4) * 0.5 + 0.5
    local rainbow = Color3.new(r, g, b)

    if nameRainbow or nameFast then
        NameRemote:FireServer("PickingRPNameColor", rainbow)
    end
    if bioRainbow or bioFast then
        NameRemote:FireServer("PickingRPBioColor", rainbow)
    end
end

RunService.RenderStepped:Connect(function(dt)
    updateRainbow(dt)
end)
RbgTab:AddSlider({
    Name = "سرعة التلوين",
    Min = 0.1,
    Max = 1000,
    Default = 2,
    Increment = 0.1,
    Callback = function(value)
        rainbowSpeed = value
    end
})
RbgTab:AddToggle({
    Name = "تلوين الاسم",
    Default = false,
    Callback = function(state)
        nameRainbow = state
    end
})
RbgTab:AddToggle({
    Name = "تلوين البايو",
    Default = false,
    Callback = function(state)
        bioRainbow = state
    end
})
RbgTab:AddSection({ Name = "زخرفة الاسم والبابو          ", Icon = "rbxassetid://10723345088" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eTex1t")

local selectedBio = ""
local selectedName = ""

RbgTab:AddTextBox({
    Name = "اكتب اي شي هنا في البايو هنا",
    Description = "",
    PlaceholderText = "(اكتب هناا)",
    Callback = function(Value)
        selectedBio = Value
    end
})

RbgTab:AddTextBox({
    Name = "اكتب اي شي هنا في الاسم هنا",
    Description = "",
    PlaceholderText = "(اكتب هناا)",
    Callback = function(Value)
        selectedName = Value
    end
})

local bioTypingLoop = false
local bioBackLoop = false
local nameTypingLoop = false
local nameBackLoop = false

local function AnimateLoop(remoteName, getText, reverseFlag, stateRef)
    task.spawn(function()
        while stateRef() do
            local text = getText()
            if text ~= "" then
                local buffer = ""
                for i = 1, #text do
                    if not stateRef() then return end
                    buffer = string.sub(text, 1, i)
                    Remote:FireServer(remoteName, buffer)
                    task.wait(0.1)
                end

                if reverseFlag then
                    for i = #text, 1, -1 do
                        if not stateRef() then return end
                        buffer = string.sub(text, 1, i)
                        Remote:FireServer(remoteName, buffer)
                        task.wait(0.1)
                    end
                end
            else
                task.wait(0.2)
            end
        end
    end)
end

RbgTab:AddToggle({
    Name = "تشغيل البايو عادي",
    Default = false,
    Callback = function(state)
        bioTypingLoop = state
        if state then
            AnimateLoop("RolePlayBio", function() return selectedBio end, false, function() return bioTypingLoop end)
        end
    end
})

RbgTab:AddToggle({
    Name = "تشغيل البايو سريع",
    Default = false,
    Callback = function(state)
        bioBackLoop = state
        if state then
            AnimateLoop("RolePlayBio", function() return selectedBio end, true, function() return bioBackLoop end)
        end
    end
})

RbgTab:AddToggle({
    Name = "تشغيل الاسم عادي",
    Default = false,
    Callback = function(state)
        nameTypingLoop = state
        if state then
            AnimateLoop("RolePlayName", function() return selectedName end, false, function() return nameTypingLoop end)
        end
    end
})
RbgTab:AddToggle({
    Name = "تشغيل الاسم سريع",
    Default = false,
    Callback = function(state)
        nameBackLoop = state
        if state then
            AnimateLoop("RolePlayName", function() return selectedName end, true, function() return nameBackLoop end)
        end
    end
})
RbgTab:AddSection({ Name = "سبام اسماء          ", Icon = "rbxassetid://10734933966" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

local NameSpamActive = false 
local SpamSpeed = 1
local Name1, Name2, Name3, Name4, Name5 = "", "", "", "", ""

RbgTab:AddTextBox({Name = "الاسم 1", Default = "", TextDisappear = true, Callback = function(v) Name1 = v end})
RbgTab:AddTextBox({Name = "الاسم 2", Default = "", TextDisappear = true, Callback = function(v) Name2 = v end})
RbgTab:AddTextBox({Name = "الاسم 3", Default = "", TextDisappear = true, Callback = function(v) Name3 = v end})
RbgTab:AddTextBox({Name = "الاسم 4", Default = "", TextDisappear = true, Callback = function(v) Name4 = v end})
RbgTab:AddTextBox({Name = "الاسم 5", Default = "", TextDisappear = true, Callback = function(v) Name5 = v end})

RbgTab:AddSlider({
	Name = "سرعة سبام الاسماء",
	Min = 1,
	Max = 150,
	Default = 5,
	Increment = 1,
	Callback = function(v)
		SpamSpeed = v
	end
})
RbgTab:AddToggle({
    Name = "تشغيل سبام الاسماء",
    Default = false,
    Callback = function(state)
        NameSpamActive = state
        if NameSpamActive then
            task.spawn(function()
                while NameSpamActive do
                    local names = {Name1, Name2, Name3, Name4, Name5}
                    for _, name in ipairs(names) do
                        if not NameSpamActive then break end
                        if name ~= "" then
                            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer("RolePlayName", name)
                            task.wait(1 / SpamSpeed)
                        end
                    end
                end
            end)
        end
    end
})
RbgTab:AddSection({ Name = "سبام بايو          ", Icon = "rbxassetid://10734933966" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BioSpamActive = false
local Bio1, Bio2, Bio3, Bio4, Bio5 = "", "", "", "", ""
local SpamSpeed = 1

RbgTab:AddTextBox({Name = "البايو 1", Default = "", TextDisappear = true, Callback = function(v) Bio1 = v end})
RbgTab:AddTextBox({Name = "البايو 2", Default = "", TextDisappear = true, Callback = function(v) Bio2 = v end})
RbgTab:AddTextBox({Name = "البايو 3", Default = "", TextDisappear = true, Callback = function(v) Bio3 = v end})
RbgTab:AddTextBox({Name = "البايو 4", Default = "", TextDisappear = true, Callback = function(v) Bio4 = v end})
RbgTab:AddTextBox({Name = "البايو 5", Default = "", TextDisappear = true, Callback = function(v) Bio5 = v end})

RbgTab:AddSlider({
    Name = "سرعة سبام البايو",
    Min = 1,
    Max = 150,
    Default = 5,
    Increase = 1,
    Callback = function(v)
        SpamSpeed = v
    end
})
RbgTab:AddToggle({
    Name = "تشغيل سبام البايو",
    Default = false,
    Callback = function(state)
        BioSpamActive = state
        if state then
            task.spawn(function()
                while BioSpamActive do
                    for _, bio in ipairs({Bio1, Bio2, Bio3, Bio4, Bio5}) do
                        if not BioSpamActive then break end
                        if bio ~= "" then
                            pcall(function()
                                ReplicatedStorage:WaitForChild("RE")
                                    :WaitForChild("1RPNam1eTex1t")
                                    :FireServer("RolePlayBio", bio)
                            end)
                            task.wait(1 / SpamSpeed)
                        end
                    end
                end
            end)
        end
    end
})

local Section = RbgTab:AddSection({"التلوينات"})

RbgTab:AddSection({ Name = "تلوين الادوات          ", Icon = "rbxassetid://10734950309" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local re = ReplicatedStorage:WaitForChild("RE")
local running = false
local ToolName = "BabyRattle"

local Tools = {
    ["حق الطلاء"] = "PaintRoller",
    ["حمرة"] = "Lipstick",
    ["قوس حق الاسهم"] = "Bow",
    ["راديو الاغاني"] = "Boombox",
    ["تارموس"] = "Thermos",
    ["دونات"] = "Donut",
    ["مشط حق الاحصنة"] = "HorseBrush",
    ["عصي"] = "GlowingBatons",
    ["مكبر صوت"] = "Megaphone",
    ["شمعة"] = "Candle",
    ["مشعل"] = "GuardTorch",
    ["لعبة الاطفال"] = "BabyRattle"
}

local function equipTool(name)
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local tool = player.Backpack:WaitForChild(name,2)
    if tool then
        tool.Parent = char
        hum:EquipTool(tool)
    end
    return tool
end

local function hsv(t)
    return Color3.fromHSV(t % 1, 1, 1) 
end
RbgTab:AddDropdown({
    Name = "اختيار الاداة",
    Default = "لعبة الاطفال",
    Options = {"حق الطلاء","حمرة","قوس حق الاسهم","راديو الاغاني","تارموس","دونات","مشط حق الاحصنة","عصي","مكبر صوت","شمعة","مشعل","لعبة الاطفال"},
    Callback = function(value)
        ToolName = Tools[value]
    end
})
RbgTab:AddToggle({
    Name = "تلوين الاداة",
    Default = false,
    Callback = function(state)
        running = state
        if not state then return end

        task.spawn(function()
            re:WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
            task.wait(0.2)
            re:WaitForChild("1Too1l"):InvokeServer("PickingTools",ToolName)
            task.wait(0.3)

            local tool = equipTool(ToolName)
            if not tool then return end

            local setColor =
                player.PlayerGui
                :WaitForChild("ToolGui")
                :WaitForChild("ToolSettings")
                :WaitForChild("Settings")
                :WaitForChild("PropsColor")
                :WaitForChild("SetColor")

            local hue = 0
            local current = hsv(0)

            local conn
            conn = RunService.RenderStepped:Connect(function(dt)
                if not running then
                    conn:Disconnect()
                    return
                end
                hue += dt * 0.3 
                local target = hsv(hue)
                current = current:Lerp(target, dt * 5) 
                setColor:FireServer(current)
            end)
        end)
    end
})
RbgTab:AddSection({ Name = "تلوين الشعر          ", Icon = "rbxassetid://10734939942" })
local hairColors = {
    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),
    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)
}
local isActive = false

local function changeHairColor()
    local i = 1
    while isActive do
        if not isActive then break end
        local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Max1y"):FireServer(unpack(args))
        wait(0.1)
        i = i % #hairColors + 1
    end
end

RbgTab:AddToggle({
    Name = "تلوين الشعر",
    Description = "",
    Default = false,
    Callback = function(value)
        isActive = value
        if isActive then
            changeHairColor()
        end
    end
})
RbgTab:AddSection({ Name = "تلوين الجسم          ", Icon = "rbxassetid://10709782758" })
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local ChangeBodyColor = Remotes:WaitForChild("ChangeBodyColor")

local colors = {
	"Pastel brown", "Pastel yellow", "Pastel blue", "Pastel green", "Pastel pink",
	"Really red", "Bright orange", "Bright blue", "Bright violet", "Bright green",
	"Bright yellow", "White", "Black", "Dark stone grey", "Medium stone grey",
	"Light stone grey", "Bright red", "Bright yellowish green", "Bright bluish green",
	"Bright purple", "Bright pink", "Reddish brown", "Earth green", "Sand red",
	"Sand blue", "Sand green", "Dark green", "Navy blue", "Toothpaste", "Cyan",
	"Hot pink", "Crimson", "Royal purple", "Neon orange", "Neon green", "Neon pink",
	"Neon blue", "Gold", "Bright gold", "New Yeller", "Dark orange", "Deep blue",
	"Maroon", "Bright maroon"
}

local rainbowEnabled = false
local spinEnabled = false

RbgTab:AddToggle({
	Name = "تلوين الجسم ",
	Default = false,
	Callback = function(v)
		rainbowEnabled = v
		if v then
			task.spawn(function()
				while rainbowEnabled do
					for _, color in ipairs(colors) do
						if not rainbowEnabled then break end
						ChangeBodyColor:FireServer(color)
						task.wait(0.3)
					end
				end
			end)
		end
	end
})
local rgbSpeed = 1

RbgTab:AddSlider({
    Name = "سرعة التلوين",
    Description = "",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 3,
    Callback = function(Value)
        rgbSpeed = Value
    end
})
local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5 -- gira o hue suavemente de 0 a 1
    return Color3.fromHSV(h, 1, 1)
end

local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

--[[local Section = RbgTab:AddSection({""})

local nameBioRGBActive = false
RbgTab:AddToggle({
    Name = "",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ToggleCorpo = RbgTab:AddToggle({
    Name = "",
    Description = "",
    Default = false
})
ToggleCorpo:Callback(function(Value)
    getgenv().rgbCorpo = Value
    task.spawn(function()
        while getgenv().rgbCorpo do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remote and remote:FindFirstChild("ChangeBodyColor") then
                pcall(function()
                    remote.ChangeBodyColor:FireServer({
                        BrickColor.new(getRainbowColor(rgbSpeed))
                    })
                end)
            end
            task.wait(0.1)
        end
    end)
end)
local ToggleCabelo = RbgTab:AddToggle({
    Name = "",
    Description = "",
    Default = false
})
ToggleCabelo:Callback(function(Value)
    getgenv().rgbCabelo = Value
    task.spawn(function()
        while getgenv().rgbCabelo do
            fireServer("1Max1y", {
                "ChangeHairColor2",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.5)
        end
    end)
end)



local Section = RbgTab:AddSection({""})



local ToggleCasa = RbgTab:AddToggle({
    Name = "",
    Description = "",
    Default = false
})
ToggleCasa:Callback(function(Value)
    getgenv().rgbCasa = Value
    task.spawn(function()
        while getgenv().rgbCasa do
            fireServer("1Player1sHous1e", {
                "ColorPickHouse",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)
 
local carRGBActive = false
RbgTab:AddToggle({
    Name = "",
    Description = "",
    Default = false,
    Callback = function(state)
        carRGBActive = state
        if state then
            task.spawn(function()
                while carRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1Player1sCa1r", { "PickingCarColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})
]] 
local ToggleBicicleta = RbgTab:AddToggle({
    Name = "تلوين سكوتر مال الاغاني او الدراجة",
    Description = "",
    Default = false
})
ToggleBicicleta:Callback(function(Value)
    getgenv().rgbBicicleta = Value
    task.spawn(function()
        while getgenv().rgbBicicleta do
            fireServer("1Player1sCa1r", {
                "NoMotorColor",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)

Section1 = Window:MakeTab({
    Title = "الأغراض",
    Icon = "rbxassetid://10723415903"
})

Section1:AddSection("الأغراض")

function PickTool(n)
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", n)
end

function ClearAllProps()
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllProps")
end

function ClearAllTools()
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")
end

for _,v in pairs({
    {"اخذ كنبة","Couch"},
    {"اخذ كيس ناري","PaperbagFire"},
    {"اخذ ايباد","Ipad"},
    {"سنايبر","Sniper"},
    {"سيف","SwordWood"},
    {"قوس","Bow"},
    {"Glouk مسدس","Glock"},
    {"اخذ قنبلة","Bomb"},
    {"سنايبر ريفيل","Assault"}
}) do
    Section1:AddButton({
        Name = v[1],
        Callback = function()
            PickTool(v[2])
        end
    })
end

Section1:AddButton({
    Name = "حذف كل الاغراض",
    Callback = function()
        ClearAllProps()
    end
})

Section1:AddSection("أغراض البنك")

for _,v in pairs({
    {"حقيبة بيتكوين","DuffleBagBitcoin"},
    {"حقيبة الماس","DuffleBagDiamonds"},
    {"حقيبة ذهب","DuffleBagGold"},
    {"بطاقة صفراء","BankGateKey"},
    {"بطاقة بيضاء","KeyCardWhite"}
}) do
    Section1:AddButton({
        Name = v[1],
        Callback = function()
            PickTool(v[2])
        end
    })
end

Section1:AddButton({
    Name = "حذف كل الاغراض",
    Callback = function()
        ClearAllTools()
    end
})
Section1:AddButton({
    Name = "انتقال فوري (يعمل بالنقر)",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Mouse = Player:GetMouse()

        local Tool = Instance.new("Tool")
        Tool.Name = "Click TP"
        Tool.RequiresHandle = false
        Tool.Parent = Player.Backpack

        Tool.Activated:Connect(function()
            local Pos = Mouse.Hit.p + Vector3.new(0, 2.5, 0)
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Pos)
            end
        end)
    end
})


TabSp = Window:MakeTab({
    Title = "تدبيل و سبام",
    Icon = "rbxassetid://10723415903"
})
TabSp:AddToggle({
    Name = "تدبيل قوارب",
    Default = false,
    Callback = function(enabled)
        if enabled then
            -- تشغيل سكربت التدبيل
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local LocalPlayer = Players.LocalPlayer

            _G.CanoeToggleRunning = true
            _G.CanoeUsed = {}

            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HRP = char:WaitForChild("HumanoidRootPart")
            local Humanoid = char:WaitForChild("Humanoid")

            -- حفظ الموقع الحالي للعودة إليه لاحقاً
            _G.CanoeSavedPos = HRP.CFrame

            local Button = Workspace.WorkspaceCom["001_CanoeCloneButton"].Button
            local ClickDetector = Button.ClickDetector
            local Storage = Workspace.WorkspaceCom["001_CanoeStorage"]

            local minX, maxX = -75.40, 24.75
            local minZ, maxZ = -21.44, 50.41
            local fixedY = 4.51

            task.spawn(function()
                while _G.CanoeToggleRunning do
                    local canoe = nil

                    for _, v in ipairs(Storage:GetChildren()) do
                        if v.Name == "Canoe" and not _G.CanoeUsed[v] then
                            canoe = v
                            break
                        end
                    end

                    if not canoe then
                        HRP.CFrame = Button.CFrame * CFrame.new(0, 2, 0)
                        task.wait(0.25)
                        fireclickdetector(ClickDetector)
                        task.wait(0.4)
                    else
                        local seat = canoe:FindFirstChildWhichIsA("VehicleSeat", true)
                        if seat then
                            HRP.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait(0.3)

                            seat:Sit(Humanoid)
                            task.wait(0.6)

                            local randX = math.random() * (maxX - minX) + minX
                            local randZ = math.random() * (maxZ - minZ) + minZ

                            seat.CFrame = CFrame.new(randX, fixedY, randZ)

                            task.wait(0.3)

                            seat:Sit(nil)
                            task.wait(0.1)

                            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            _G.CanoeUsed[canoe] = true
                        end
                    end
                    task.wait(0.5)
                end
            end)

        else
            -- إيقاف السكربت والعودة للموقع السابق
            _G.CanoeToggleRunning = false
            task.wait(0.3)

            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local char = LocalPlayer.Character

            if char and _G.CanoeSavedPos then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = _G.CanoeSavedPos
                end
            end
        end
    end
})

-- المتغيرات الإضافية في الأخير
duplicarAtivo = false
duplicarThread = nil

TabSp:AddToggle({
    Name = "اخذ قنابل",
    Default = false,
    Callback = function(v)
        duplicarAtivo = v
        if duplicarAtivo then
            duplicarThread = task.spawn(function()
                 Player = game.Players.LocalPlayer
                 Character = Player.Character or Player.CharacterAdded:Wait()
                 RootPart = Character:WaitForChild("HumanoidRootPart")
                 OldPos = RootPart.CFrame

                 Bomb = game:GetService("Workspace"):FindFirstChild("WorkspaceCom")
                    and game:GetService("Workspace").WorkspaceCom["001_CriminalWeapons"]:FindFirstChild("GiveTools")
                    and game:GetService("Workspace").WorkspaceCom["001_CriminalWeapons"].GiveTools:FindFirstChild("Bomb")

                if not Bomb or not Bomb:FindFirstChild("ClickDetector") then
                    warn("Erro ao encontrar a Bomb! Tente novamente.")
                    duplicarAtivo = false
                    return
                end

                while duplicarAtivo do
                    for i = 1, 12 do
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector)
                        task.wait(0)
                    end
                    task.wait(0.001)
                end

                RootPart.CFrame = OldPos
            end)
        end
    end
})
TabSp:AddToggle({
    Name = "سبام تفجير قنابل",
    Default = false,
    Callback = function(spam)
        if spam then
            task.spawn(function()
                local playerName = game.Players.LocalPlayer.Name
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local VirtualInputManager = game:GetService("VirtualInputManager")

                while spam do
                    pcall(function()
                        local args = {[1] = "Bomb" .. playerName}
                        ReplicatedStorage:WaitForChild("RE")
                            :WaitForChild("1Blo1wBomb1sServe1r")
                            :FireServer(unpack(args))
                    end)

                    pcall(function()
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0)
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0)
                    end)

                    task.wait(0.1)
                end
            end)
        end
    end
})
TabSp:AddSection({"مسك الاغراض"})
TabSp:AddButton({
  Name = "مسك جميع الاغراض",
  Callback = function()
    local function equiptool()
  for i,v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
      v.Parent = game.Players.LocalPlayer.Character
    end
  end
end
equiptool()
  end
})
TabSp:AddSection({"الاشكال والمباني"})
SelectedTool = "Laptop"
Shape = "دائرة"
Radius = 15
Height = 20
 CollectedTools = {}
 ToolOffsets = {}
TabSp:AddTextBox({
    Name = "المسافة",
    Default = tostring(Radius),
    TextDisappear = false,
    Callback = function(v)
        local n = tonumber(v)
        if n then Radius = math.abs(n) end
    end
})
TabSp:AddTextBox({
    Name = "الارتفاع",
    Default = tostring(math.abs(Height)),
    TextDisappear = false,
    Callback = function(v)
        local n = tonumber(v)
        if n then
            Height = -math.abs(n)
            for tool, offset in pairs(ToolOffsets) do
                tool.GripPos = Vector3.new(offset.X, Height, offset.Z)
                ToolOffsets[tool] = Vector3.new(offset.X, Height, offset.Z)
            end
        end
    end
})
TabSp:AddDropdown({
    Name = "الاداة",
    Options = {"Laptop", "Iphone", "FireX"},
    Default = SelectedTool,
    Callback = function(v) SelectedTool = v end
})
TabSp:AddDropdown({
    Name = "الشكل",
    Options = {"دائرة", "مكعب", "كرة", "جناح"},
    Default = Shape,
    Callback = function(v) Shape = v end
})
function getTools()
     char = player.Character or player.CharacterAdded:Wait()
     backpack = player:WaitForChild("Backpack")
     tools = {}
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("Tool") and v.Name == SelectedTool then
            table.insert(tools, v)
        end
    end
    for _, v in pairs(backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == SelectedTool then
            table.insert(tools, v)
        end
    end
    return tools
end

 function organizarItens()
     char = player.Character or player.CharacterAdded:Wait()
     root = char:WaitForChild("HumanoidRootPart")
     head = char:FindFirstChild("Head") or root
     tools = getTools()
    if #tools == 0 then return end

    CollectedTools = tools
    ToolOffsets = {}

     center = head.Position
     count = #tools
    if Shape == "دائرة" then
         step = (2 * math.pi) / count
        for i, tool in ipairs(tools) do
             angle = step * (i - 1)
             offset = Vector3.new(
                math.cos(angle) * Radius,
                Height,
                math.sin(angle) * Radius
            )
            tool.Parent = char
            tool.GripPos = offset
            tool.Parent = player.Backpack
            ToolOffsets[tool] = offset
        end

    elseif Shape == "مكعب" then
         s = math.ceil(count ^ (1/3))
         gap = (Radius * 2) / math.max(s - 1, 1)
         idx = 1
        for x = 0, s - 1 do
            for y = 0, s - 1 do
                for z = 0, s - 1 do
                    if idx > count then break end
                     offset = Vector3.new(
                        -Radius + x * gap,
                        -Radius + y * gap + Height,
                        -Radius + z * gap
                    )
                     tool = tools[idx]
                    tool.Parent = char
                    tool.GripPos = offset
                    tool.Parent = player.Backpack
                    ToolOffsets[tool] = offset
                    idx += 1
                end
            end
        end

    elseif Shape == "كرة" then
         idx = 1
         stepA = math.pi / math.ceil(count^(1/2))
        local stepB = (2 * math.pi) / math.ceil(count^(1/2))
        for a = 0, math.pi, stepA do
            for b = 0, 2 * math.pi, stepB do
                if idx > count then break end
                 offset = Vector3.new(
                    math.sin(a) * math.cos(b) * Radius,
                    math.cos(a) * Radius + Height,
                    math.sin(a) * math.sin(b) * Radius
                )
                 tool = tools[idx]
                tool.Parent = char
                tool.GripPos = offset
                tool.Parent = player.Backpack
                ToolOffsets[tool] = offset
                idx += 1
            end
        end
    elseif Shape == "جناح" then
         half = math.ceil(count / 2)
        for i, tool in ipairs(tools) do
             side = (i <= half) and -1 or 1
             idx = (side == -1) and i or (i - half)
             angle = math.rad(idx * 12)
             offset = Vector3.new(
                math.cos(angle) * Radius * side,
                math.sin(angle) * Radius + Height,
                -idx * 1.2
            )
            tool.Parent = char
            tool.GripPos = offset
            tool.Parent = player.Backpack
            ToolOffsets[tool] = offset
        end
    end
end

TabSp:AddButton({
    Name = "تفعيل الشكل",
    Callback = organizarItens
})
 OrbitToggle = false
 OrbitAngle = 0
TabSp:AddToggle({
    Name = "دوران الأدوات",
    Default = false,
    Callback = function(state)
        OrbitToggle = state
        if not state then return end
        task.spawn(function()
            while OrbitToggle do
                 char = player.Character
                 root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then task.wait() continue end
                OrbitAngle += math.rad(2)
                 rot = CFrame.Angles(0, OrbitAngle, 0)

                for tool, offset in pairs(ToolOffsets) do
                    if tool then
                        local rotated = rot * Vector3.new(offset.X, 0, offset.Z)
                        tool.GripPos = Vector3.new(
                            rotated.X,
                            offset.Y,
                            rotated.Z
                        )
                    end
                end

                task.wait(0.03)
            end
        end)
    end
})
LaptopLoop = false
TabSp:AddToggle({
    Name = "تجميع لابتوب",
    Default = false,
    Callback = function(state)
        LaptopLoop = state
        if not state then return end
        task.spawn(function()
            while LaptopLoop do
                 char = player.Character
                 root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then task.wait() continue end
                 laptop = workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Laptop
                 clickDetector = laptop and laptop:FindFirstChild("ClickDetector")
                if laptop and clickDetector then
                    root.CFrame = laptop.CFrame
                    fireclickdetector(clickDetector)
                end
                task.wait(0.1)
            end
        end)
    end
})
FireXLoop = false
TabSp:AddToggle({
    Name = "تجميع FireX",
    Default = false,
    Callback = function(state)
        FireXLoop = state
        if not state then return end

        task.spawn(function()
             Players = game:GetService("Players")
             player = Players.LocalPlayer

            while FireXLoop do
              
                 char = player.Character or player.CharacterAdded:Wait()
                 root = char:FindFirstChild("HumanoidRootPart")

                if not root then
                    task.wait()
                    continue
                end

                
                 fireXPath =
                    workspace.WorkspaceCom["001_DayCare"]
                    .Tools.FireX

                 clickDetector = fireXPath:FindFirstChild("ClickDetector")

                if fireXPath and clickDetector then
                
                    root.CFrame = fireXPath.CFrame
                    
                    fireclickdetector(clickDetector)
                end

                task.wait(0.01)
            end
        end)
    end
})

LocalPlayer = Players.LocalPlayer

HouseTab = Window:MakeTab({"بيت", "home"})

SelectHouse = nil
NoclipDoor = nil
HouseDropdown = nil

function GetHouseList()
    list = {}
    lots = Workspace:FindFirstChild("001_Lots")
    if lots then
        for _, house in ipairs(lots:GetChildren()) do
            if house.Name ~= "For Sale" and house:IsA("Model") then
                table.insert(list, house.Name)
            end
        end
    end
    table.sort(list)
    return list
end

HouseDropdown = HouseTab:AddDropdown({
    Name = "اختيار بيت",
    Options = GetHouseList(),
    Default = "...",
    MultSelect = false,
    Callback = function(Value)
        SelectHouse = Value
        if NoclipDoor then
            NoclipDoor:Set(false)
        end
    end
})

function UpdateHouseDropdown()
    if HouseDropdown then
        HouseDropdown:Set(GetHouseList())
        SelectHouse = nil
        HouseDropdown:SetValue("")
    end
end

HouseTab:AddButton({
    Name = "تحديث قائمة البيوت",
    Callback = function()
        UpdateHouseDropdown()
    end
})

HouseTab:AddButton({
    Name = "انتقال للبيت",
    Callback = function()
        if SelectHouse then
            house = Workspace["001_Lots"]:FindFirstChild(SelectHouse)
            if house and LocalPlayer.Character then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(house.WorldPivot.Position)
            end
        end
    end
})

HouseTab:AddButton({
    Name = "انتقال للخزنة",
    Callback = function()
        if SelectHouse then
            house = Workspace["001_Lots"]:FindFirstChild(SelectHouse)
            if house and house:FindFirstChild("HousePickedByPlayer") and LocalPlayer.Character then
                safe = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe")
                if safe then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)
                end
            end
        end
    end
})

NoclipDoor = HouseTab:AddToggle({
    Name = "اختراق الباب",
    Default = false,
    Callback = function(Value)
        if SelectHouse then
            house = Workspace["001_Lots"]:FindFirstChild(SelectHouse)
            if house and house:FindFirstChild("HousePickedByPlayer") then
                doors = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")
                if doors and doors:FindFirstChild("HouseDoorFront") then
                    for _, base in ipairs(doors.HouseDoorFront:GetChildren()) do
                        if base:IsA("BasePart") then
                            base.CanCollide = not Value
                        end
                    end
                end
            end
        end
    end
})

HouseTab:AddToggle({
    Name = "شغل الجرس",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDoorbell = Value
        spawn(function()
            while getgenv().AutoDoorbell do
                if SelectHouse then
                    house = Workspace["001_Lots"]:FindFirstChild(SelectHouse)
                    if house and house:FindFirstChild("HousePickedByPlayer") then
                        doorbell = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")
                        if doorbell and doorbell:FindFirstChild("TouchBell") then
                            pcall(function()
                                fireclickdetector(doorbell.TouchBell.ClickDetector)
                            end)
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

HouseTab:AddToggle({
    Name = "طرق الباب",
    Default = false,
    Callback = function(Value)
        getgenv().AutoKnockDoor = Value
        spawn(function()
            while getgenv().AutoKnockDoor do
                if SelectHouse then
                    house = Workspace["001_Lots"]:FindFirstChild(SelectHouse)
                    if house and house:FindFirstChild("HousePickedByPlayer") then
                        doors = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")
                        if doors and doors:FindFirstChild("HouseDoorFront") and doors.HouseDoorFront:FindFirstChild("Knock") then
                            pcall(function()
                                fireclickdetector(doors.HouseDoorFront.Knock.TouchBell.ClickDetector)
                            end)
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

Section = HouseTab:AddSection({"سبام بيتك"})  

loopSpeed = 0.2

speedSlider = HouseTab:AddSlider({
    Name = "السرعة",
    MinValue = 0.05,
    MaxValue = 1,
    Default = loopSpeed,
    Increase = 0.01,
    Callback = function(v)
        loopSpeed = v
    end
})

HouseTab:AddToggle({
    Name = "تلوين البيت",
    Default = false,
    Callback = function(state)
        colors = {
            Color3.new(1, 0, 0),
            Color3.new(0, 1, 0),
            Color3.new(0, 0, 1),
            Color3.new(1, 1, 0),
            Color3.new(0, 1, 1),
            Color3.new(1, 0, 1)
        }
        isHouseRGBActive = state
        replicatedStorage = game:GetService("ReplicatedStorage")
        remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")
        if not remoteEvent then return end
        spawn(function()
            while isHouseRGBActive do
                for _, color in ipairs(colors) do
                    if not isHouseRGBActive then return end
                    pcall(function()
                        remoteEvent:FireServer("ColorPickHouse", color)
                    end)
                    task.wait(loopSpeed)
                end
            end
        end)
    end
})

HouseRemote = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e")

toggleLock = false
toggleBaby = false
toggleCurtains = false
toggleGarage = false

HouseTab:AddToggle({
    Name = "قفل الأبواب",
    Default = false,
    Callback = function(v)
        toggleLock = v
        task.spawn(function()
            while toggleLock do
                HouseRemote:FireServer("LockDoors")
                task.wait(loopSpeed)
            end
        end)
    end
})

HouseTab:AddToggle({
    Name = "وضع الأطفال",
    Default = false,
    Callback = function(v)
        toggleBaby = v
        task.spawn(function()
            while toggleBaby do
                HouseRemote:FireServer("BabyOptionYes")
                task.wait(loopSpeed)
            end
        end)
    end
})

HouseTab:AddToggle({
    Name = "الستائر",
    Default = false,
    Callback = function(v)
        toggleCurtains = v
        task.spawn(function()
            while toggleCurtains do
                HouseRemote:FireServer("Curtains")
                task.wait(loopSpeed)
            end
        end)
    end
})

HouseTab:AddToggle({
    Name = "باب الكراج",
    Default = false,
    Callback = function(v)
        toggleGarage = v
        task.spawn(function()
            while toggleGarage do
                HouseRemote:FireServer("GarageDoor")
                task.wait(loopSpeed)
            end
        end)
    end
})

CarTab = Window:MakeTab({"السيارة", "rbxassetid://10723415903"})

spammingHeadLights = false
spammingHazardLights = false
spammingHorn = false

ReplicatedStorage = game:GetService("ReplicatedStorage")

function spamHeadLights()
    while spammingHeadLights do
        ReplicatedStorage.Remotes.ToggleHeadLights:InvokeServer()
        wait(0.1)
    end
end

function spamHazardLights()
    while spammingHazardLights do
        ReplicatedStorage.Remotes.ToggleHazardLights:InvokeServer()
        wait(0.1)
    end
end
function spamPlayHorn()
    while spammingHorn do
        ReplicatedStorage.Remotes.PlayHorn:InvokeServer()
        wait(0.1)
    end
end


CarTab:AddSection({ "السبام" })
CarTab:AddToggle({
    Name = "تلوين السيارة",
    Default = false,
    Callback = function(state)
        isColorChanging = state
        if isColorChanging then
            colorChangeCoroutine = coroutine.create(changeCarColor)
            coroutine.resume(colorChangeCoroutine)
        end
    end
})

CarTab:AddToggle({
    Name = "سبام اضواء سيارة",
    Default = false,
    Callback = function(value)
        spammingHeadLights = value
        if spammingHeadLights then
            spawn(spamHeadLights)
        else
            wait(0.2)
            ReplicatedStorage.Remotes.ToggleHeadLights:InvokeServer()
        end
    end
})

CarTab:AddToggle({
    Name = "سبام اشارات السيارة",
    Default = false,
    Callback = function(value)
        spammingHazardLights = value
        if spammingHazardLights then
            spawn(spamHazardLights)
        else

            wait(0.2)
            ReplicatedStorage.Remotes.ToggleHazardLights:InvokeServer()
        end
    end
})

CarTab:AddToggle({
    Name = "سبام هورن(بوري)",
    Default = false,
    Callback = function(value)
        spammingHorn = value
        if spammingHorn then
            spawn(spamPlayHorn)
        else
            ReplicatedStorage.Remotes.StopHorn:InvokeServer()
        end
    end
})


CarTab:AddSection({ "سرعة السيارة & التيربو" })

local speedValue = 200
local turboValue = 11.3

function getAllCars()
    local cars = {}
    if workspace.Vehicles then
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle:FindFirstChild("Seats") and vehicle.Seats:FindFirstChild("VehicleSeat") then
                table.insert(cars, vehicle)
            end
        end
    end
    return cars
end

function applyToAllCars(valueType, value)
    cars = getAllCars()
    carsModified = 0
    
    if #cars == 0 then
        print(" لايوجد سيارات يا مدري مين!")
        return
    end
    
    for _, vehicle in pairs(cars) do
        vehicleSeat = vehicle.Seats.VehicleSeat
        print(" : " .. vehicle.Name)
        
        print(" VehicleSeat:")
        for _, child in pairs(vehicleSeat:GetChildren()) do
            print("  - " .. child.Name .. " (" .. child.ClassName .. ")")
        end
        
        targetObj = vehicleSeat:FindFirstChild(valueType)
        
        if targetObj then
            print(" Encontrou " .. valueType .. " (" .. targetObj.ClassName .. ")")
            
            if targetObj:IsA("NumberValue") then
                targetObj.Value = value
                carsModified = carsModified + 1
                print(" " .. valueType .. " (NumberValue) alterado para " .. value)
            elseif targetObj:IsA("IntValue") then
                targetObj.Value = value
                carsModified = carsModified + 1
                print(" " .. valueType .. " (IntValue) alterado para " .. value)
            elseif targetObj:IsA("StringValue") then
                targetObj.Value = tostring(value)
                carsModified = carsModified + 1
                print(" " .. valueType .. " (StringValue) alterado para " .. value)
            else
                print(" " .. valueType .. "  " .. targetObj.ClassName)
            
                pcall(function()
                    targetObj.Value = value
                    carsModified = carsModified + 1
                    print(" " .. valueType .. " alterado diretamente para " .. value)
                end)
            end
        else
            print(" " .. valueType .. " VehicleSeat")
            
            success = pcall(function()
                if valueType == "MaxSpeed" then
                    vehicleSeat.MaxSpeed = value
                elseif valueType == "Turbo" then
                    vehicleSeat.Turbo = value
                end
                carsModified = carsModified + 1
                print(" " .. valueType .. " (propriedade VehicleSeat) alterado para " .. value)
            end)
            
            if not success then
                print(" Falha ao alterar " .. valueType .. " como propriedade")
            end
        end
    end
    
    print(" : " .. carsModified)
end
CarTab:AddTextBox({
    Name = "سرعة السيارة",
    Description = "لسرعات عالية تحتاج قيمباس",
    PlaceholderText = "200",
    Callback = function(Value)
        numValue = tonumber(Value)
        if numValue then
            speedValue = numValue
            print(" Velocidade definida para: " .. speedValue)
        else
            print(" Erro:")
        end
    end
})

CarTab:AddTextBox({
    Name = "رقم التيربو",
    Description = "",
    PlaceholderText = "11.3",
    Callback = function(Value)
        numValue = tonumber(Value)
        if numValue then
            turboValue = numValue
            print(" Turbo definido para: " .. turboValue)
        else
            print(" Erro: ")
        end
    end
})
CarTab:AddButton({
    Name = "تفعيل السرعة",
    Description = "ماتحتاج قيم باس",
    Callback = function()
        print("  " .. speedValue .. " ...")
        applyToAllCars("MaxSpeed", speedValue)
    end
})

CarTab:AddButton({
    Name = "تطبيق التيربو",
    Description = "",
    Callback = function()
        print(" " .. turboValue .. " ...")
        applyToAllCars("Turbo", turboValue)
    end
})

print("")

CarTab:AddSection({ "سحب السيارات & قتل السيارات" })
Players = game:GetService("Players")
Workspace = game:GetService("Workspace")
LocalPlayer = Players.LocalPlayer
Camera = Workspace.CurrentCamera
VehiclesFolder = Workspace:WaitForChild("Vehicles")

function GetCarPart(model)
for _, p in ipairs(model:GetDescendants()) do
if p:IsA("BasePart") then
return p
end
end
end

function GetCars()
list = {}
for _, v in ipairs(VehiclesFolder:GetChildren()) do
if v.Name:match("Car$") then
table.insert(list, v.Name)
end
end
return list
end

SelectedCar = nil
SavedCameraSubject = nil
CarDropdown = nil

CarDropdown = CarTab:AddDropdown({
Name = "اختار سيارة",
Options = GetCars(),
Default = {},
MultSelect = false,
Callback = function(v)
SelectedCar = v
end
})

function UpdateDropdown()
cars = GetCars()
if CarDropdown then
CarDropdown:Set(cars)
SelectedCar = nil
CarDropdown:SetValue("")
end
end

CarTab:AddButton({
Name = "تحديث السيارات",
Callback = function()
UpdateDropdown()
end
})

CarTab:AddToggle({
Name = "مشاهدة السيارة (Spectate)",
Default = false,
Callback = function(state)
if state then
if not SelectedCar then return warn("اختر سيارة أولاً.") end
car = VehiclesFolder:FindFirstChild(SelectedCar)
if not car then return end
part = GetCarPart(car)
if not part then return end
SavedCameraSubject = Camera.CameraSubject
Camera.CameraSubject = part
else
if SavedCameraSubject then
Camera.CameraSubject = SavedCameraSubject
SavedCameraSubject = nil
end
end
end
})

CarTab:AddButton({
Name = "الانتقال إلى السيارة",
Callback = function()
if not SelectedCar then return warn("اختر سيارة أولاً.") end
car = VehiclesFolder:FindFirstChild(SelectedCar)
if not car then return end
part = GetCarPart(car)
if not part then return end
char = LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
end
end
})

methodKill = nil

CarTab:AddDropdown({
Name = "اختار طريقة فلنق",
Options = {"باص", "كرة"},
Default = "",
Callback = function(v)
methodKill = v
end
})

CarTab:AddButton({
Name = "فلنق السيارة",
Callback = function()
if not SelectedCar then return warn("اختر سيارة أولاً!") end
car = workspace.Vehicles:FindFirstChild(SelectedCar)
if not car then return warn("السيارة غير موجودة.") end
if methodKill == "كرة" then
FlingBall(car)
elseif methodKill == "باص" then
BusAttack(car)
else
warn("اختر طريقة القتل أولاً!")
end
end
})

function FlingBall(targetCar)
player = Players.LocalPlayer
character = player.Character or player.CharacterAdded:Wait()
humanoid = character:WaitForChild("Humanoid")
hrp = character:WaitForChild("HumanoidRootPart")
backpack = player:WaitForChild("Backpack")
ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

function GetBall()
if not backpack:FindFirstChild("SoccerBall") then
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
end
repeat task.wait() until backpack:FindFirstChild("SoccerBall")
backpack.SoccerBall.Parent = character
repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
character.SoccerBall.Parent = backpack
return ServerBalls:FindFirstChild("Soccer" .. player.Name)
end

Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
Ball.CanCollide = false
Ball.Massless = true
Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

tpart = nil
for _, v in ipairs(targetCar:GetDescendants()) do
if v:IsA("BasePart") then
tpart = v
break
end
end
if not tpart then return end

bvExist = Ball:FindFirstChildWhichIsA("BodyVelocity")
if bvExist then bvExist:Destroy() end

bv = Instance.new("BodyVelocity")
bv.Name = "FlingPower"
bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.P = 9e900
bv.Parent = Ball

repeat
Ball.CFrame = tpart.CFrame
Ball.Orientation += Vector3.new(45, 60, 30)
task.wait(1/6000)
until not targetCar.Parent

workspace.CurrentCamera.CameraSubject = humanoid
end

function BusAttack(targetCar)
ReplicatedStorage = game:GetService("ReplicatedStorage")
Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer
RunService = game:GetService("RunService")
character = LocalPlayer.Character
humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return end

function GetBus()
vehicles = workspace:FindFirstChild("Vehicles")
return vehicles and vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
end

bus = GetBus()
if not bus then
humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
task.wait(0.5)
re = ReplicatedStorage:FindFirstChild("RE")
if re and re:FindFirstChild("1Ca1r") then
re["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
end
task.wait(1)
bus = GetBus()
end
if not bus then return end

seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
if seat and character:FindFirstChild("Humanoid") then
repeat
humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
task.wait(0.3)
until character.Humanoid.Sit or not bus.Parent

for _, v in pairs(bus.Body:GetChildren()) do
if v:IsA("Seat") then
v.CanTouch = false
end
end
end

function TrackCar()
while bus and targetCar.Parent do
tpart = nil
for _, p in ipairs(targetCar:GetDescendants()) do
if p:IsA("BasePart") then
tpart = p
break
end
end
if not tpart then break end

timeNow = tick() * 35
lat = math.sin(timeNow) * 4
fr = math.cos(timeNow) * 20

bus:SetPrimaryPartCFrame(tpart.CFrame * CFrame.new(lat, 0, fr))
RunService.RenderStepped:Wait()
end
end

task.spawn(TrackCar)
end

 Players = game:GetService("Players")
 TweenService = game:GetService("TweenService")

 LocalPlayer = Players.LocalPlayer
 RUN_SEAT_TEST = false
 ORIGINAL_POS = nil

CarTab:AddToggle({
    Name = "قتل السيارة",
    Default = false,
    Callback = function(state)

        if state then
            if not SelectedCar then
                warn("❌ بالاول اختارلك سيارة يا ابني!")
                return
            end

            RUN_SEAT_TEST = true
            ORIGINAL_POS = LocalPlayer.Character.HumanoidRootPart.CFrame

            workspace.FallenPartsDestroyHeight = 0/0

            task.spawn(function()
                while RUN_SEAT_TEST do
                     vehFolder = workspace:FindFirstChild("Vehicles")
                    if not vehFolder then break end

                     theCar =
vehFolder:FindFirstChild(SelectedCar)
                    if theCar and theCar:FindFirstChild("Seats") then
                         seat = theCar.Seats:FindFirstChild("VehicleSeat")
                        if seat then
                        
                            LocalPlayer.Character.HumanoidRootPart.CFrame =
                                seat.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.2)

                            pcall(function()
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true
                            end)
                            task.wait(0.3)
                            LocalPlayer.Character.HumanoidRootPart.CFrame =
                                seat.CFrame - Vector3.new(0, 150, 0)

                            task.wait(0.2)
                            pcall(function()
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                                    :ChangeState(Enum.HumanoidStateType.Jumping)
                            end)

                            task.wait(0.4)
                        end
                    end

                    task.wait(0.1)
                end
            end)

        else
            RUN_SEAT_TEST = false

            workspace.FallenPartsDestroyHeight = -500

             HRP = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

            TweenService:Create(
                HRP,
                TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {CFrame = ORIGINAL_POS}
            ):Play()
        end
    end
})
CarTab:AddButton({
    Name = "سحب السيارة",
    Callback = function()
        if not SelectedCar then
            warn("❌ اختار سيارة يا زمال!")
            return
        end

        vehFolder = workspace:FindFirstChild("Vehicles")
        if not vehFolder then
            warn("❌ حبيبي ماكو")
            return
        end

        selectedVehicle = vehFolder:FindFirstChild(SelectedCar)
        if not selectedVehicle then
            warn("❌ السيارة المختارة ماكو!")
            return
        end

        if not selectedVehicle.PrimaryPart then
            warn("❌ سيارة اللي اختاريتها ضارط كودها")
            return
        end
hrp = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()

        selectedVehicle:SetPrimaryPartCFrame(hrp)
    end
})

CarTab:AddSection({"سحب وقتل كل السيارات"})

CarTab:AddButton({
    Name = "سحب كل السيارات",
    Callback = function()
        for _, v in next, workspace.Vehicles:GetChildren() do
            v:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character:GetPrimaryPartCFrame())
        end
    end
})

CarTab:AddToggle({
    Name = "قتل كل السيارات",
    Default = false,
    Callback = function(state)

        if state then
            RUN_SEAT_TEST = true
            ORIGINAL_POS = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

            workspace.FallenPartsDestroyHeight = 0/0

            task.spawn(function()
                while RUN_SEAT_TEST do

                    for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                        if not RUN_SEAT_TEST then break end
                        if plr == game.Players.LocalPlayer then continue end

                         carName = plr.Name .. "Car"

                         carFolder = workspace:FindFirstChild("Vehicles")
                        if not carFolder then continue end

                         car = carFolder:FindFirstChild(carName)
                        if not car then continue end

                        if not car:FindFirstChild("Seats") then continue end

                         seatFolder = car.Seats
                         seat = seatFolder:FindFirstChild("VehicleSeat")

                        if seat then

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                seat.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.2)

                            pcall(function()
                                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true
                            end)
                            task.wait(0.3)

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                seat.CFrame - Vector3.new(0, 150, 0)

                            task.wait(0.2)

                            pcall(function()
                                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                                    :ChangeState(Enum.HumanoidStateType.Jumping)
                            end)

                            task.wait(0.4)
                        end
                    end

                    task.wait(0.1)
                end
            end)

        else
            RUN_SEAT_TEST = false
            workspace.FallenPartsDestroyHeight = -500
             TweenService = game:GetService("TweenService")
             HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

            TweenService:Create(
                HRP,
                TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {CFrame = ORIGINAL_POS}
            ):Play()
        end
    end
})
CarTab:AddSection({"سكربت طيران للسيارات"})
CarTab:AddButton({
    Name = "طيران السيارة",
    Callback = function()
        -- بداية سكربت واجهة طيران من صنع نيمار
        local Flymguiv2 = Instance.new("ScreenGui")
        local Drag = Instance.new("Frame")
        local FlyFrame = Instance.new("Frame")
        local Speed = Instance.new("TextBox")
        local Fly = Instance.new("TextButton")
        local Speeed = Instance.new("TextLabel")
        local Stat = Instance.new("TextLabel")
        local Stat2 = Instance.new("TextLabel")
        local Unfly = Instance.new("TextButton")
        local Vfly = Instance.new("TextLabel")
        local Close = Instance.new("TextButton")
        local Minimize = Instance.new("TextButton")
        local Flyon = Instance.new("Frame")
        local W = Instance.new("TextButton")
        local S = Instance.new("TextButton")

        -- Properties (تعديل الألوان والاسم)
        Flymguiv2.Name = "CarFlyNeymar"
        Flymguiv2.Parent = game.CoreGui
        Flymguiv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Drag.Name = "Drag"
        Drag.Parent = Flymguiv2
        Drag.Active = true
        Drag.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- لون غامق فخم
        Drag.BorderSizePixel = 2
        Drag.BorderColor3 = Color3.fromRGB(0, 170, 255) -- نيون أزرق
        Drag.Draggable = true
        Drag.Position = UDim2.new(0.4, 0, 0.4, 0)
        Drag.Size = UDim2.new(0, 250, 0, 30)

        Vfly.Name = "Vfly"
        Vfly.Parent = Drag
        Vfly.BackgroundTransparency = 1
        Vfly.Size = UDim2.new(1, 0, 1, 0)
        Vfly.Font = Enum.Font.GothamBold
        Vfly.Text = "طيران سيارة من صنع نيمار"
        Vfly.TextColor3 = Color3.fromRGB(0, 170, 255)
        Vfly.TextSize = 14.000

        FlyFrame.Name = "FlyFrame"
        FlyFrame.Parent = Drag
        FlyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        FlyFrame.BorderSizePixel = 0
        FlyFrame.Position = UDim2.new(0, 0, 1, 0)
        FlyFrame.Size = UDim2.new(0, 250, 0, 150)

        Speed.Name = "Speed"
        Speed.Parent = FlyFrame
        Speed.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Speed.Position = UDim2.new(0.45, 0, 0.35, 0)
        Speed.Size = UDim2.new(0, 100, 0, 30)
        Speed.Font = Enum.Font.Gotham
        Speed.Text = "50"
        Speed.TextColor3 = Color3.fromRGB(255, 255, 255)

        Fly.Name = "Fly"
        Fly.Parent = FlyFrame
        Fly.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        Fly.Position = UDim2.new(0.1, 0, 0.65, 0)
        Fly.Size = UDim2.new(0, 200, 0, 35)
        Fly.Font = Enum.Font.GothamBold
        Fly.Text = "تشغيل (Enable)"
        Fly.TextColor3 = Color3.fromRGB(255, 255, 255)

        Unfly.Name = "Unfly"
        Unfly.Parent = FlyFrame
        Unfly.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- أحمر للإغلاق
        Unfly.Position = UDim2.new(0.1, 0, 0.65, 0)
        Unfly.Size = UDim2.new(0, 200, 0, 35)
        Unfly.Visible = false
        Unfly.Font = Enum.Font.GothamBold
        Unfly.Text = "إيقاف (Disable)"
        Unfly.TextColor3 = Color3.fromRGB(255, 255, 255)

        -- وظيفة التشغيل
        Fly.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                Fly.Visible = false
                Unfly.Visible = true
                Flyon.Visible = true
                Stat2.Text = "On"
                Stat2.TextColor3 = Color3.fromRGB(0, 255, 0)
                
                local HumanoidRP = char.HumanoidRootPart
                local BV = Instance.new("BodyVelocity", HumanoidRP)
                local BG = Instance.new("BodyGyro", HumanoidRP)
                BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                game:GetService('RunService').RenderStepped:Connect(function()
                    BG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BG.D = 5000
                    BG.P = 100000
                    BG.CFrame = game.Workspace.CurrentCamera.CFrame
                end)
            end
        end)

        -- وظيفة الإيقاف
        Unfly.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                Fly.Visible = true
                Unfly.Visible = false
                Flyon.Visible = false
                Stat2.Text = "Off"
                Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
                if char.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then char.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy() end
                if char.HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then char.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy() end
            end
        end)

        Close.Name = "Close"
        Close.Parent = Drag
        Close.Position = UDim2.new(0.88, 0, 0, 0)
        Close.Size = UDim2.new(0, 30, 0, 30)
        Close.Text = "X"
        Close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        Close.MouseButton1Click:Connect(function() Flymguiv2:Destroy() end)

        -- أزرار الحركة (W/S) بتصميم نيمار
        Flyon.Name = "NeymarControls"
        Flyon.Parent = Flymguiv2
        Flyon.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Flyon.Position = UDim2.new(0.1, 0, 0.5, 0)
        Flyon.Size = UDim2.new(0, 100, 0, 150)
        Flyon.Visible = false
        Flyon.Active = true
        Flyon.Draggable = true

        W.Name = "W"
        W.Parent = Flyon
        W.Text = "تقدم"
        W.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        W.Size = UDim2.new(0.8, 0, 0.4, 0)
        W.Position = UDim2.new(0.1, 0, 0.05, 0)

        S.Name = "S"
        S.Parent = Flyon
        S.Text = "تراجع"
        S.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        S.Size = UDim2.new(0.8, 0, 0.4, 0)
        S.Position = UDim2.new(0.1, 0, 0.55, 0)

        local function Move(dir)
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                local speedVal = tonumber(Speed.Text) or 50
                char.HumanoidRootPart.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * (speedVal * dir)
                task.wait(0.5)
                char.HumanoidRootPart.BodyVelocity.Velocity = Vector3.new(0,0,0)
            end
        end

        W.MouseButton1Click:Connect(function() Move(1) end)
        S.MouseButton1Click:Connect(function() Move(-1) end)

    end
})
ChildTab = Window:MakeTab({
    Title = "الاطفال",
    Icon = "rbxassetid://10723415903"
})
Players = game:GetService("Players") RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
LocalPlayer = Players.LocalPlayer

getgenv().Selec7tedPlayerNOme = nil

function GetPlayersList()
list = {}
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then
table.insert(list, plr.Name)
end
end
if #list == 0 then
return {"لا يوجد لاعبين"}
end
return list
end

PlayerDropdown = ChildTab:AddDropdown({
Name = "اختيار اللاعب",
Options = GetPlayersList(),
Default = "لا يوجد لاعبين",
Callback = function(v)
if v == "لا يوجد لاعبين" then
getgenv().Selec7tedPlayerNOme = nil
else
getgenv().Selec7tedPlayerNOme = v
end
end
})
ChildTab:AddButton({
Name = "تحديث اللاعبين♻️",
Callback = function()
PlayerDropdown:Set(GetPlayersList())
end
})
ChildTab:AddToggle({
Name = "المراقبة",
Default = false,
Callback = function(state)
 camera = workspace.CurrentCamera

if state then  
        if not getgenv().Selec7tedPlayerNOme then return end  

        if getgenv().SpyConnection then  
            getgenv().SpyConnection:Disconnect()  
        end  

        getgenv().SpyConnection = RunService.Heartbeat:Connect(function()  
         local target = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)  
            if target and target.Character then  
                camera.CameraSubject =  
                    target.Character:FindFirstChild("Humanoid")  
                    or camera.CameraSubject  
            end  
        end)  
    else  
        if getgenv().SpyConnection then  
            getgenv().SpyConnection:Disconnect()  
            getgenv().SpyConnection = nil  
        end  

        camera.CameraSubject =  
            LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")  
            or camera.CameraSubject  
    end  
end
})
ChildTab:AddButton({
Name = "حذف الطفل🗑️",
Callback = function()
args = {
	"DeleteFollowCharacter"
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Bab1yFollo1w"):FireServer(unpack(args))
end
})
ChildTab:AddToggle({
    Name = "👶ارسال الطفل",
    Default = false,
    Callback = function(state)

         pl = Players.LocalPlayer
         selectedPlayerName = getgenv().Selec7tedPlayerNOme

        if not selectedPlayerName then
            warn("No player selected!")
            return
        end

        if state then
 args = {
	"SpawnChild",
	"BabyBoy"
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Bab1yFollo1w"):FireServer(unpack(args))
wait(0.8)
            if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
                 args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
                 re = ReplicatedStorage.RE:FindFirstChild("1Bab1yFollo1w")
                if re then
                    re:FireServer(unpack(args))
                end
            end

            task.wait(0.2)

            if workspace:FindFirstChild(pl.Name) then
                for _, v in pairs(workspace[pl.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end

             target = selectedPlayerName

            if workspace:FindFirstChild(target)
                and workspace:FindFirstChild(pl.Name)
                and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
                workspace[pl.Name].FollowCharacter.Parent = workspace[target]

                if getgenv().RunService then
                    getgenv().RunService:Disconnect()
                end

getgenv().RunService = RunService.Heartbeat:Connect(function()
                     followCharacter = workspace[target]:FindFirstChild("FollowCharacter")
                     humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")

                    if followCharacter
                        and followCharacter:FindFirstChild("Torso")
                        and followCharacter.Torso:FindFirstChild("BodyPosition")
                        and humanoidRootPart then

                        followCharacter.Torso.BodyPosition.Position =
                            humanoidRootPart.Position - (humanoidRootPart.CFrame.LookVector * 3)

                        followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame
                    end
                end)
            end

        else
            if getgenv().RunService then
                getgenv().RunService:Disconnect()
                getgenv().RunService = nil
            end

             args = {
                "SpawnChild",
                "BabyBoy"
            }

             re = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Bab1yFollo1w")
            re:FireServer(unpack(args))

        end
    end
})
getgenv().BangSpeed = 1
ChildTab:AddSlider({
    Name = "سرعة البانق",
    MinValue = 0.1,
    MaxValue = 2,
    Default = getgenv().BangSpeed,
    Increase = 0.1,
    Callback = function(v)
        getgenv().BangSpeed = v
    end
})
function BangChild1()
     bangActive = false
    local connection
    togglePosition = false
    ChildTab:AddToggle({
        Name = "بانق الطفل 1",
        Default = false,
        Callback = function(Value)
            bangActive = Value

            plr = Players.LocalPlayer
            char = plr.Character
            if not char then return end

            model = workspace:FindFirstChild(plr.Name)

            if Value then
                if not model or not model:FindFirstChild("FollowCharacter") then
                     args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
                    re = ReplicatedStorage:FindFirstChild("RE")
                    if re and re:FindFirstChild("1Bab1yFollo1w") then
                        re:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
                    else
                        return
                    end
                end

                model = workspace:WaitForChild(plr.Name, 5)
                if not model then return end

                baby = model:WaitForChild("FollowCharacter", 5)
                if not baby then return end

                if connection then connection:Disconnect() end

                connection = RunService.Heartbeat:Connect(function()
                    if bangActive and getgenv().Selec7tedPlayerNOme then
                        targetPlayer = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                            head = targetPlayer.Character:FindFirstChild("Head")
                            if head then
                                offset = togglePosition and 1 or 4
                                baby:SetPrimaryPartCFrame(
                                    head.CFrame * CFrame.new(0, -1, offset)
                                )
                                togglePosition = not togglePosition
                                task.wait(getgenv().BangSpeed)
                            end
                        end
                    end
                end)

            else
                if connection then connection:Disconnect() end
                connection = nil
            end
        end
    })
end
BangChild1()

function FaceBang1()
    bangActive = false
    local connection
    togglePosition = false

    ChildTab:AddToggle({
        Name = "بانق وجه الطفل 1",
        Default = false,
        Callback = function(Value)
            bangActive = Value

            plr = Players.LocalPlayer
            char = plr.Character
            if not char then return end

            model = workspace:FindFirstChild(plr.Name)

            if Value then
                if not model or not model:FindFirstChild("FollowCharacter") then
                     args = { "CharacterFollowSpawnPlayer", "BabyBoy" }
                     re = ReplicatedStorage:FindFirstChild("RE")
                    if re and re:FindFirstChild("1Bab1yFollo1w") then
                        re:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
                    else
                        return
                    end
                end

                model = workspace:WaitForChild(plr.Name, 5)
                if not model then return end

                 baby = model:WaitForChild("FollowCharacter", 5)
                if not baby then return end

                if connection then connection:Disconnect() end

                connection = RunService.Heartbeat:Connect(function()
                    if bangActive and getgenv().Selec7tedPlayerNOme then
                        targetPlayer = Players:FindFirstChild(getgenv().Selec7tedPlayerNOme)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                            head = targetPlayer.Character:FindFirstChild("Head")
                            if head then
                                 offset = togglePosition and 1 or 4
                                baby:SetPrimaryPartCFrame(
                                    head.CFrame
                                    * CFrame.new(0, 1, -offset)
                                    * CFrame.Angles(0, math.rad(180), 0)
                                )
                                togglePosition = not togglePosition
                                task.wait(getgenv().BangSpeed)
                            end
                        end
                    end
                end)

            else
                if connection then connection:Disconnect() end
                connection = nil
            end
        end
    })
end
FaceBang1() 

local ShaderTab = Window:MakeTab({"الجودة", "rbxassetid://108609244803977"})
ShaderTab:AddToggle({
    Name = "V1 جودة ",
    Default = false,
    Callback = function(Value)
        if Value then
            local workspace = game:GetService("Workspace")
            local Lighting = game:GetService("Lighting")
            local RunService = game:GetService("RunService")
            local Debris = game:GetService("Debris")
            local TweenService = game:GetService("TweenService")
            local SoundService = game:GetService("SoundService")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local model = workspace:FindFirstChild("Model")

            _G.SistemaAtivo = true
            _G.SistemaConnections = {}
            _G.SistemaInstances = {}

            local function addConnection(connection)
                table.insert(_G.SistemaConnections, connection)
            end

            local function addInstance(instance)
                table.insert(_G.SistemaInstances, instance)
            end

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://131644923"
            sound.Volume = 1
            sound.Parent = SoundService
            sound:Play()
            addInstance(sound)

            if model then
                local function setMat(obj)
                    for _, c in pairs(obj:GetChildren()) do
                        if c:IsA("BasePart") then
                            c.Material = Enum.Material.Basalt
                        elseif c:IsA("Model") or c:IsA("Folder") then
                            setMat(c)
                        end
                    end
                end
                
                if model:FindFirstChild("001_SnowStreet") then
                    setMat(model["001_SnowStreet"])
                end
                
                if model:FindFirstChild("Street") then
                    for _, o in pairs(model.Street:GetDescendants()) do
                        if o:IsA("BasePart") then
                            o.Material = Enum.Material.Basalt
                        end
                    end
                end
                
                for _, o in pairs(model:GetChildren()) do
                    if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then
                        o.Material = Enum.Material.Cobblestone
                    end
                end
                
                local modelConnection = model.ChildAdded:Connect(function(obj)
                    if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then
                        obj.Material = Enum.Material.Cobblestone
                    end
                end)
                addConnection(modelConnection)
            end

            -- Sistema de som ambiente
            local soundPart = Instance.new("Part")
            soundPart.Size = Vector3.new(1,1,1)
            soundPart.Transparency = 1
            soundPart.Anchored = true
            soundPart.CanCollide = false
            soundPart.Parent = workspace
            addInstance(soundPart)

            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")

            local birdSound = Instance.new("Sound")
            birdSound.Name = "BirdsSound"
            birdSound.SoundId = "rbxassetid://1237969272"
            birdSound.Looped = true
            birdSound.Volume = 0.05
            birdSound.Parent = soundPart
            addInstance(birdSound)

            local wolfSound = Instance.new("Sound")
            wolfSound.SoundId = "rbxassetid://6654360741"
            wolfSound.Volume = 0.05
            wolfSound.Looped = false
            wolfSound.Parent = workspace
            addInstance(wolfSound)

            local heartbeatConn = RunService.Heartbeat:Connect(function()
                if hrp and hrp.Parent and _G.SistemaAtivo then
                    soundPart.Position = hrp.Position + Vector3.new(0,10,0)
                end
            end)
            addConnection(heartbeatConn)

            local function isNight()
                local t = Lighting.ClockTime
                return (t >= 18 or t <= 6)
            end

            local nightCycleConn = task.spawn(function()
                while _G.SistemaAtivo do
                    if isNight() then
                        if birdSound.IsPlaying then birdSound:Stop() end
                        if wolfSound.IsPlaying then wolfSound:Stop() end
                        wolfSound:Play()
                    else
                        if wolfSound.IsPlaying then wolfSound:Stop() end
                        if not birdSound.IsPlaying then birdSound:Play() end
                    end
                    wait(20)
                end
            end)
            addConnection(nightCycleConn)

            local fountainPart = Instance.new("Part")
            fountainPart.Anchored = true
            fountainPart.CanCollide = false
            fountainPart.Transparency = 1
            fountainPart.Size = Vector3.new(1,1,1)
            fountainPart.Position = Vector3.new(-27,19,15)
            fountainPart.Parent = workspace
            addInstance(fountainPart)

            local attachment = Instance.new("Attachment")
            attachment.Position = Vector3.new(-27,19,15)
            attachment.Parent = fountainPart
            addInstance(attachment)

            local fountainSound = Instance.new("Sound")
            fountainSound.Name = "FountainSound"
            fountainSound.SoundId = "rbxassetid://4766793559"
            fountainSound.Looped = true
            fountainSound.Volume = 0.03
            fountainSound.EmitterSize = 10
            fountainSound.RollOffMode = Enum.RollOffMode.Linear
            fountainSound.MaxDistance = 100
            fountainSound.Parent = attachment
            fountainSound:Play()
            addInstance(fountainSound)

            local customSound = Instance.new("Sound")
            customSound.Name = "MyCustomSound"
            customSound.SoundId = "rbxassetid://9048659736"
            customSound.Volume = 0.01
            customSound.Looped = true
            customSound.PlayOnRemove = false
            customSound.Parent = workspace
            customSound:Play()
            addInstance(customSound)

            local active = false
            local stars = {}
            local shootingStarsFolder = Instance.new("Folder",workspace)
            shootingStarsFolder.Name = "ShootingStars"
            addInstance(shootingStarsFolder)
            
            local STAR_COUNT = 300
            local SHOOTING_STAR_CHANCE = 0.3
            local SHOOTING_STAR_MAX = 12
            local shootingStarCooldown = 0.1

            local spaceSound = Instance.new("Sound",workspace)
            spaceSound.SoundId = "rbxassetid://1843520836"
            spaceSound.Volume = 0.3
            spaceSound.Looped = true
            spaceSound.Name = "SpaceAmbience"
            addInstance(spaceSound)

            local function createStar()
                if not _G.SistemaAtivo then return end
                local star = Instance.new("Part")
                local size = math.random(1,3)*0.5
                star.Size = Vector3.new(size,size,size)
                star.Position = Vector3.new(math.random(-1000,1000),math.random(300,700),math.random(-1000,1000))
                star.Anchored = true
                star.CanCollide = false
                star.Material = Enum.Material.Neon
                local colors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180),Color3.fromRGB(180,200,255)}
                star.Color = colors[math.random(1,#colors)]
                star.Name = "Star"
                star.Parent = workspace
                addInstance(star)
                
                local light = Instance.new("PointLight",star)
                light.Brightness = 2 + math.random()*1.5
                light.Range = 12
                addInstance(light)
                
                local starConn = spawn(function()
                    while star.Parent and active and _G.SistemaAtivo do
                        star.Transparency = 0.2 + math.sin(tick()*math.random(2,5))*0.2
                        RunService.Heartbeat:Wait()
                    end
                    if star.Parent then star:Destroy() end
                end)
                addConnection(starConn)
                table.insert(stars,star)
            end

            local function createShootingStar()
                if not active or not _G.SistemaAtivo then return end
                local startPos = Vector3.new(math.random(-1000,1000),math.random(350,600),math.random(-1000,1000))
                local dir = Vector3.new(math.random(-1,1),math.random(-0.1,0.1),math.random(-1,1)).Unit
                local speed = math.random(350,550)
                local isFire = math.random() <= SHOOTING_STAR_CHANCE
                local color = isFire and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,255,220)
                local trailColor = isFire and ColorSequence.new(Color3.fromRGB(255,120,0),Color3.fromRGB(255,230,50)) or ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180))
                
                local star = Instance.new("Part")
                star.Size = Vector3.new(0.5,0.5,3)
                star.Position = startPos
                star.Anchored = true
                star.CanCollide = false
                star.Material = Enum.Material.Neon
                star.Color = color
                star.Name = "ShootingStar"
                star.Parent = shootingStarsFolder
                addInstance(star)
                
                local att0 = Instance.new("Attachment",star)
                local att1 = Instance.new("Attachment",star)
                att1.Position = Vector3.new(0,0,-3)
                addInstance(att0)
                addInstance(att1)
                
                local trail = Instance.new("Trail",star)
                trail.Attachment0 = att0
                trail.Attachment1 = att1
                trail.Lifetime = 0.35
                trail.Color = trailColor
                trail.LightEmission = 1
                trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
                addInstance(trail)
                
                local light = Instance.new("PointLight",star)
                light.Brightness = isFire and 12 or 7
                light.Range = 35
                light.Color = color
                addInstance(light)
                
                if isFire then
                    local fire = Instance.new("Fire",star)
                    fire.Heat = 15
                    fire.Size = 3.5
                    fire.Color = Color3.fromRGB(255,110,0)
                    fire.SecondaryColor = Color3.fromRGB(255,210,0)
                    addInstance(fire)
                end
                
                local lifetime = math.random(1,1.5)
                local timePassed = 0
                local moveConn
                moveConn = RunService.Heartbeat:Connect(function(dt)
                    if not active or not _G.SistemaAtivo then 
                        moveConn:Disconnect() 
                        if star.Parent then star:Destroy() end 
                        return 
                    end
                    timePassed += dt
                    if timePassed >= lifetime then 
                        moveConn:Disconnect() 
                        if star.Parent then star:Destroy() end 
                        return 
                    end
                    local curve = math.sin(timePassed*20)*0.5
                    star.Position += (dir+Vector3.new(0,curve,0)).Unit*speed*dt
                end)
                addConnection(moveConn)
                Debris:AddItem(star,4)
            end

            local function updateSky()
                if not _G.SistemaAtivo then return end
                local hour = Lighting.ClockTime
                local shouldBeActive = hour >= 18 or hour < 6
                if shouldBeActive and not active then
                    active = true
                    Lighting.FogColor = Color3.fromRGB(10,10,30)
                    Lighting.FogEnd = 5000
                    Lighting.Brightness = 2
                    for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
                    stars = {}
                    for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
                    for i=1,STAR_COUNT do createStar() end
                    spaceSound:Play()
                elseif not shouldBeActive and active then
                    active = false
                    for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
                    stars = {}
                    for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
                    spaceSound:Stop()
                    Lighting.FogColor = Color3.fromRGB(192,192,192)
                    Lighting.FogEnd = 100000
                    Lighting.Brightness = 2
                end
            end

            local shootingStarConn = task.spawn(function()
                while _G.SistemaAtivo do
                    if active then
                        for i=1,SHOOTING_STAR_MAX do
                            createShootingStar()
                            task.wait(shootingStarCooldown)
                        end
                    else
                        task.wait(1)
                    end
                end
            end)
            addConnection(shootingStarConn)

            local skyUpdateConn = task.spawn(function()
                while _G.SistemaAtivo do
                    updateSky()
                    task.wait(1)
                end
            end)
            addConnection(skyUpdateConn)

            local rainFolder = Instance.new("Folder",workspace)
            rainFolder.Name = "FakeRain"
            addInstance(rainFolder)
            local isRaining = false

            local birds = Instance.new("Sound",SoundService)
            birds.SoundId = "rbxassetid://9111139882"
            birds.Volume = 0.2
            birds.Looped = true
            birds:Play()
            addInstance(birds)

            local rainSound = Instance.new("Sound",SoundService)
            rainSound.SoundId = "rbxassetid://9118823106"
            rainSound.Volume = 0.3
            rainSound.Looped = true
            rainSound:Play()
            addInstance(rainSound)

            local thunder = Instance.new("Sound",SoundService)
            thunder.SoundId = "rbxassetid://9120018695"
            thunder.Volume = 0.4
            addInstance(thunder)

            local function updateBirdSound()
                birds.Volume = isRaining and 0 or 0.2
            end

            local function spawnRain()
                if not _G.SistemaAtivo then return end
                isRaining = true
                updateBirdSound()
                for i=1,120 do
                    local drop = Instance.new("Part")
                    drop.Size = Vector3.new(0.1,2,0.1)
                    drop.Anchored = true
                    drop.CanCollide = false
                    drop.Material = Enum.Material.Glass
                    drop.Transparency = 0.5
                    drop.Color = Color3.fromRGB(160,160,255)
                    drop.Position = Vector3.new(math.random(-150,150),100,math.random(-150,150))
                    drop.Parent = rainFolder
                    addInstance(drop)
                    local tween = TweenService:Create(drop,TweenInfo.new(1),{Position=drop.Position-Vector3.new(0,60,0)})
                    tween:Play()
                    Debris:AddItem(drop,1.5)
                end
                wait(1.5)
                isRaining = false
                updateBirdSound()
            end

            local function lightningStrike()
                if not _G.SistemaAtivo then return end
                local flash = Instance.new("Part")
                flash.Size = Vector3.new(1,1000,1)
                flash.Anchored = true
                flash.CanCollide = false
                flash.Transparency = 0.4
                flash.Material = Enum.Material.Neon
                flash.Color = Color3.new(1,1,1)
                flash.Position = Vector3.new(math.random(-100,100),500,math.random(-100,100))
                flash.Parent = workspace
                addInstance(flash)
                Lighting.Brightness = Lighting.Brightness + 1.5
                thunder:Play()
                wait(0.1)
                Lighting.Brightness = Lighting.Brightness - 1.5
                flash:Destroy()
            end

            for _,part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Material == Enum.Material.SmoothPlastic then
                    part.Reflectance = 0.25
                end
            end

            local rainConn = task.spawn(function()
                while _G.SistemaAtivo do
                    spawnRain()
                    if math.random() < 0.2 then lightningStrike() end
                    wait(1)
                end
            end)
            addConnection(rainConn)

            Lighting.Brightness = 2
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
            Lighting.FogColor = Color3.fromRGB(120, 130, 140)
            Lighting.FogStart = 80
            Lighting.FogEnd = 600
            Lighting.EnvironmentSpecularScale = 1
            Lighting.EnvironmentDiffuseScale = 0.5

            local sky = Instance.new("Sky")
            sky.SkyboxBk = "rbxassetid://159454299"
            sky.SkyboxDn = "rbxassetid://159454296"
            sky.SkyboxFt = "rbxassetid://159454293"
            sky.SkyboxLf = "rbxassetid://159454286"
            sky.SkyboxRt = "rbxassetid://159454300"
            sky.SkyboxUp = "rbxassetid://159454304"
            sky.Parent = Lighting
            addInstance(sky)

            local color = Instance.new("ColorCorrectionEffect", Lighting)
            color.Brightness = 0.03
            color.Contrast = 0.15
            color.Saturation = 0.05
            color.TintColor = Color3.fromRGB(255, 240, 220)
            addInstance(color)

            local bloom = Instance.new("BloomEffect", Lighting)
            bloom.Intensity = 0.8
            bloom.Size = 56
            bloom.Threshold = 0.9
            addInstance(bloom)

            local sunRays = Instance.new("SunRaysEffect", Lighting)
            sunRays.Intensity = 0.05
            sunRays.Spread = 0.8
            addInstance(sunRays)

            local blur = Instance.new("BlurEffect", Lighting)
            blur.Size = 0
            addInstance(blur)

        else
            _G.SistemaAtivo = false
            
            if _G.SistemaConnections then
                for _, connection in pairs(_G.SistemaConnections) do
                    if connection then
                        pcall(function() connection:Disconnect() end)
                    end
                end
                _G.SistemaConnections = {}
            end
            
            if _G.SistemaInstances then
                for _, instance in pairs(_G.SistemaInstances) do
                    if instance and instance.Parent then
                        pcall(function() instance:Destroy() end)
                    end
                end
                _G.SistemaInstances = {}
            end
            
            local Lighting = game:GetService("Lighting")
            Lighting.Brightness = 1
            Lighting.FogColor = Color3.fromRGB(191, 191, 191)
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            
            for _, effect in pairs(Lighting:GetChildren()) do
                if effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or 
                   effect:IsA("SunRaysEffect") or effect:IsA("BlurEffect") or effect:IsA("Sky") then
                    effect:Destroy()
                end
            end
            
            if workspace:FindFirstChild("ShootingStars") then
                workspace.ShootingStars:Destroy()
            end
            if workspace:FindFirstChild("FakeRain") then
                workspace.FakeRain:Destroy()
            end
            
            for _, sound in pairs(workspace:GetDescendants()) do
                if sound:IsA("Sound") and (sound.Name == "SpaceAmbience" or sound.Name == "FountainSound" or sound.Name == "MyCustomSound") then
                    sound:Stop()
                end
            end
            
            for _, sound in pairs(SoundService:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound:Stop()
                end
            end
        end
    end
})
ShaderTab:AddToggle({
    Name = "V2 جودة ",
    Default = false,
    Callback = function(Value)
        if Value then
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            
            _G.IluminationAtiva = true
            _G.IluminationInstances = {}
            
            local function addInstance(instance)
                table.insert(_G.IluminationInstances, instance)
            end
            
            local Lighting = game:GetService("Lighting")
            
            local Bloom = Instance.new("BloomEffect")
            Bloom.Intensity = 0.1
            Bloom.Threshold = 0
            Bloom.Size = 100
            Bloom.Parent = Lighting
            addInstance(Bloom)
            
            local Tropic = Instance.new("Sky")
            Tropic.Name = "Tropic"
            Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
            Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
            Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
            Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
            Tropic.StarCount = 100
            Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
            Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
            Tropic.Parent = Bloom
            
            local Sky = Instance.new("Sky")
            Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
            Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
            Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
            Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
            Sky.CelestialBodiesShown = false
            Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
            Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
            Sky.Parent = Bloom
            
            local Bloom2 = Instance.new("BloomEffect")
            Bloom2.Enabled = false
            Bloom2.Intensity = 0.35
            Bloom2.Threshold = 0.2
            Bloom2.Size = 56
            Bloom2.Parent = Lighting
            addInstance(Bloom2)
            
            local Tropic2 = Instance.new("Sky")
            Tropic2.Name = "Tropic"
            Tropic2.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
            Tropic2.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
            Tropic2.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
            Tropic2.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
            Tropic2.StarCount = 100
            Tropic2.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
            Tropic2.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
            Tropic2.Parent = Bloom2
            
            local Sky2 = Instance.new("Sky")
            Sky2.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
            Sky2.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
            Sky2.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
            Sky2.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
            Sky2.CelestialBodiesShown = false
            Sky2.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
            Sky2.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
            Sky2.Parent = Bloom2
            
            local Blur = Instance.new("BlurEffect")
            Blur.Size = 2
            Blur.Parent = Lighting
            addInstance(Blur)
            
            local Efecto = Instance.new("BlurEffect")
            Efecto.Name = "Efecto"
            Efecto.Enabled = false
            Efecto.Size = 2
            Efecto.Parent = Lighting
            addInstance(Efecto)
            
            local Inaritaisha = Instance.new("ColorCorrectionEffect")
            Inaritaisha.Name = "Inari taisha"
            Inaritaisha.Saturation = 0.05
            Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)
            Inaritaisha.Parent = Lighting
            addInstance(Inaritaisha)
            
            local Normal = Instance.new("ColorCorrectionEffect")
            Normal.Name = "Normal"
            Normal.Enabled = false
            Normal.Saturation = -0.2
            Normal.TintColor = Color3.fromRGB(255, 232, 215)
            Normal.Parent = Lighting
            addInstance(Normal)
            
            local SunRays = Instance.new("SunRaysEffect")
            SunRays.Intensity = 0.05
            SunRays.Parent = Lighting
            addInstance(SunRays)
            
            local Sunset = Instance.new("Sky")
            Sunset.Name = "Sunset"
            Sunset.SkyboxUp = "rbxassetid://323493360"
            Sunset.SkyboxLf = "rbxassetid://323494252"
            Sunset.SkyboxBk = "rbxassetid://323494035"
            Sunset.SkyboxFt = "rbxassetid://323494130"
            Sunset.SkyboxDn = "rbxassetid://323494368"
            Sunset.SunAngularSize = 14
            Sunset.SkyboxRt = "rbxassetid://323494067"
            Sunset.Parent = Lighting
            addInstance(Sunset)
            
            local Takayama = Instance.new("ColorCorrectionEffect")
            Takayama.Name = "Takayama"
            Takayama.Enabled = false
            Takayama.Saturation = -0.3
            Takayama.Contrast = 0.1
            Takayama.TintColor = Color3.fromRGB(235, 214, 204)
            Takayama.Parent = Lighting
            addInstance(Takayama)
            
            local L = game:GetService("Lighting")
            _G.OriginalLightingSettings = {
                Brightness = L.Brightness,
                ColorShift_Bottom = L.ColorShift_Bottom,
                ColorShift_Top = L.ColorShift_Top,
                OutdoorAmbient = L.OutdoorAmbient,
                ClockTime = L.ClockTime,
                FogColor = L.FogColor,
                FogEnd = L.FogEnd,
                FogStart = L.FogStart,
                ExposureCompensation = L.ExposureCompensation,
                ShadowSoftness = L.ShadowSoftness,
                Ambient = L.Ambient
            }
            
            L.Brightness = 2.14
            L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
            L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
            L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
            L.ClockTime = 6.7
            L.FogColor = Color3.fromRGB(94, 76, 106)
            L.FogEnd = 1000
            L.FogStart = 0
            L.ExposureCompensation = 0.24
            L.ShadowSoftness = 0
            L.Ambient = Color3.fromRGB(59, 33, 27)
            
            local Bloom3 = Instance.new("BloomEffect")
            Bloom3.Intensity = 0.1
            Bloom3.Threshold = 0
            Bloom3.Size = 100
            Bloom3.Parent = Lighting
            addInstance(Bloom3)
            
            local Tropic3 = Instance.new("Sky")
            Tropic3.Name = "Tropic"
            Tropic3.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
            Tropic3.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
            Tropic3.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
            Tropic3.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
            Tropic3.StarCount = 100
            Tropic3.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
            Tropic3.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
            Tropic3.Parent = Bloom3
            
            local Sky3 = Instance.new("Sky")
            Sky3.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
            Sky3.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
            Sky3.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
            Sky3.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
            Sky3.CelestialBodiesShown = false
            Sky3.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
            Sky3.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
            Sky3.Parent = Bloom3
            
            local Bloom4 = Instance.new("BloomEffect")
            Bloom4.Enabled = false
            Bloom4.Intensity = 0.35
            Bloom4.Threshold = 0.2
            Bloom4.Size = 56
            Bloom4.Parent = Lighting
            addInstance(Bloom4)
            
            local Tropic4 = Instance.new("Sky")
            Tropic4.Name = "Tropic"
            Tropic4.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
            Tropic4.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
            Tropic4.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
            Tropic4.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
            Tropic4.StarCount = 100
            Tropic4.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
            Tropic4.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
            Tropic4.Parent = Bloom4
            
            local Sky4 = Instance.new("Sky")
            Sky4.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
            Sky4.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
            Sky4.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
            Sky4.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
            Sky4.CelestialBodiesShown = false
            Sky4.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
            Sky4.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
            Sky4.Parent = Bloom4
            
            local Blur2 = Instance.new("BlurEffect")
            Blur2.Size = 2
            Blur2.Parent = Lighting
            addInstance(Blur2)
            
            local Efecto2 = Instance.new("BlurEffect")
            Efecto2.Name = "Efecto"
            Efecto2.Enabled = false
            Efecto2.Size = 2
            Efecto2.Parent = Lighting
            addInstance(Efecto2)
            
            local Inaritaisha2 = Instance.new("ColorCorrectionEffect")
            Inaritaisha2.Name = "Inari taisha"
            Inaritaisha2.Saturation = 0.05
            Inaritaisha2.TintColor = Color3.fromRGB(255, 224, 219)
            Inaritaisha2.Parent = Lighting
            addInstance(Inaritaisha2)
            
            local Normal2 = Instance.new("ColorCorrectionEffect")
            Normal2.Name = "Normal"
            Normal2.Enabled = false
            Normal2.Saturation = -0.2
            Normal2.TintColor = Color3.fromRGB(255, 232, 215)
            Normal2.Parent = Lighting
            addInstance(Normal2)
            
            local SunRays2 = Instance.new("SunRaysEffect")
            SunRays2.Intensity = 0.05
            SunRays2.Parent = Lighting
            addInstance(SunRays2)
            
            local Sunset2 = Instance.new("Sky")
            Sunset2.Name = "Sunset"
            Sunset2.SkyboxUp = "rbxassetid://323493360"
            Sunset2.SkyboxLf = "rbxassetid://323494252"
            Sunset2.SkyboxBk = "rbxassetid://323494035"
            Sunset2.SkyboxFt = "rbxassetid://323494130"
            Sunset2.SkyboxDn = "rbxassetid://323494368"
            Sunset2.SunAngularSize = 14
            Sunset2.SkyboxRt = "rbxassetid://323494067"
            Sunset2.Parent = Lighting
            addInstance(Sunset2)
            
            local Takayama2 = Instance.new("ColorCorrectionEffect")
            Takayama2.Name = "Takayama"
            Takayama2.Enabled = false
            Takayama2.Saturation = -0.3
            Takayama2.Contrast = 0.1
            Takayama2.TintColor = Color3.fromRGB(235, 214, 204)
            Takayama2.Parent = Lighting
            addInstance(Takayama2)
            
            L.Brightness = 2.14
            L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
            L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
            L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
            L.ClockTime = 6.7
            L.FogColor = Color3.fromRGB(94, 76, 106)
            L.FogEnd = 1000
            L.FogStart = 0
            L.ExposureCompensation = 0.24
            L.ShadowSoftness = 0
            L.Ambient = Color3.fromRGB(59, 33, 27)
            
        else
            _G.IluminationAtiva = false
            
            local Lighting = game:GetService("Lighting")
            
            if _G.OriginalLightingSettings then
                Lighting.Brightness = _G.OriginalLightingSettings.Brightness or 1
                Lighting.ColorShift_Bottom = _G.OriginalLightingSettings.ColorShift_Bottom or Color3.fromRGB(0, 0, 0)
                Lighting.ColorShift_Top = _G.OriginalLightingSettings.ColorShift_Top or Color3.fromRGB(0, 0, 0)
                Lighting.OutdoorAmbient = _G.OriginalLightingSettings.OutdoorAmbient or Color3.fromRGB(128, 128, 128)
                Lighting.ClockTime = _G.OriginalLightingSettings.ClockTime or 14
                Lighting.FogColor = _G.OriginalLightingSettings.FogColor or Color3.fromRGB(191, 191, 191)
                Lighting.FogEnd = _G.OriginalLightingSettings.FogEnd or 100000
                Lighting.FogStart = _G.OriginalLightingSettings.FogStart or 0
                Lighting.ExposureCompensation = _G.OriginalLightingSettings.ExposureCompensation or 0
                Lighting.ShadowSoftness = _G.OriginalLightingSettings.ShadowSoftness or 0.5
                Lighting.Ambient = _G.OriginalLightingSettings.Ambient or Color3.fromRGB(0, 0, 0)
            else
                Lighting.Brightness = 1
                Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
                Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                Lighting.ClockTime = 14
                Lighting.FogColor = Color3.fromRGB(191, 191, 191)
                Lighting.FogEnd = 100000
                Lighting.FogStart = 0
                Lighting.ExposureCompensation = 0
                Lighting.ShadowSoftness = 0.5
                Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            end
            
            if _G.IluminationInstances then
                for _, instance in pairs(_G.IluminationInstances) do
                    if instance and instance.Parent then
                        pcall(function() 
                            instance:Destroy() 
                        end)
                    end
                end
                _G.IluminationInstances = {}
            end
            
            local effectsToRemove = {
                "BloomEffect",
                "BlurEffect", 
                "ColorCorrectionEffect",
                "SunRaysEffect",
                "Sky"
            }
            
            for _, effectType in ipairs(effectsToRemove) do
                for _, effect in pairs(Lighting:GetChildren()) do
                    if effect:IsA(effectType) then
                        pcall(function() effect:Destroy() end)
                    end
                end
            end
        end
    end
})
local Players=game:GetService("Players")
local Lighting=game:GetService("Lighting")
local StarterGui=game:GetService("StarterGui")
local MaterialService=game:GetService("MaterialService")
local ME=Players.LocalPlayer
local enabled=false

if not _G.Ignore then _G.Ignore={} end
if _G.Settings==nil then
_G.Settings={
Players={["Ignore Me"]=true,["Ignore Others"]=true,["Ignore Tools"]=true},
Meshes={NoMesh=false,NoTexture=false,Destroy=false},
Images={Invisible=true,Destroy=false},
Explosions={Smaller=true,Invisible=false,Destroy=false},
Particles={Invisible=true,Destroy=false},
TextLabels={LowerQuality=false,Invisible=false,Destroy=false},
MeshParts={LowerQuality=true,Invisible=false,NoTexture=false,NoMesh=false,Destroy=false},
Other={
["FPS Cap"]=true,
["No Camera Effects"]=true,
["No Clothes"]=true,
["Low Water Graphics"]=true,
["No Shadows"]=true,
["Low Rendering"]=true,
["Low Quality Parts"]=true,
["Low Quality Models"]=true,
["Reset Materials"]=true,
["Lower Quality MeshParts"]=true,
ClearNilInstances=false
}}
end

local CanBeEnabled={"ParticleEmitter","Trail","Smoke","Fire","Sparkles"}

local function PartOfCharacter(i)
for _,p in ipairs(Players:GetPlayers()) do
if p~=ME and p.Character and i:IsDescendantOf(p.Character) then
return true
end
end
return false
end

local function DescendantOfIgnore(i)
for _,v in pairs(_G.Ignore) do
if i:IsDescendantOf(v) then return true end
end
return false
end

local function CheckIfBad(Inst)
if not enabled then return end
if not Inst:IsDescendantOf(Players)
and (_G.Settings.Players["Ignore Others"] and not PartOfCharacter(Inst) or not _G.Settings.Players["Ignore Others"])
and (_G.Settings.Players["Ignore Me"] and ME.Character and not Inst:IsDescendantOf(ME.Character) or not _G.Settings.Players["Ignore Me"])
and (_G.Settings.Players["Ignore Tools"] and not Inst:IsA("BackpackItem") and not Inst:FindFirstAncestorWhichIsA("BackpackItem") or not _G.Settings.Players["Ignore Tools"])
and (_G.Ignore and not table.find(_G.Ignore,Inst) and not DescendantOfIgnore(Inst) or true)
then
if Inst:IsA("DataModelMesh") then
if Inst:IsA("SpecialMesh") then
if _G.Settings.Meshes.NoMesh then Inst.MeshId="" end
if _G.Settings.Meshes.NoTexture then Inst.TextureId="" end
end
if _G.Settings.Meshes.Destroy then Inst:Destroy() end

elseif Inst:IsA("FaceInstance") then
if _G.Settings.Images.Invisible then Inst.Transparency=1 Inst.Shiny=1 end
if _G.Settings.Images.Destroy then Inst:Destroy() end

elseif Inst:IsA("ShirtGraphic") then
if _G.Settings.Images.Invisible then Inst.Graphic="" end
if _G.Settings.Images.Destroy then Inst:Destroy() end

elseif table.find(CanBeEnabled,Inst.ClassName) then
if _G.Settings.Particles.Invisible then Inst.Enabled=false end
if _G.Settings.Particles.Destroy then Inst:Destroy() end

elseif Inst:IsA("PostEffect") and _G.Settings.Other["No Camera Effects"] then
Inst.Enabled=false

elseif Inst:IsA("Explosion") then
if _G.Settings.Explosions.Smaller then Inst.BlastPressure=1 Inst.BlastRadius=1 end
if _G.Settings.Explosions.Invisible then Inst.Visible=false end
if _G.Settings.Explosions.Destroy then Inst:Destroy() end

elseif Inst:IsA("Clothing") or Inst:IsA("SurfaceAppearance") or Inst:IsA("BaseWrap") then
if _G.Settings.Other["No Clothes"] then Inst:Destroy() end

elseif Inst:IsA("BasePart") and not Inst:IsA("MeshPart") then
if _G.Settings.Other["Low Quality Parts"] then
Inst.Material=Enum.Material.Plastic
Inst.Reflectance=0
end

elseif Inst:IsA("TextLabel") and Inst:IsDescendantOf(workspace) then
if _G.Settings.TextLabels.LowerQuality then
Inst.Font=Enum.Font.SourceSans
Inst.TextScaled=false
Inst.RichText=false
Inst.TextSize=14
end
if _G.Settings.TextLabels.Invisible then Inst.Visible=false end
if _G.Settings.TextLabels.Destroy then Inst:Destroy() end

elseif Inst:IsA("Model") then
if _G.Settings.Other["Low Quality Models"] then
Inst.LevelOfDetail=1
end

elseif Inst:IsA("MeshPart") then
if _G.Settings.MeshParts.LowerQuality then
Inst.RenderFidelity=2
Inst.Material=Enum.Material.Plastic
Inst.Reflectance=0
end
if _G.Settings.MeshParts.Invisible then Inst.Transparency=1 end
if _G.Settings.MeshParts.NoTexture then Inst.TextureID="" end
if _G.Settings.MeshParts.NoMesh then Inst.MeshId="" end
if _G.Settings.MeshParts.Destroy then Inst:Destroy() end
end
end
end

local function EnableFPS()
for _,v in ipairs(game:GetDescendants()) do
CheckIfBad(v)
end
game.DescendantAdded:Connect(function(v)
task.wait(1)
CheckIfBad(v)
end)
end
ShaderTab:AddToggle({
Name="120 FPS",
Default=false,
Callback=function(v)
enabled=v
if v then
EnableFPS()
end
end
})

local TabSuond = Window:MakeTab({ 
    Title = "أغاني مجانية", 
    Icon = "rbxassetid://10734931596" 
})

TabSuond:AddSection({ 
    Name = "الأغاني تحتاج جيم باس والكل يسمعها", 
    Icon = "rbxassetid://10734934132" 
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local musicList = {

    ["صوت رعد"] = "6994934244",
    ["غريتاو آآآآآاااا"] = "5853668794",
    ["ضحكة جون"] = "130759239",
    ["جوجوتسو كايسن"] = "18985328962",
    ["آآآآه"] = "9084006093",
    ["صوت بنت انمي 3"] = "103430674469051",
    ["سيرين نووي"] = "675587093",
    ["توجي"] = "132509237694639",
    ["ياميت كوداساي"] = "108494476595033",
    ["اغنيه 2"] = "98337901681441",
    ["ضحكة الساحرة ماين كرافت"] = "116214940486087",
    ["صوت ازعاج 3"] = "89442290120460",
    ["غوجو توسيع النطاق"] = "139787675170861",
    ["آآآآآااا"] = "80156405968805",
    ["سب 2"] = "7127692762",
    ["جراني"] = "1591860354",
    ["سوس"] = "6701126635",
    ["اوريتشيمارو"] = "135109036831389",
    ["صوت سلاح فري فاير"] = "6909650402",
    ["صوت فينوم"] = "126497226413207",
    ["توبيرز93 2"] = "18131809532",
    ["صوت انمي مزعج"] = "97551835622379",
    ["جامبسكير هوروروسو"] = "85435253347146",
    ["آآآآآه"] = "7772283448",
    ["صوت ازعاج"] = "146563959",
    ["صوت اسد"] = "9126101636",
    ["بديت آيفود بديت"] = "133843750864059",
    ["ذا بويلد وان"] = "137177653817621",
    ["جامبسكير 2"] = "110637995610528",
    ["ضحكة سونيك"] = "7337298420",
    ["ما أعرف كككك"] = "6549021381",
    ["صوت بنت انمي مشكوك فجد خالة عمتو"] = "109779146034241",
    ["اغنيه 4"] = "129338532445059",
    ["اغنية فينوم"] = "8086734311",
    ["تن تن"] = "130352079567406",
    ["صوت عالي"] = "6855150757",
    ["إستورا تيمبانو"] = "268116333",
    ["سب 1"] = "6536444735",
    ["صوت ازعاج 2"] = "94692079812822",
    ["أووه كووف كووف"] = "7056720271",
    ["قرأن 2"] = "1836685929",
    ["ضحكة مال سوكونا"] = "116395665143666",
    ["غريتينيهو"] = "5710016194",
    ["قران 1"] = "4711690175",
    ["سوس 2"] = "7153419575",
    ["أمونغاس"] = "6651571134",
    ["رايحة"] = "120034877160791",
    ["غاي غاي"] = "18786647417",
    ["غريتو 2"] = "91412024101709",
    ["ماندريك ديتيكتيد"] = "9068077052",
    ["كومبري أونلاين نا شوب"] = "8747441609",
    ["جيمد او"] = "106835463235574",
    ["توبيرز93 1"] = "270145703",
    ["غريتو"] = "80156405968805",
    ["صوت بنت انمي ثاني"] = "102993326623397",
    ["صوت فينوم"] = "126497226413207",
    ["صوت رعد"] = "6994934244",
    ["صوت ازعاج 3"] = "89442290120460",
    ["ضحكة جون"] = "130759239",
    ["اغنية 3"] = "93958751571254",
    ["يا شباب صلو علي النبي"] = "9108676586",
    ["حبيبي يا رسول الله 1"] = "131597210164474",
    ["حبيبي يا رسول الله 2"] = "91545096088459",
    ["فانق بافو دو بافو"] = "106317184644394",
}

local musicOptions = {}
for name,_ in pairs(musicList) do
    table.insert(musicOptions, name)
end
table.sort(musicOptions)

local selectedMusic = ""
local soundSpeed = 1
local soundVolume = 1
local soundRange = 100
local spamToggle = false
local spamTask = nil

TabSuond:AddDropdown({
    Name = "اختيار الصوت",
    Options = musicOptions,
    Default = musicOptions[1],
    Callback = function(selected)
        selectedMusic = musicList[selected]
    end
})

TabSuond:AddSlider({
    Name = "سرعة الصوت",
    Min = 0.5,
    Max = 2,
    Default = 1,
    Increment = 0.05,
    Callback = function(v)
        soundSpeed = v
    end
})

TabSuond:AddSlider({
    Name = "قوة الصوت",
    Min = 0,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(v)
        soundVolume = v
    end
})

TabSuond:AddSlider({
    Name = "مدى الصوت",
    Min = 10,
    Max = 300,
    Default = 100,
    Increment = 5,
    Callback = function(v)
        soundRange = v
    end
})

local function playOnce()
    if selectedMusic == "" then
        if NotifyEnabled then
            redzlib:MakeNotify({Title="LOC4T HUB",Text="اختار صوت أول شي",Time=2})
        end
        return
    end

    local audioID = selectedMusic
    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, audioID, 1)
    end

    task.wait(0.2)

    local GuinRemote = ReplicatedStorage.RE:FindFirstChild("1Gu1n")
    if not GuinRemote then return end

    for _,player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart

            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://"..audioID
            Sound.Volume = soundVolume
            Sound.PlaybackSpeed = soundSpeed
            Sound.RollOffMaxDistance = soundRange
            Sound.Parent = hrp
            Sound:Play()
            Sound.Ended:Connect(function()
                Sound:Destroy()
            end)

            pcall(function()
                firesignal(GuinRemote.OnClientEvent, table.unpack({
                    player, hrp, hrp,
                    Vector3.new(0,-1,0),
                    Vector3.new(0,0,0),
                    hrp, hrp,
                    audioID, audioID,
                    {[1]=true},
                    {25,Vector3.new(0.25,0.25,soundRange),BrickColor.new("Bright yellow"),0.25,Enum.Material.SmoothPlastic,0.25},
                    true,false
                }))
            end)

            pcall(function()
                GuinRemote:FireServer(table.unpack({
                    hrp, hrp,
                    Vector3.new(0,-1,0),
                    Vector3.new(0,0,0),
                    hrp, hrp,
                    audioID, audioID,
                    {[1]=true},
                    {25,Vector3.new(0.25,0.25,soundRange),BrickColor.new("Bright yellow"),0.25,Enum.Material.SmoothPlastic,0.25},
                    true,false
                }))
            end)
        end
    end

    if NotifyEnabled then
        redzlib:MakeNotify({Title="LOC4T HUB",Text="اشتغل الصوت",Time=2})
    end
end

TabSuond:AddButton({
    Name = "تشغيل مرة وحدة",
    Callback = function()
        playOnce()
    end
})

TabSuond:AddToggle({
    Name = "تشغيل سبام",
    Default = false,
    Callback = function(v)
        spamToggle = v
        if v then
            spamTask = task.spawn(function()
                while spamToggle do
                    playOnce()
                    task.wait(1)
                end
            end)
        else
            spamToggle = false
            if spamTask then
                task.cancel(spamTask)
                spamTask = nil
            end
        end
    end
})

local Tabmu123 = Window:MakeTab({"اغاني عربية", "music"})

Tabmu123:AddTextBox({
	Name = "مشغل اغاني للسكيت بورد",
	Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني",
	PlaceholderText = "ادخل الكود هنا",
	Callback = function(Value)

		local args1 = { [1] = "SkateBoard" }

		game:GetService("ReplicatedStorage")
			:WaitForChild("RE")
			:WaitForChild("1NoMoto1rVehicle1s")
			:FireServer(unpack(args1))

		local args2 = {
			[1] = "PickingScooterMusicText",
			[2] = Value
		}

		game:GetService("ReplicatedStorage")
			:WaitForChild("RE")
			:WaitForChild("1NoMoto1rVehicle1s")
			:FireServer(unpack(args2))
	end
})

Tabmu123:AddTextBox({
	Name = "مشغل اغاني للبيت",
	Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني",
	PlaceholderText = "ادخل الكود هنا",
	Callback = function(Value)

		local args = {
			[1] = "PickHouseMusicText",
			[2] = Value
		}

		game:GetService("ReplicatedStorage")
			:WaitForChild("RE")
			:WaitForChild("1Player1sHous1e")
			:FireServer(unpack(args))
	end
})

Tabmu123:AddTextBox({
	Name = "مشغل مجاني بدون قيمباس",
	Description = "ملاحظه: الناس تسمع اول جزء",
	PlaceholderText = "ادخل الكود هنا",
	Callback = function(Value)

		local args1 = { [1] = "SkateBoard" }

		game:GetService("ReplicatedStorage")
			:WaitForChild("RE")
			:WaitForChild("1NoMoto1rVehicle1s")
			:FireServer(unpack(args1))

		local args2 = {
			[1] = "PickingScooterMusicText",
			[2] = Value
		}

		game:GetService("ReplicatedStorage")
			:WaitForChild("RE")
			:WaitForChild("1NoMoto1rVehicle1s")
			:FireServer(unpack(args2))
	end
})

local Section = Tabmu123:AddSection({
	Name = "الاغاني العربية"
})

Tabmu123:AddButton({
	Name = "ياللالي و يالالا",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "116815742960163")
	end
})

Tabmu123:AddButton({
	Name = "اول مره حياتي تورد",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "122957821960545")
	end
})

Tabmu123:AddButton({
	Name = "ال ما يسئل علي ماريده لا الله وياه الله وياه",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "100812988870930")
	end
})

Tabmu123:AddButton({
	Name = "حبي طفى بلحظه جثى",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "99349482246952")
	end
})

Tabmu123:AddButton({
	Name = "ميلي و بخصرك ميلي",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "74895850882339")
	end
})

Tabmu123:AddButton({
	Name = "هاذي انتي من عرفك ما تغير فيكي شي",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "133788458900692")
	end
})

Tabmu123:AddButton({
	Name = "عراقي ميت اني من فركاك",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "98313375960954")
	end
})

Tabmu123:AddButton({
	Name = "عراقي اذوب اذوب",
	Callback = function()

		game.StarterGui:SetCore("SendNotification", {
			Title = "تم التشغيل",
			Text = "انتظر ثواني",
			Duration = 5
		})

		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("SkateBoard")
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", "111811908070601")
	end
})

local Tab125 = Window:MakeTab({
	Name = "اغاني اناشيد",
	Icon = "music"
})

local function Notify()
	game.StarterGui:SetCore("SendNotification", {
		Title = "تم التشغيل",
		Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل",
		Duration = 5
	})
end

local function Play(id)
	local args = { "SkateBoard" }
	game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

	local args2 = {
		"PickingScooterMusicText",
		id
	}
	game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
end

-- 1
Tab125:AddButton({
	Name = "اناشيد داعش تفيدك للصملات",
	Callback = function()

	Tab125:AddButton({
		Name = "تريد سجينة لو طلقة؟",
		Callback = function()
			Notify()
			Play("101745469796290")
		end
	})

end
})

-- 2
Tab125:AddButton({
	Name = "تريد سجينة لو طلقة ",
	Callback = function()
		Notify()
		Play("101745469796290")
	end
})

-- 3
Tab125:AddButton({
	Name = "امتي قد لاح فجرا٢",
	Callback = function()
		Notify()
		Play("74552337273631")
	end
})

-- 4
Tab125:AddButton({
	Name = "النصر توالى",
	Callback = function()
		Notify()
		Play("87915361949996")
	end
})

-- 5
Tab125:AddButton({
	Name = "صبحيهم بل بشائر",
	Callback = function()
		Notify()
		Play("80017487709494")
	end
})

-- 6
Tab125:AddButton({
	Name = "غضب غضب",
	Callback = function()
		Notify()
		Play("124393177931443")
	end
})

-- 7
Tab125:AddButton({
	Name = "الله اكبرر",
	Callback = function()
		Notify()
		Play("95202315397620")
	end
})

-- 8
Tab125:AddButton({
	Name = "ان امريكا",
	Callback = function()
		Notify()
		Play("70555008638726")
	end
})

-- 9
Tab125:AddButton({
	Name = "اطردوا المشريكن من جزيرة العرب",
	Callback = function()
		Notify()
		Play("119935649135652")
	end
})

-- 10
Tab125:AddButton({
	Name = "تلقى تلقى",
	Callback = function()
		Notify()
		Play("105870206299094")
	end
})

-- 11
Tab125:AddButton({
	Name = "قاتلوا",
	Callback = function()
		Notify()
		Play("119717709322767")
	end
})

-- 12
Tab125:AddButton({
	Name = "ان مكنكم الله",
	Callback = function()
		Notify()
		Play("98161509312897")
	end
})

-- 13
Tab125:AddButton({
	Name = "هزت رؤس القافلة",
	Callback = function()
		Notify()
		Play("75877681846924")
	end
})

-- 14
Tab125:AddButton({
	Name = "غضب غضب ٢",
	Callback = function()
		Notify()
		Play("113846733012782")
	end
})

-- 15
Tab125:AddButton({
	Name = "قالوا له",
	Callback = function()
		Notify()
		Play("118001441128581")
	end
})

-- 16
Tab125:AddButton({
	Name = "دولتي باقيه",
	Callback = function()
		Notify()
		Play("101402682007478")
	end
})

-- 17
Tab125:AddButton({
	Name = "ودعوا صليل صورام يشفي صدور المومنين",
	Callback = function()
		Notify()
		Play("125861618879629")
	end
})

-------------------------------------------------
-- قسم اغاني و قصايد
-------------------------------------------------

Tab125:AddButton({
	Name = "اغاني و قصايد",
	Callback = function()

	Tab125:AddButton({
		Name = "رايحة لعباس اعاتب",
		Callback = function()
			Notify()
			Play("118603331625054")
		end
	})

	Tab125:AddButton({
		Name = "هذا الاربعة و الاربعين على راسك",
		Callback = function()
			Notify()
			Play("99721931588642")
		end
	})

	Tab125:AddButton({
		Name = "اكعد من النوم اتريك",
		Callback = function()
			Notify()
			Play("92891141608020")
		end
	})

	Tab125:AddButton({
		Name = "اغنية عراقية ميت اني من فركاك",
		Callback = function()
			Notify()
			Play("98313375960954")
		end
	})

	Tab125:AddButton({
		Name = "اغنية عراقية اذوب اذوب",
		Callback = function()
			Notify()
			Play("111811908070601")
		end
	})

end
})

local BangTab = Window:MakeTab({"رحمه ما يشتغل حاليا", "rbxassetid://4483345998"})

BangTab:AddTextBox({
    Name = "اسم اللاعب المستهدف",
    Default = "",
    PlaceholderText = "اكتب الاسم هنا...",
    Callback = function(Value)
        getgenv().bangTarget = nil
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= lp and (v.Name:lower():find(Value:lower()) or v.DisplayName:lower():find(Value:lower())) then
                getgenv().bangTarget = v
                break
            end
        end
    end
})

BangTab:AddSlider({
    Name = "سرعة حركة البانج",
    Min = 0, Max = 1000, Default = 150,
    Callback = function(Value) getgenv().bangSpeed = Value end
})

BangTab:AddToggle({
    Name = "تفعيل البانج (الخلفي)",
    Default = false,
    Callback = function(V) getgenv().bangEnabled = V if not V then forceStand() end end
})

BangTab:AddToggle({
    Name = "تفعيل وضع الجلوس (الوجه)",
    Default = false,
    Callback = function(V) getgenv().faceSitEnabled = V if not V then forceStand() end end
})

BangTab:AddToggle({
    Name = "تفعيل الانبطاح السفلي",
    Default = false,
    Callback = function(V) getgenv().strapUnderEnabled = V if not V then forceStand() end end
})

BangTab:AddToggle({
    Name = "الجلوس الثابت فوق الرأس",
    Default = false,
    Callback = function(V) getgenv().headSitEnabled = V if not V then forceStand() end end
})
