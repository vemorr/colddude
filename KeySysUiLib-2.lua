local Keysys = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserId = game.Players.LocalPlayer.UserId
local uneverseId = game.GameId

local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/NotifyLib.lua"))()

local KeyUI = game:GetObjects("rbxassetid://11447016056")[1]

if gethui then
    KeyUI.Parent = gethui()
elseif syn.protect_gui then
    syn.protect_gui(KeyUI)
    KeyUI.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
    KeyUI.Parent = CoreGui:FindFirstChild("RobloxGui")
else
    KeyUI.Parent = CoreGui
end

local KeyMain = KeyUI.Main

function Keysys:MakeUI(KeySettings)
    -- Title, KeyLink, DiscordLink, ScriptLink
    KeyMain.Size = UDim2.new(0, 467, 0, 175)
    KeyMain.BackgroundTransparency = 1
    KeyMain.Shadow.Image.ImageTransparency = 1
    KeyMain.Title.TextTransparency = 1
    KeyMain.Subtitle.TextTransparency = 1
    KeyMain.KeyNote.TextTransparency = 1
    KeyMain.Input.BackgroundTransparency = 1
    KeyMain.Input.UIStroke.Transparency = 1
    KeyMain.Input.InputBox.TextTransparency = 1
    KeyMain.NoteTitle.TextTransparency = 1
    KeyMain.NoteMessage.TextTransparency = 1
    KeyMain.NoteMessage.DiscordBtn.TextTransparency = 1
    KeyMain.Hide.ImageTransparency = 1

    KeyMain.Title.Text = KeySettings.Title or "Unknow Title"
    KeyMain.NoteMessage.DiscordBtn.Text = "discord.gg/" ..KeySettings.DiscordID

    local function AddDraggingFunctionality(DragPoint, Main)
        pcall(function()
            local Dragging, DragInput, MousePos, FramePos = false
            DragPoint.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                    MousePos = Input.Position
                    FramePos = Main.Position

                    Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end)
                end
            end)
            DragPoint.InputChanged:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement then
                    DragInput = Input
                end
            end)
            UserInputService.InputChanged:Connect(function(Input)
                if Input == DragInput and Dragging then
                    local Delta = Input.Position - MousePos
                    TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale,
                            FramePos.Y.Offset + Delta.Y) }):Play()
                end
            end)
        end)
    end

    -- open ui
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 500, 0, 187) }):Play()
    TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 0.5 }):
        Play()
    wait(0.05)
    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    wait(0.05)
    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 0 }):Play()
    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 0 }):
        Play()
    wait(0.05)
    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
    TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
        { TextTransparency = 0 })
        :Play()
    wait(0.15)
    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 0.3 }):Play()

    -- hide
    KeyMain.Hide.MouseButton1Click:Connect(function()
        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 467, 0, 175) }):
            Play()
        TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { ImageTransparency = 1 })
            :
            Play()
        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):
            Play()
        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 1 }):
            Play()
        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 })
            :
            Play()
        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):
            Play()
        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):
            Play()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
            { TextTransparency = 1 }):Play()
        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        wait(0.51)
        KeyUI:Destroy()
    end)

    -- copy dicord server
    KeyMain.NoteMessage.DiscordBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/" .. KeySettings.DiscordID)
    end)

    KeyMain.NoteMessage.DiscordBtn.MouseEnter:Connect(function()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { TextColor3 = Color3.fromRGB(23, 30, 227) }):Play()
    end)

    KeyMain.NoteMessage.DiscordBtn.MouseLeave:Connect(function()
        TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { TextColor3 = Color3.fromRGB(240, 240, 240) }):Play()
    end)

    --key valid
    KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
        else
            if KeyMain.Input.InputBox.Text ==
                game:HttpGet("https://1.kelprepl.repl.co/verify/".. KeySettings.KeyLinkName .."?verify_key=" .. KeyMain.Input.InputBox.Text) then
                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                    { Size = UDim2.new(0, 467, 0, 175) })
                    :
                    Play()
                TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    { ImageTransparency = 1 })
                    :Play()
                TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    { TextTransparency = 1 }):
                    Play()
                TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { TextTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    { BackgroundTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    { Transparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    { TextTransparency = 1 })
                    :Play()
                TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                    { TextTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                    { TextTransparency = 1 })
                    :
                    Play()
                TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                    { TextTransparency = 1 }):Play()
                TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 })
                    :
                    Play()
                wait(0.51)
                writefile(KeySettings.Title .. ".txt", KeyMain.Input.InputBox.Text)
                local readfilekey = readfile(KeySettings.Title .. ".txt");
                if KeyMain.Input.InputBox.Text == game:HttpGet("https://1.kelprepl.repl.co/verify/".. KeySettings.KeyLinkName .."?verify_key=" .. KeyMain.Input.InputBox.Text) then -- checkkey no have file
                    loadstring(game:HttpGet(KeySettings.ScriptLink))()
                    appendfile(KeySettings.Title .. ".txt", KeyMain.Input.InputBox.Text);
                    notif:Notification("Sucefful", "Key valid lets start", 3)
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                        { Size = UDim2.new(0, 467, 0, 175) })
                        :
                        Play()
                    TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { ImageTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 }):
                        Play()
                    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { Transparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { ImageTransparency = 1 })
                        :
                        Play()
                    wait(0.51)
                    KeyUI:Destroy()
                else -- wrong key
                    notif:Notification("Warning", "Key not valid try again", 3)
                end
                if game:HttpGet("https://1.kelprepl.repl.co/verify/".. KeySettings.KeyLinkName .."?verify_key=" .. KeyMain.Input.InputBox.Text)
                    ==
                    readfilekey then -- check key on maked file
                    loadstring(game:HttpGet(KeySettings.ScriptLink))()
                    notif:Notification("Sucefful", "Key valid lets start", 3)
                    appendfile(KeySettings.Title .. ".txt", KeyMain.Input.InputBox.Text);
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                        { Size = UDim2.new(0, 467, 0, 175) })
                        :
                        Play()
                    TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { ImageTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 }):
                        Play()
                    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { Transparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 })
                        :
                        Play()
                    TweenService:Create(KeyMain.NoteMessage.DiscordBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { TextTransparency = 1 }):Play()
                    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                        { ImageTransparency = 1 })
                        :
                        Play()
                    wait(0.51)
                    KeyUI:Destroy()
                else -- wrong key
                    notif:Notification("Warning", "Key not valid try again", 3)
                end
            end
        end
    end)

    KeyUI.Main.Input.MouseEnter:Connect(function()
        TweenService:Create(KeyUI.Main.Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { Color = Color3.fromRGB(114, 1, 184) }):Play()
    end)

    KeyUI.Main.Input.MouseLeave:Connect(function()
        TweenService:Create(KeyUI.Main.Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            { Color = Color3.fromRGB(35, 35, 35) }):Play()
    end)

    AddDraggingFunctionality(KeyMain, KeyUI.Main)
end

return Keysys
