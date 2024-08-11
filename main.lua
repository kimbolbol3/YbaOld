local LocalPlayer = game.Players.LocalPlayer
local LocalGui = LocalPlayer:WaitForChild"PlayerGui"

local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local NEWHud = game:GetObjects("rbxassetid://18897978315")[1]
local Clicksound = LocalPlayer:FindFirstChild"Click3"
local tween = game:GetService"TweenService"
if Clicksound and Clicksound.ClassName == "Sound" then
    Clicksound.SoundId = "rbxassetid://179235828"
end
local mouseclicksound = LocalPlayer:FindFirstChild"MouseClick2"
if mouseclicksound and mouseclicksound.ClassName == "Sound" then
    mouseclicksound.SoundId = "rbxassetid://537744814"
end
local connection = {}
local function setupGui()
    local NEWHudClone = NEWHud:Clone()
    local NEWMain = NEWHudClone.Main2
    local newtogglehud = NEWMain.ToggleHUD
    local OLDHud = LocalGui:WaitForChild("HUD",50)
    local OLDMain = OLDHud:WaitForChild("Main",50)
    local OLDMoney = OLDMain:FindFirstChild"DropMoney"
    local OLDCooldown = OLDHud:FindFirstChild"Cooldowns"
    local SkillTre = NEWMain.Frames.SkillTrees
    local standstorage = NEWMain.Frames.StandStorage
    local stylestorage = NEWMain.Frames.StyleStorage
    standstorage.Parent = OLDMain.Frames
    stylestorage.Parent = OLDMain.Frames

    if LocalPlayer.PlayerStats:FindFirstChild"Slot1" then
        standstorage.Slot1.Locked:Destroy()
        standstorage.Slot1.Stand.Text = LocalPlayer.PlayerStats.Slot1.Value
        standstorage.Slot1.Swap.MouseButton1Click:Connect(function()
            standstorage.Slot1.Stand.Text = LocalPlayer.PlayerStats.Stand.Value
            LocalCharacter.RemoteEvent:FireServer("SwapStand","Slot1")
        end)
    else
        standstorage.Slot1.Stand:Destroy()
        standstorage.Slot1.Swap:Destroy()
    end

    if LocalPlayer.PlayerStats:FindFirstChild"Slot2" then
        standstorage.Slot2.Locked:Destroy()
        standstorage.Slot2.Stand.Text = LocalPlayer.PlayerStats.Slot2.Value
        standstorage.Slot2.Swap.MouseButton1Click:Connect(function()
            standstorage.Slot2.Stand.Text = LocalPlayer.PlayerStats.Stand.Value
            LocalCharacter.RemoteEvent:FireServer("SwapStand","Slot2")
        end)
    else
        standstorage.Slot2.Stand:Destroy()
        standstorage.Slot2.Swap:Destroy()
    end

    if LocalPlayer.PlayerStats:FindFirstChild"Slot3" then
        standstorage.Slot3.Locked:Destroy()
        standstorage.Slot3.Stand.Text = LocalPlayer.PlayerStats:FindFirstChild"Slot3".Value
        standstorage.Slot3.Swap.MouseButton1Click:Connect(function()
            standstorage.Slot3.Stand.Text = LocalPlayer.PlayerStats.Stand.Value
            LocalCharacter.RemoteEvent:FireServer("SwapStand","Slot3")
        end)
    else
        standstorage.Slot3.Stand:Destroy()
        standstorage.Slot3.Swap:Destroy()
    end

    if LocalPlayer.PlayerStats:FindFirstChild"Slot4" then
        standstorage.Slot4.Locked:Destroy()
        standstorage.Slot4.Stand.Text = LocalPlayer.PlayerStats:FindFirstChild"Slot4".Value
        standstorage.Slot4.Swap.MouseButton1Click:Connect(function()
            standstorage.Slot4.Stand.Text = LocalPlayer.PlayerStats.Stand.Value
            LocalCharacter.RemoteEvent:FireServer("SwapStand","Slot4")
        end)
    else
        standstorage.Slot4.Stand:Destroy()
        standstorage.Slot4.Swap:Destroy()
    end

    if LocalPlayer.PlayerStats:FindFirstChild"Slot5" then
        standstorage.Slot5.Locked:Destroy()
        standstorage.Slot5.Stand.Text = LocalPlayer.PlayerStats:FindFirstChild"Slot5".Value
        standstorage.Slot5.Swap.MouseButton1Click:Connect(function()
            standstorage.Slot5.Stand.Text = LocalPlayer.PlayerStats.Stand.Value
            LocalCharacter.RemoteEvent:FireServer("SwapStand","Slot5")
        end)
    else
        standstorage.Slot5.Stand:Destroy()
        standstorage.Slot5.Swap:Destroy()
    end

    for i=1,3 do
        if LocalPlayer.PlayerStats:FindFirstChild(`StyleSlot{i}`) then
            stylestorage[`Slot{i}`].Locked:Destroy()
            stylestorage[`Slot{i}`].Spec.Text = LocalPlayer.PlayerStats:FindFirstChild(`StyleSlot{i}`).Value
            stylestorage[`Slot{i}`].Swap.MouseButton1Click:Connect(function()
                stylestorage[`Slot{i}`].Spec.Text = LocalPlayer.PlayerStats.Spec.Value
                LocalCharacter.RemoteEvent:FireServer("SwapStyle",`StyleSlot{i}`)
            end)
        else
            stylestorage[`Slot{i}`].Spec:Destroy()
            stylestorage[`Slot{i}`].Swap:Destroy()
        end
    end
    

    local huddebounce
    local currentframe
    local hudvi = false
    local SkillTreeAssets = NEWHudClone.SkillTreeAssets
    game.ReplicatedStorage.Objects.SkillTreeAssets.SkillTreeGui:Destroy()
    game.ReplicatedStorage.Objects.SkillTreeAssets.CustomKeybind:Destroy()
    SkillTreeAssets.SkillTreeGui.Parent = game.ReplicatedStorage.Objects.SkillTreeAssets
    SkillTreeAssets.CustomKeybind.Parent = game.ReplicatedStorage.Objects.SkillTreeAssets
    NEWMain:FindFirstChild"DropMoney":Destroy()
    NEWMain.Parent = OLDHud
    OLDCooldown.Visible = false
    --OLDHud.SkillTree:Destroy()
    NEWHudClone.SkillTree.Name = "SkillTree2"
    NEWHudClone.SkillTree2.Parent = OLDHud
    OLDMain:FindFirstChild"ToggleHUD".Visible = false
    OLDMoney.Image = ""
    OLDMoney.ButtonIcon.Image = "rbxassetid://5928766404"
    OLDMoney.HoverText.Font = Enum.Font.Arcade
    newtogglehud.Parent = OLDMain
    OLDMain.Frames.Settings.CodeBox:Destroy()
    --OLDMain.Frames.Settings.TradeTextBox:Destroy()
    OLDMain.Frames.Settings.TradeTextBox.Visible = false
    OLDMain.Frames.Settings.HUDBack:Destroy()
    for i,v in pairs(NEWMain.Frames.Settings:GetChildren()) do
        if v.Name ~= "Information" then
            v.Parent = OLDMain.Frames.Settings
        end
    end
    OLDMain.Frames.Settings.Stand.TextLabel.Text = `STAND: {LocalPlayer.PlayerStats.Stand.Value}`
    OLDMain.Frames.Settings.Spec.TextLabel.Text = `FIGHTING-STYLE: {LocalPlayer.PlayerStats.Spec.Value}`
    OLDMain.Frames.Settings.Race.TextLabel.Text = `RACE: {LocalPlayer.PlayerStats.Race.Value}`
    SkillTre.SkillPoints.Text = `SKILL POINTS: {LocalPlayer.PlayerStats.SkillPoints.Value}`
    OLDHud.SkillTree2.SkillPoints.Text = `Skill Points: {LocalPlayer.PlayerStats.SkillPoints.Value}`
    connection["StandValue"] = LocalPlayer.PlayerStats.Stand:GetPropertyChangedSignal"Value":Connect(function()
        OLDMain.Frames.Settings.Stand.TextLabel.Text = `STAND: {LocalPlayer.PlayerStats.Stand.Value}`
    end)
    connection["SpecValue"] = LocalPlayer.PlayerStats.Spec:GetPropertyChangedSignal"Value":Connect(function()
        OLDMain.Frames.Settings.Spec.TextLabel.Text = `FIGHTING-STYLE: {LocalPlayer.PlayerStats.Spec.Value}`
    end)
    connection["RaceValue"] = LocalPlayer.PlayerStats.Race:GetPropertyChangedSignal"Value":Connect(function()
        OLDMain.Frames.Settings.Race.TextLabel.Text = `RACE: {LocalPlayer.PlayerStats.Race.Value}`
    end)
    connection["SkillPoints"] = LocalPlayer.PlayerStats.SkillPoints:GetPropertyChangedSignal"Value":Connect(function()
        SkillTre.SkillPoints.Text = `SKILL POINTS: {LocalPlayer.PlayerStats.SkillPoints.Value}`
        OLDHud.SkillTree2.SkillPoints.Text = `Skill Points: {LocalPlayer.PlayerStats.SkillPoints.Value}`
    end)
    connection["SkillTree"] = game:GetService"RunService".Heartbeat:Connect(function(deltaTime)
        if workspace:FindFirstChild"Skill Tree" then
            OLDHud.SkillTree.Visible = false
            OLDHud.SkillTree2.Visible = true
        end
    end)
    --OLDMain.Frames.Settings.Parent = NEWMain.Frames
    newtogglehud.MouseButton1Click:Connect(function()
        if huddebounce then return end
        huddebounce = true
        coroutine.resume(coroutine.create(function()
            wait(1)
            huddebounce = false
        end))
        if hudvi then
            game:GetService"StarterGui":SetCore("TopbarEnabled",true)
            tween:Create(game.Lighting:FindFirstChild"HUDBlur",TweenInfo.new(.5,Enum.EasingStyle.Quad),{
                Size = 0
            }):Play()
            OLDMain.Indicators.Visible = true
            OLDHud.Playerlist.Visible = true
            for i,v in pairs(NEWMain:GetChildren()) do
                if v.Name ~= "DropMoney" and v.Name ~= "ToggleHUD" and v:IsA"ImageButton" then
                    local oldvpos = v.Position
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(oldvpos.X.Scale,oldvpos.X.Offset,1,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Position = oldvpos
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(OLDMain.Frames:GetChildren()) do
                
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            hudvi = false
        else
            game:GetService"StarterGui":SetCore("TopbarEnabled",false)
            tween:Create(game.Lighting:FindFirstChild"HUDBlur",TweenInfo.new(.5,Enum.EasingStyle.Quad),{
                Size = 24
            }):Play()
            OLDMain.Indicators.Visible = false
            OLDHud.Playerlist.Visible = false
            for i,v in pairs(NEWMain:GetChildren()) do
                if v.Name ~= "DropMoney" and v.Name ~= "ToggleHUD" and v:IsA"ImageButton" then
                    print(v.Name)
                    v.Visible = true
                    local oldvpos = v.Position
                    v.Position = UDim2.new(oldvpos.X.Scale,oldvpos.X.Offset,1,0)
                    tween:Create(v,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position = oldvpos}):Play()
                end
            end
            for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(OLDMain.Frames:GetChildren()) do
                
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            hudvi = true
        end
    end)



    local function ToggleFrame(Frame)
        for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
            if v.Visible and v.Size ~= UDim2.new(0,0,0,0) and v.Name == Frame.Name then
                local oldvsize = v.Size
                local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                tw:Play()
                tw.Completed:Connect(function()
                    v.Size = oldvsize
                    v.Visible = false
                end)
                return
            elseif v.Visible and v.Size ~= UDim2.new(0,0,0,0) then
                local oldvsize = v.Size
                local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                tw:Play()
                tw.Completed:Connect(function()
                    v.Size = oldvsize
                    v.Visible = false
                end)
            end
        end
        for i,v in pairs(OLDMain.Frames:GetChildren()) do
            
            if v.Visible and v.Size ~= UDim2.new(0,0,0,0) and v.Name == Frame.Name then
                local oldvsize = v.Size
                local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                tw:Play()
                tw.Completed:Connect(function()
                    v.Size = oldvsize
                    v.Visible = false
                end)
                return
            elseif v.Visible and v.Size ~= UDim2.new(0,0,0,0) then
                local oldvsize = v.Size
                local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                tw:Play()
                tw.Completed:Connect(function()
                    v.Size = oldvsize
                    v.Visible = false
                end)
            end
        end
        if Frame.Name == "Settings" then
            for i,v in pairs(Frame:GetChildren()) do
                if v:IsA"ImageLabel" then
                    v.Visible = true
                end
            end
        end
        currentframe = Frame.Name
        Frame.Size = UDim2.new(0,0,0,0)
        Frame.Visible = true
        tween:Create(Frame,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
            Size = UDim2.new(0.463, 0,0.486, 0)
        }):Play()
    end

    NEWMain.ToggleGang.MouseButton1Click:Connect(function()
        firesignal(OLDMain.Frames.Character.ScrollingFrame2.Gang.MouseButton1Click)
        ToggleFrame(OLDMain.Frames.Gang)
        OLDMain.Frames.Gang.BackCharacter.Visible = false
    end)

    NEWMain.ToggleQuest.MouseButton1Click:Connect(function()
        firesignal(OLDMain.ToggleQuest.MouseButton1Click)
        ToggleFrame(OLDMain.Frames.Quest)
        OLDMain.Frames.Quest.HUDBack.Visible = false
    end)

    NEWMain.ToggleCosmetics.MouseButton1Click:Connect(function()
        firesignal(OLDMain.Frames.Character.ScrollingFrame2.Cosmetics.MouseButton1Click)
        ToggleFrame(OLDMain.Frames.Cosmetics)
        if OLDMain.Frames.Cosmetics.BackCharacter then
            OLDMain.Frames.Cosmetics.BackCharacter:Destroy()
        end
    end)

    NEWMain.ToggleStore.MouseButton1Click:Connect(function()
        firesignal(OLDMain.Frames.Store.ScrollingFrame.ToggleStandShop.Button.MouseButton1Click)
        ToggleFrame(OLDMain.Frames.StandShop)
        OLDMain.Frames.StandShop.BackStore.Visible = false
    end)

    NEWMain.ToggleSettings.MouseButton1Click:Connect(function()
        print("load")
        ToggleFrame(OLDMain.Frames.Settings)
        for i,v in pairs(OLDMain.Frames.Settings:GetChildren()) do
            if v:IsA"ImageLabel" then
                v.Visible = true
            end
        end
    end)
    NEWMain.ToggleStatistics.MouseButton1Click:Connect(function()
        ToggleFrame(SkillTre)
        if LocalPlayer.PlayerStats.Stand.Value ~= "None" and SkillTre.Stand:FindFirstChild"Locked" then
            SkillTre.Stand.Locked:Destroy()
        end
        if LocalPlayer.PlayerStats.Spec.Value ~= "None" and SkillTre.Spec:FindFirstChild"Locked" then
            SkillTre.Spec.Locked:Destroy()
        end
    end)



    NEWMain.ToggleStands.MouseButton1Click:Connect(function()
        ToggleFrame(standstorage)
        for i,v in pairs(standstorage:GetDescendants()) do
            if v:IsA"TextButton" or v:IsA"ImageButton" or v:IsA"TextLabel" or v:IsA"ImageLabel" or v:IsA"TextBox" then
                v.Visible = true
            end
        end
    end)
    standstorage.SwitchStorages.MouseButton1Click:Connect(function()
        ToggleFrame(stylestorage)
        for i,v in pairs(stylestorage:GetDescendants()) do
            if v:IsA"TextButton" or v:IsA"ImageButton" or v:IsA"TextLabel" or v:IsA"ImageLabel" or v:IsA"TextBox" then
                v.Visible = true
            end
        end
    end)
    stylestorage.SwitchStorages.MouseButton1Click:Connect(function()
        ToggleFrame(standstorage)
        for i,v in pairs(stylestorage:GetDescendants()) do
            if v:IsA"TextButton" or v:IsA"ImageButton" or v:IsA"TextLabel" or v:IsA"ImageLabel" or v:IsA"TextBox" then
                v.Visible = true
            end
        end
    end)

    SkillTre.Spec.MouseButton1Click:Connect(function()
        if LocalPlayer.PlayerStats.Spec.Value ~= "None" then
            firesignal(OLDMain.Frames.FightingStyles.ScrollingFrame.Equipped.MouseButton1Click)
            firesignal(OLDMain.Frames.FightingStyles.SkillTree.MouseButton1Click)
            game:GetService"StarterGui":SetCore("TopbarEnabled",false)
            tween:Create(game.Lighting:FindFirstChild"HUDBlur",TweenInfo.new(.5,Enum.EasingStyle.Quad),{
                Size = 0
            }):Play()
            OLDMain.Indicators.Visible = true
            OLDHud.Playerlist.Visible = true
            for i,v in pairs(NEWMain:GetChildren()) do
                if v.Name ~= "DropMoney" and v.Name ~= "ToggleHUD" and v:IsA"ImageButton" then
                    local oldvpos = v.Position
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(oldvpos.X.Scale,oldvpos.X.Offset,1,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Position = oldvpos
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(OLDMain.Frames:GetChildren()) do
                
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            wait(0.5)
            OLDHud.SkillTree.Visible = false
            OLDHud.SkillTree2.Visible = true
        end
    end)
    SkillTre.Stand.MouseButton1Click:Connect(function()
        if LocalPlayer.PlayerStats.Stand.Value ~= "None" then
            firesignal(OLDMain.Frames.Stands.ScrollingFrame.Equipped.MouseButton1Click)
            firesignal(OLDMain.Frames.Stands.SkillTree.MouseButton1Click)
            game:GetService"StarterGui":SetCore("TopbarEnabled",false)
            tween:Create(game.Lighting:FindFirstChild"HUDBlur",TweenInfo.new(.5,Enum.EasingStyle.Quad),{
                Size = 0
            }):Play()
            OLDMain.Indicators.Visible = true
            OLDHud.Playerlist.Visible = true
            for i,v in pairs(NEWMain:GetChildren()) do
                if v.Name ~= "DropMoney" and v.Name ~= "ToggleHUD" and v:IsA"ImageButton" then
                    local oldvpos = v.Position
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(oldvpos.X.Scale,oldvpos.X.Offset,1,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Position = oldvpos
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(OLDMain.Frames:GetChildren()) do
                
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            wait(0.5)
            OLDHud.SkillTree.Visible = false
            OLDHud.SkillTree2.Visible = true
        end
    end)
    SkillTre.Character.MouseButton1Click:Connect(function()
            firesignal(OLDMain.Frames.Character.ScrollingFrame2.SkillTree.MouseButton1Click)
            game:GetService"StarterGui":SetCore("TopbarEnabled",false)
            tween:Create(game.Lighting:FindFirstChild"HUDBlur",TweenInfo.new(.5,Enum.EasingStyle.Quad),{
                Size = 0
            }):Play()
            OLDMain.Indicators.Visible = true
            OLDHud.Playerlist.Visible = true
            for i,v in pairs(NEWMain:GetChildren()) do
                if v.Name ~= "DropMoney" and v.Name ~= "ToggleHUD" and v:IsA"ImageButton" then
                    local oldvpos = v.Position
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(oldvpos.X.Scale,oldvpos.X.Offset,1,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Position = oldvpos
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(NEWMain.Frames:GetChildren()) do
            
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            for i,v in pairs(OLDMain.Frames:GetChildren()) do
                
                if v.Visible then
                    local oldvsize = v.Size
                    local tw = tween:Create(v,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        v.Size = oldvsize
                        v.Visible = false
                    end)
                end
            end
            wait(0.5)
            OLDHud.SkillTree.Visible = false
            OLDHud.SkillTree2.Visible = true
    end)

    OLDHud.SkillTree2.Exit.MouseButton1Click:Connect(function()
        firesignal(OLDHud.SkillTree.Exit.MouseButton1Click)
        wait(0.8)
        game:GetService"StarterGui":SetCore("TopbarEnabled",true)
        OLDHud.SkillTree2.Visible = false
    end)

    local newcooldown = NEWHudClone.Cooldowns2
    newcooldown.Parent = OLDHud
    local cooldownchangedebounce = false
    local function sortCooldowns(Frame,Idx1,Idx2)
        local Cooldowns = {}
        if #Frame:GetChildren() <= 0 then
            return
        end
        repeat wait() until not cooldownchangedebounce
        cooldownchangedebounce = true
        for _,v in ipairs(Frame:GetChildren()) do
            if v:IsA"ImageButton" and v:FindFirstChild"Cooldown" then
                table.insert(Cooldowns,{
                    Button = v,
                    Cooldown = v.Cooldown.Value
                })
            end
        end
        table.sort(Cooldowns,function(a,b)
            return a.Cooldown < b.Cooldown
        end)
    
        local Incr,Incr2,Incr3 = 0,0,0
    
        for _,v in pairs(Cooldowns) do
            tween:Create(v.Button,TweenInfo.new(.1,Enum.EasingStyle.Linear),{
                Position = Frame.Parent.Template.Position - UDim2.new(.06 * Incr3,0,Incr2,0)
            }):Play()
            Incr += 1
            Incr3 += 1
            if Idx1 <= Incr3 then
                Incr3 = 0
                Incr2 += .1
            end
            if Idx1 * Idx2 <= Incr then
                v.Button.Visible = false--:Destroy()
            else
                v.Button.Visible = true
            end
        end
        cooldownchangedebounce = false
    end
    OLDHud.Cooldowns.Frame.ChildAdded:Connect(function(child)
        
        local clon = newcooldown.Template:Clone()
        clon.Visible = true
        clon.Parent = newcooldown.Frame
        clon.Cooldown.Value = child.Cooldown.Value
        clon.Name = child.Name
        clon.TextLabel.Text = child.SkillName.Text
        tween:Create(clon.Indicator,TweenInfo.new(child.Cooldown.Value,Enum.EasingStyle.Linear),{Size = UDim2.new(0,0,1,0)}):Play()
        game:GetService"Debris":AddItem(clon,child.Cooldown.Value)
        coroutine.resume(coroutine.create(function()
            sortCooldowns(newcooldown.Frame,3,2)
            wait(clon.Cooldown.Value)
            sortCooldowns(newcooldown.Frame,3,2)
            clon:Destroy()
        end))

    end)

    for i,v in pairs(OLDHud:GetDescendants()) do
        if v:IsA"TextButton" or v:IsA("ImageButton") then
            v.MouseEnter:Connect(function()
                Clicksound:Play()
                if v:FindFirstChild"HoverText" then
                    v:FindFirstChild"HoverText".Visible = true
                end
            end)
            v.MouseLeave:Connect(function()
                if v:FindFirstChild"HoverText" then
                    v:FindFirstChild"HoverText".Visible = false
                end
            end)
            v.MouseButton1Click:Connect(function()
                mouseclicksound:Play()
            end)
        end
    end

end

setupGui()

game.Workspace.Living.ChildAdded:Connect(function(child)
    if child.Name == LocalPlayer.Name then
        connection["StandValue"]:Disconnect()
        connection["SpecValue"]:Disconnect()
        connection["RaceValue"]:Disconnect()
        connection["SkillPoints"]:Disconnect()
        connection["SkillTree"]:Disconnect()
        setupGui()
        wait(2)
        LocalCharacter = child
        
    end
end)

