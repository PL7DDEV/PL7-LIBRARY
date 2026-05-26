 --[[
    ██████╗ ██╗      ███████╗    ██╗   ██╗██╗
    ██╔══██╗██║      ╚════██║    ██║   ██║██║
    ██████╔╝██║          ██╔╝    ██║   ██║██║
    ██╔═══╝ ██║         ██╔╝     ██║   ██║██║
    ██║     ███████╗    ██║      ╚██████╔╝██║
    ╚═╝     ╚══════╝    ╚═╝       ╚═════╝ ╚═╝
    PL7 UI  New Style  --  Split Panel  --  v1.0.0
    Sidebar com icones grandes | Cards com descricao
    Gotham | Firebase | Roles | Sounds | Scroll Tabs
--]]

local PL7New = {}
PL7New.__index = PL7New

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService      = game:GetService("HttpService")
local SoundService     = game:GetService("SoundService")
local CoreGui          = game:GetService("CoreGui")
local LocalPlayer      = Players.LocalPlayer

-- ============================================================
--  SOUNDS
-- ============================================================
local Sounds = {}
local SoundIds = {
    open    = "rbxassetid://6026984224",
    close   = "rbxassetid://6026984224",
    toggle  = "rbxassetid://6026984224",
    click   = "rbxassetid://6026984224",
    hover   = "rbxassetid://6026984224",
    notify  = "rbxassetid://6026984224",
    error   = "rbxassetid://6026984224",
}

local function playSound(name, vol, pitch)
    pcall(function()
        if not Sounds[name] then
            local s = Instance.new("Sound")
            s.SoundId    = SoundIds[name] or SoundIds.click
            s.Volume     = vol   or 0.18
            s.PlaybackSpeed = pitch or 1
            s.RollOffMaxDistance = 0
            s.Parent     = SoundService
            Sounds[name] = s
        end
        local s = Sounds[name]
        s.Volume = vol or 0.18
        s.PlaybackSpeed = pitch or 1
        s:Play()
    end)
end

-- ============================================================
--  THEMES  (mesmo sistema do Old, compativel)
-- ============================================================
PL7New.Themes = {
    Black = {
        Name="Black",
        Background=Color3.fromRGB(7,7,9),
        TopBar=Color3.fromRGB(10,10,13),
        Sidebar=Color3.fromRGB(6,6,8),
        Content=Color3.fromRGB(9,9,12),
        Card=Color3.fromRGB(13,13,17),
        Accent=Color3.fromRGB(255,107,53),
        AccentDark=Color3.fromRGB(120,45,15),
        AccentGlow=Color3.fromRGB(255,107,53),
        Border=Color3.fromRGB(28,28,34),
        Text=Color3.fromRGB(235,235,240),
        TextDim=Color3.fromRGB(100,100,110),
        Toggle=Color3.fromRGB(24,24,30),
        ToggleOn=Color3.fromRGB(255,107,53),
        Sub=Color3.fromRGB(11,11,14),
        Slider=Color3.fromRGB(255,107,53),
        Notification=Color3.fromRGB(12,12,15),
        ScrollBar=Color3.fromRGB(255,107,53),
        IconActive=Color3.fromRGB(255,107,53),
        IconInactive=Color3.fromRGB(45,45,55),
    },
    Ghost = {
        Name="Ghost",
        Background=Color3.fromRGB(8,10,18),
        TopBar=Color3.fromRGB(12,16,30),
        Sidebar=Color3.fromRGB(6,8,16),
        Content=Color3.fromRGB(10,13,22),
        Card=Color3.fromRGB(14,18,32),
        Accent=Color3.fromRGB(90,170,255),
        AccentDark=Color3.fromRGB(25,60,130),
        AccentGlow=Color3.fromRGB(90,170,255),
        Border=Color3.fromRGB(22,40,80),
        Text=Color3.fromRGB(200,220,255),
        TextDim=Color3.fromRGB(80,110,160),
        Toggle=Color3.fromRGB(18,36,72),
        ToggleOn=Color3.fromRGB(90,170,255),
        Sub=Color3.fromRGB(10,14,26),
        Slider=Color3.fromRGB(90,170,255),
        Notification=Color3.fromRGB(12,16,30),
        ScrollBar=Color3.fromRGB(90,170,255),
        IconActive=Color3.fromRGB(90,170,255),
        IconInactive=Color3.fromRGB(30,50,90),
    },
    Blood = {
        Name="Blood",
        Background=Color3.fromRGB(10,4,6),
        TopBar=Color3.fromRGB(16,6,8),
        Sidebar=Color3.fromRGB(8,3,5),
        Content=Color3.fromRGB(12,5,7),
        Card=Color3.fromRGB(18,7,9),
        Accent=Color3.fromRGB(215,40,40),
        AccentDark=Color3.fromRGB(90,10,10),
        AccentGlow=Color3.fromRGB(215,40,40),
        Border=Color3.fromRGB(60,16,18),
        Text=Color3.fromRGB(255,185,185),
        TextDim=Color3.fromRGB(140,75,75),
        Toggle=Color3.fromRGB(50,10,12),
        ToggleOn=Color3.fromRGB(215,40,40),
        Sub=Color3.fromRGB(14,5,6),
        Slider=Color3.fromRGB(215,40,40),
        Notification=Color3.fromRGB(16,6,7),
        ScrollBar=Color3.fromRGB(215,40,40),
        IconActive=Color3.fromRGB(215,40,40),
        IconInactive=Color3.fromRGB(60,16,18),
    },
    Void = {
        Name="Void",
        Background=Color3.fromRGB(8,6,16),
        TopBar=Color3.fromRGB(14,10,28),
        Sidebar=Color3.fromRGB(6,5,14),
        Content=Color3.fromRGB(10,7,18),
        Card=Color3.fromRGB(15,11,28),
        Accent=Color3.fromRGB(160,95,190),
        AccentDark=Color3.fromRGB(65,28,90),
        AccentGlow=Color3.fromRGB(160,95,190),
        Border=Color3.fromRGB(55,30,90),
        Text=Color3.fromRGB(225,195,255),
        TextDim=Color3.fromRGB(115,85,160),
        Toggle=Color3.fromRGB(44,18,68),
        ToggleOn=Color3.fromRGB(160,95,190),
        Sub=Color3.fromRGB(12,8,22),
        Slider=Color3.fromRGB(160,95,190),
        Notification=Color3.fromRGB(14,9,26),
        ScrollBar=Color3.fromRGB(160,95,190),
        IconActive=Color3.fromRGB(160,95,190),
        IconInactive=Color3.fromRGB(55,30,90),
    },
    Emerald = {
        Name="Emerald",
        Background=Color3.fromRGB(4,13,8),
        TopBar=Color3.fromRGB(6,20,12),
        Sidebar=Color3.fromRGB(3,10,6),
        Content=Color3.fromRGB(5,15,9),
        Card=Color3.fromRGB(8,22,14),
        Accent=Color3.fromRGB(52,220,118),
        AccentDark=Color3.fromRGB(14,80,40),
        AccentGlow=Color3.fromRGB(52,220,118),
        Border=Color3.fromRGB(16,70,36),
        Text=Color3.fromRGB(185,255,215),
        TextDim=Color3.fromRGB(75,145,105),
        Toggle=Color3.fromRGB(8,44,22),
        ToggleOn=Color3.fromRGB(52,220,118),
        Sub=Color3.fromRGB(5,16,10),
        Slider=Color3.fromRGB(52,220,118),
        Notification=Color3.fromRGB(6,18,11),
        ScrollBar=Color3.fromRGB(52,220,118),
        IconActive=Color3.fromRGB(52,220,118),
        IconInactive=Color3.fromRGB(16,70,36),
    },
    Gold = {
        Name="Gold",
        Background=Color3.fromRGB(14,10,4),
        TopBar=Color3.fromRGB(22,16,5),
        Sidebar=Color3.fromRGB(10,7,3),
        Content=Color3.fromRGB(16,11,5),
        Card=Color3.fromRGB(24,17,6),
        Accent=Color3.fromRGB(255,200,0),
        AccentDark=Color3.fromRGB(120,85,0),
        AccentGlow=Color3.fromRGB(255,200,0),
        Border=Color3.fromRGB(100,75,6),
        Text=Color3.fromRGB(255,242,185),
        TextDim=Color3.fromRGB(165,135,65),
        Toggle=Color3.fromRGB(70,48,0),
        ToggleOn=Color3.fromRGB(255,200,0),
        Sub=Color3.fromRGB(18,13,4),
        Slider=Color3.fromRGB(255,200,0),
        Notification=Color3.fromRGB(20,14,4),
        ScrollBar=Color3.fromRGB(255,200,0),
        IconActive=Color3.fromRGB(255,200,0),
        IconInactive=Color3.fromRGB(100,75,6),
    },
    Ice = {
        Name="Ice",
        Background=Color3.fromRGB(10,16,22),
        TopBar=Color3.fromRGB(14,24,36),
        Sidebar=Color3.fromRGB(7,12,18),
        Content=Color3.fromRGB(12,18,26),
        Card=Color3.fromRGB(16,25,36),
        Accent=Color3.fromRGB(110,225,255),
        AccentDark=Color3.fromRGB(24,90,140),
        AccentGlow=Color3.fromRGB(110,225,255),
        Border=Color3.fromRGB(28,90,140),
        Text=Color3.fromRGB(205,242,255),
        TextDim=Color3.fromRGB(80,145,185),
        Toggle=Color3.fromRGB(16,52,82),
        ToggleOn=Color3.fromRGB(110,225,255),
        Sub=Color3.fromRGB(10,18,28),
        Slider=Color3.fromRGB(110,225,255),
        Notification=Color3.fromRGB(12,20,30),
        ScrollBar=Color3.fromRGB(110,225,255),
        IconActive=Color3.fromRGB(110,225,255),
        IconInactive=Color3.fromRGB(28,90,140),
    },
    Rose = {
        Name="Rose",
        Background=Color3.fromRGB(16,8,12),
        TopBar=Color3.fromRGB(24,11,17),
        Sidebar=Color3.fromRGB(12,6,9),
        Content=Color3.fromRGB(20,10,15),
        Card=Color3.fromRGB(28,13,20),
        Accent=Color3.fromRGB(255,105,155),
        AccentDark=Color3.fromRGB(120,35,70),
        AccentGlow=Color3.fromRGB(255,105,155),
        Border=Color3.fromRGB(100,38,65),
        Text=Color3.fromRGB(255,202,222),
        TextDim=Color3.fromRGB(165,95,130),
        Toggle=Color3.fromRGB(75,18,40),
        ToggleOn=Color3.fromRGB(255,105,155),
        Sub=Color3.fromRGB(20,9,14),
        Slider=Color3.fromRGB(255,105,155),
        Notification=Color3.fromRGB(22,10,16),
        ScrollBar=Color3.fromRGB(255,105,155),
        IconActive=Color3.fromRGB(255,105,155),
        IconInactive=Color3.fromRGB(100,38,65),
    },
    Ash = {
        Name="Ash",
        Background=Color3.fromRGB(14,14,16),
        TopBar=Color3.fromRGB(20,20,24),
        Sidebar=Color3.fromRGB(11,11,13),
        Content=Color3.fromRGB(18,18,21),
        Card=Color3.fromRGB(24,24,28),
        Accent=Color3.fromRGB(185,185,205),
        AccentDark=Color3.fromRGB(70,70,90),
        AccentGlow=Color3.fromRGB(185,185,205),
        Border=Color3.fromRGB(50,50,65),
        Text=Color3.fromRGB(222,222,232),
        TextDim=Color3.fromRGB(105,105,125),
        Toggle=Color3.fromRGB(42,42,55),
        ToggleOn=Color3.fromRGB(185,185,205),
        Sub=Color3.fromRGB(18,18,22),
        Slider=Color3.fromRGB(185,185,205),
        Notification=Color3.fromRGB(18,18,22),
        ScrollBar=Color3.fromRGB(185,185,205),
        IconActive=Color3.fromRGB(185,185,205),
        IconInactive=Color3.fromRGB(50,50,65),
    },
    Ocean = {
        Name="Ocean",
        Background=Color3.fromRGB(5,14,26),
        TopBar=Color3.fromRGB(7,20,38),
        Sidebar=Color3.fromRGB(4,10,20),
        Content=Color3.fromRGB(7,17,32),
        Card=Color3.fromRGB(9,22,42),
        Accent=Color3.fromRGB(0,188,212),
        AccentDark=Color3.fromRGB(0,70,90),
        AccentGlow=Color3.fromRGB(0,188,212),
        Border=Color3.fromRGB(0,72,100),
        Text=Color3.fromRGB(185,242,252),
        TextDim=Color3.fromRGB(65,140,165),
        Toggle=Color3.fromRGB(0,36,62),
        ToggleOn=Color3.fromRGB(0,188,212),
        Sub=Color3.fromRGB(5,16,30),
        Slider=Color3.fromRGB(0,188,212),
        Notification=Color3.fromRGB(6,18,34),
        ScrollBar=Color3.fromRGB(0,188,212),
        IconActive=Color3.fromRGB(0,188,212),
        IconInactive=Color3.fromRGB(0,72,100),
    },
    Sunset = {
        Name="Sunset",
        Background=Color3.fromRGB(16,8,14),
        TopBar=Color3.fromRGB(24,11,17),
        Sidebar=Color3.fromRGB(12,6,10),
        Content=Color3.fromRGB(20,10,16),
        Card=Color3.fromRGB(28,13,20),
        Accent=Color3.fromRGB(255,130,60),
        AccentDark=Color3.fromRGB(130,48,8),
        AccentGlow=Color3.fromRGB(255,130,60),
        Border=Color3.fromRGB(120,48,22),
        Text=Color3.fromRGB(255,225,200),
        TextDim=Color3.fromRGB(170,110,82),
        Toggle=Color3.fromRGB(80,28,10),
        ToggleOn=Color3.fromRGB(255,130,60),
        Sub=Color3.fromRGB(22,10,14),
        Slider=Color3.fromRGB(255,130,60),
        Notification=Color3.fromRGB(24,11,15),
        ScrollBar=Color3.fromRGB(255,130,60),
        IconActive=Color3.fromRGB(255,130,60),
        IconInactive=Color3.fromRGB(120,48,22),
    },
    Mint = {
        Name="Mint",
        Background=Color3.fromRGB(6,16,14),
        TopBar=Color3.fromRGB(8,24,20),
        Sidebar=Color3.fromRGB(5,12,10),
        Content=Color3.fromRGB(8,19,17),
        Card=Color3.fromRGB(10,26,23),
        Accent=Color3.fromRGB(100,235,195),
        AccentDark=Color3.fromRGB(16,90,72),
        AccentGlow=Color3.fromRGB(100,235,195),
        Border=Color3.fromRGB(18,90,72),
        Text=Color3.fromRGB(195,252,235),
        TextDim=Color3.fromRGB(72,152,128),
        Toggle=Color3.fromRGB(10,48,38),
        ToggleOn=Color3.fromRGB(100,235,195),
        Sub=Color3.fromRGB(7,18,16),
        Slider=Color3.fromRGB(100,235,195),
        Notification=Color3.fromRGB(8,20,18),
        ScrollBar=Color3.fromRGB(100,235,195),
        IconActive=Color3.fromRGB(100,235,195),
        IconInactive=Color3.fromRGB(18,90,72),
    },
}

-- ============================================================
--  HELPERS
-- ============================================================
local function tw(obj,props,t,style,dir)
    TweenService:Create(obj,TweenInfo.new(t or 0.18,style or Enum.EasingStyle.Quad,dir or Enum.EasingDirection.Out),props):Play()
end
local function mkCorner(p,r) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 8); c.Parent=p; return c end
local function mkStroke(p,col,thick,trans) local s=Instance.new("UIStroke"); s.Color=col; s.Thickness=thick or 1; s.Transparency=trans or 0; s.Parent=p; return s end
local function mkPad(p,t,b,l,r) local u=Instance.new("UIPadding"); u.PaddingTop=UDim.new(0,t or 6); u.PaddingBottom=UDim.new(0,b or 6); u.PaddingLeft=UDim.new(0,l or 10); u.PaddingRight=UDim.new(0,r or 10); u.Parent=p; return u end
local function mkList(p,dir,sp) local l=Instance.new("UIListLayout"); l.FillDirection=dir or Enum.FillDirection.Vertical; l.Padding=UDim.new(0,sp or 4); l.SortOrder=Enum.SortOrder.LayoutOrder; l.Parent=p; return l end
local function mkFrm(parent,size,pos,col,trans) local f=Instance.new("Frame"); f.Size=size or UDim2.new(1,0,0,36); f.Position=pos or UDim2.new(0,0,0,0); f.BackgroundColor3=col or Color3.fromRGB(10,10,14); f.BackgroundTransparency=trans or 0; f.BorderSizePixel=0; f.Parent=parent; return f end

local function mkLbl(parent,text,sz,col,xa)
    local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Text=text or ""; l.TextSize=sz or 13
    l.TextColor3=col or Color3.fromRGB(230,230,230); l.Font=Enum.Font.Gotham
    l.TextXAlignment=xa or Enum.TextXAlignment.Left; l.TextYAlignment=Enum.TextYAlignment.Center
    l.RichText=true; l.Size=UDim2.new(1,0,0,(sz or 13)+6); l.Parent=parent; return l
end

local function mkBtn(parent,text,sz,col,bg)
    local b=Instance.new("TextButton"); b.BackgroundColor3=bg or Color3.fromRGB(22,22,26)
    b.Text=text or ""; b.TextSize=sz or 13; b.TextColor3=col or Color3.fromRGB(230,230,230)
    b.Font=Enum.Font.Gotham; b.AutoButtonColor=false; b.BorderSizePixel=0
    b.RichText=true; b.Parent=parent; return b
end

local function mkScroll(parent,col,accent)
    local s=Instance.new("ScrollingFrame"); s.BackgroundColor3=col or Color3.fromRGB(9,9,11)
    s.BackgroundTransparency=0; s.BorderSizePixel=0; s.ScrollBarThickness=3
    s.ScrollBarImageColor3=accent or Color3.fromRGB(255,107,53)
    s.CanvasSize=UDim2.new(0,0,0,0); s.AutomaticCanvasSize=Enum.AutomaticSize.Y
    s.Size=UDim2.new(1,0,1,0); s.Parent=parent; return s
end

local function mkDrag(handle,target)
    local dragging,dragInput,dragStart,startPos=false,nil,nil,nil
    local function update(inp) local d=inp.Position-dragStart; tw(target,{Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)},0.07) end
    handle.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=inp.Position; startPos=target.Position
            inp.Changed:Connect(function() if inp.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    handle.InputChanged:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then dragInput=inp end end)
    UserInputService.InputChanged:Connect(function(inp) if inp==dragInput and dragging then update(inp) end end)
end

-- ============================================================
--  SCREEN GUI
-- ============================================================
local ScreenGui=Instance.new("ScreenGui"); ScreenGui.Name="PL7UINew"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; ScreenGui.IgnoreGuiInset=true
pcall(function() ScreenGui.Parent=CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent=LocalPlayer:WaitForChild("PlayerGui") end

-- Notif holder
local NotifHolder=mkFrm(ScreenGui,UDim2.new(0,290,1,0),UDim2.new(1,-302,0,0),Color3.new(0,0,0),1)
NotifHolder.Name="PL7NewNotifs"
local _nl=mkList(NotifHolder,Enum.FillDirection.Vertical,8); _nl.VerticalAlignment=Enum.VerticalAlignment.Bottom
Instance.new("UIPadding",NotifHolder).PaddingBottom=UDim.new(0,14)

-- ============================================================
--  NOTIFICATIONS
-- ============================================================
local NC={success=Color3.fromRGB(52,220,118),error=Color3.fromRGB(225,55,55),warning=Color3.fromRGB(255,198,0),info=Color3.fromRGB(90,175,255)}
local NI={success="✓",error="✕",warning="⚠",info="ℹ"}

function PL7New:Notify(opts)
    opts=opts or {}
    local th=PL7New.Themes[opts.Theme or PL7New._currentTheme or "Black"]
    local nType=opts.Type or "info"; local accent=NC[nType] or NC.info; local dur=opts.Duration or 4
    playSound("notify",0.15,nType=="error" and 0.85 or 1.1)

    local card=mkFrm(NotifHolder,UDim2.new(1,0,0,76),nil,th.Notification)
    card.ClipsDescendants=true; card.LayoutOrder=os.clock()*10000
    mkCorner(card,12); mkStroke(card,accent,1,0.5)

    -- accent dot top left
    local dot=mkFrm(card,UDim2.new(0,4,1,0),nil,accent); mkCorner(dot,2)
    local icoF=mkFrm(card,UDim2.new(0,34,0,34),UDim2.new(0,16,0.5,-17),th.AccentDark); mkCorner(icoF,10)
    local icoL=mkLbl(icoF,NI[nType],15,accent,Enum.TextXAlignment.Center); icoL.Size=UDim2.new(1,0,1,0)
    local tL=mkLbl(card,opts.Title or "PL7 UI",14,th.Text); tL.Size=UDim2.new(1,-64,0,20); tL.Position=UDim2.new(0,58,0,12)
    local bL=mkLbl(card,opts.Text or "",12,th.TextDim); bL.Size=UDim2.new(1,-64,0,32); bL.Position=UDim2.new(0,58,0,30); bL.TextWrapped=true
    local pgBg=mkFrm(card,UDim2.new(1,0,0,3),UDim2.new(0,0,1,-3),th.Border)
    local pg=mkFrm(pgBg,UDim2.new(1,0,1,0),nil,accent); mkCorner(pg,1)

    card.Position=UDim2.new(1,12,0,0)
    tw(card,{Position=UDim2.new(0,0,0,0)},0.28,Enum.EasingStyle.Back)
    task.spawn(function()
        local steps=dur*30
        for i=steps,0,-1 do if pg and pg.Parent then pg.Size=UDim2.new(i/steps,0,1,0) end; task.wait(1/30) end
        tw(card,{Position=UDim2.new(1,12,0,0)},0.2); task.wait(0.22); pcall(function() card:Destroy() end)
    end)
    return card
end

-- ============================================================
--  LOGIN  (igual ao sistema Old, compativel)
-- ============================================================
function PL7New:CreateLogin(opts)
    opts=opts or {}
    local th=PL7New.Themes[opts.Theme or "Black"]
    local Login={}; local onSuccess,onFail=nil,nil

    local ov=mkFrm(ScreenGui,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),opts.BgColor or Color3.fromRGB(4,4,6))
    ov.Name="PL7NewLogin"; ov.ZIndex=200

    for i=1,5 do
        local h=mkFrm(ov,UDim2.new(1,0,0,1),UDim2.new(0,0,i*0.18,0),th.Border); h.BackgroundTransparency=0.88; h.ZIndex=200
        local v=mkFrm(ov,UDim2.new(0,1,1,0),UDim2.new(i*0.18,0,0,0),th.Border); v.BackgroundTransparency=0.88; v.ZIndex=200
    end

    local card=mkFrm(ov,UDim2.new(0,340,0,0),UDim2.new(0.5,-170,0.5,-150),th.TopBar)
    card.AutomaticSize=Enum.AutomaticSize.Y; card.ZIndex=201; mkCorner(card,16); mkStroke(card,th.Border,1,0.12)
    mkList(card,Enum.FillDirection.Vertical,0); mkPad(card,24,24,24,24)

    -- accent dot on top
    local topAcc=mkFrm(card,UDim2.new(0.5,0,0,2),UDim2.new(0.25,0,0,0),th.Accent)
    mkCorner(topAcc,1); topAcc.BackgroundTransparency=0.5; topAcc.ZIndex=202; topAcc.LayoutOrder=-10

    local icoF=mkFrm(card,UDim2.new(1,0,0,52),nil,Color3.new(0,0,0),1); icoF.LayoutOrder=0
    local icoL=mkLbl(icoF,opts.Icon or "◈",32,th.Accent,Enum.TextXAlignment.Center); icoL.Size=UDim2.new(1,0,1,0); icoL.ZIndex=202
    task.spawn(function() local t=0; while icoL and icoL.Parent do t=t+0.04; icoL.TextTransparency=0.05+math.abs(math.sin(t*0.7))*0.2; task.wait(0.04) end end)

    local titF=mkFrm(card,UDim2.new(1,0,0,32),nil,Color3.new(0,0,0),1); titF.LayoutOrder=1
    local titL=mkLbl(titF,opts.Title or "PL7 UI",22,th.Text,Enum.TextXAlignment.Center); titL.Size=UDim2.new(1,0,1,0); titL.ZIndex=202

    local subF=mkFrm(card,UDim2.new(1,0,0,20),nil,Color3.new(0,0,0),1); subF.LayoutOrder=2
    local subL=mkLbl(subF,opts.Subtitle or "Insira sua key",13,th.TextDim,Enum.TextXAlignment.Center); subL.Size=UDim2.new(1,0,1,0); subL.ZIndex=202

    local sp1=mkFrm(card,UDim2.new(1,0,0,12),nil,Color3.new(0,0,0),1); sp1.LayoutOrder=3

    local statF=mkFrm(card,UDim2.new(1,0,0,18),nil,Color3.new(0,0,0),1); statF.LayoutOrder=5
    local statL=mkLbl(statF,"",12,th.TextDim,Enum.TextXAlignment.Center); statL.Size=UDim2.new(1,0,1,0); statL.ZIndex=202

    if opts.UseKey then
        local kF=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1); kF.AutomaticSize=Enum.AutomaticSize.Y; kF.LayoutOrder=4
        mkList(kF,Enum.FillDirection.Vertical,6)
        local kLbl=mkLbl(kF,"🔑  Chave de Acesso",12,th.TextDim); kLbl.Size=UDim2.new(1,0,0,18); kLbl.ZIndex=202
        local kBox=Instance.new("TextBox"); kBox.Size=UDim2.new(1,0,0,38); kBox.BackgroundColor3=th.Toggle
        kBox.Text=""; kBox.TextColor3=th.Text; kBox.TextSize=13; kBox.Font=Enum.Font.Gotham
        kBox.ClearTextOnFocus=false; kBox.PlaceholderText="Cole sua key aqui..."; kBox.PlaceholderColor3=th.TextDim
        kBox.ZIndex=202; kBox.Parent=kF; mkCorner(kBox,9); mkStroke(kBox,th.Border,1,0.2); mkPad(kBox,0,0,12,12)
        if opts.KeyLink then local gl=mkLbl(kF,"🔗  "..opts.KeyLink,10,th.Accent,Enum.TextXAlignment.Center); gl.Size=UDim2.new(1,0,0,16); gl.ZIndex=202 end

        local cfmF=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1); cfmF.LayoutOrder=6
        local cfmBtn=mkBtn(cfmF,"✓  Confirmar Key",14,th.Background,th.Accent)
        cfmBtn.Size=UDim2.new(1,0,0,40); cfmBtn.TextXAlignment=Enum.TextXAlignment.Center; cfmBtn.ZIndex=202; mkCorner(cfmBtn,10)
        cfmBtn.MouseEnter:Connect(function() playSound("hover",0.1,1.2); tw(cfmBtn,{BackgroundColor3=th.AccentDark},0.12) end)
        cfmBtn.MouseLeave:Connect(function() tw(cfmBtn,{BackgroundColor3=th.Accent},0.12) end)
        cfmBtn.MouseButton1Click:Connect(function()
            playSound("click",0.18,1.0)
            local input=kBox.Text; local valid=false
            if opts.Keys then for _,k in ipairs(opts.Keys) do if k==input then valid=true; break end end
            elseif opts.KeyValidator then valid=opts.KeyValidator(input)
            else valid=(input~="") end
            if valid then
                statL.Text="✓  Acesso liberado!"; statL.TextColor3=NC.success
                playSound("notify",0.2,1.3)
                tw(cfmBtn,{BackgroundColor3=NC.success},0.2); task.wait(0.8)
                tw(ov,{BackgroundTransparency=1},0.4); task.wait(0.42); pcall(function() ov:Destroy() end)
                if onSuccess then onSuccess(input) end
            else
                statL.Text="✕  Key invalida."; statL.TextColor3=NC.error
                playSound("error",0.2,0.9)
                tw(kBox,{BackgroundColor3=Color3.fromRGB(80,15,15)},0.1); task.wait(0.3); tw(kBox,{BackgroundColor3=th.Toggle},0.2)
                if onFail then onFail(input) end
            end
        end)
    end

    local sp2=mkFrm(card,UDim2.new(1,0,0,8),nil,Color3.new(0,0,0),1); sp2.LayoutOrder=9
    local verF=mkFrm(card,UDim2.new(1,0,0,16),nil,Color3.new(0,0,0),1); verF.LayoutOrder=10
    local verL=mkLbl(verF,opts.Version or "PL7 UI New  v1.0.0",10,th.TextDim,Enum.TextXAlignment.Center); verL.Size=UDim2.new(1,0,1,0); verL.ZIndex=202

    ov.BackgroundTransparency=1; tw(ov,{BackgroundTransparency=0},0.38)
    function Login:OnSuccess(cb) onSuccess=cb end
    function Login:OnFail(cb) onFail=cb end
    function Login:Destroy() pcall(function() ov:Destroy() end) end
    return Login
end

-- ============================================================
--  LOADER
-- ============================================================
function PL7New:CreateLoader(opts)
    opts=opts or {}
    local th=PL7New.Themes[opts.Theme or "Black"]; local Ldr={}
    local ov=mkFrm(ScreenGui,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),opts.BgColor or Color3.fromRGB(4,4,6))
    ov.Name="PL7NewLoader"; ov.ZIndex=100
    for i=1,5 do
        local h=mkFrm(ov,UDim2.new(1,0,0,1),UDim2.new(0,0,i*0.18,0),th.Border); h.BackgroundTransparency=0.88; h.ZIndex=100
        local v=mkFrm(ov,UDim2.new(0,1,1,0),UDim2.new(i*0.18,0,0,0),th.Border); v.BackgroundTransparency=0.88; v.ZIndex=100
    end
    local card=mkFrm(ov,UDim2.new(0,350,0,275),UDim2.new(0.5,-175,0.5,-137),th.TopBar)
    card.ZIndex=101; mkCorner(card,18); mkStroke(card,th.Border,1,0.15)
    local tLine=mkFrm(card,UDim2.new(0.5,0,0,2),UDim2.new(0.25,0,0,0),th.Accent)
    mkCorner(tLine,1); tLine.BackgroundTransparency=0.5; tLine.ZIndex=102
    local ico=mkLbl(card,opts.Icon or "◈",36,th.Accent,Enum.TextXAlignment.Center)
    ico.Size=UDim2.new(1,0,0,58); ico.Position=UDim2.new(0,0,0,20); ico.ZIndex=102
    task.spawn(function() local t=0; while ico and ico.Parent do t=t+0.04; ico.TextTransparency=0.05+math.abs(math.sin(t*0.8))*0.2; task.wait(0.04) end end)
    local titL=mkLbl(card,opts.Title or "PL7 UI",24,th.Text,Enum.TextXAlignment.Center); titL.Size=UDim2.new(1,-20,0,30); titL.Position=UDim2.new(0,10,0,86); titL.ZIndex=102
    local stL=mkLbl(card,opts.Subtitle or "Carregando...",13,th.TextDim,Enum.TextXAlignment.Center); stL.Size=UDim2.new(1,-30,0,20); stL.Position=UDim2.new(0,15,0,120); stL.ZIndex=102
    local pgBg=mkFrm(card,UDim2.new(1,-44,0,6),UDim2.new(0,22,0,156),th.Border); pgBg.ZIndex=102; mkCorner(pgBg,3)
    local pgFill=mkFrm(pgBg,UDim2.new(0,0,1,0),nil,th.Accent); pgFill.ZIndex=103; mkCorner(pgFill,3)
    local pctL=mkLbl(card,"0%",12,th.Accent,Enum.TextXAlignment.Center); pctL.Size=UDim2.new(1,0,0,18); pctL.Position=UDim2.new(0,0,0,168); pctL.ZIndex=102
    local dotsL=mkLbl(card,"· · ·",13,th.TextDim,Enum.TextXAlignment.Center); dotsL.Size=UDim2.new(1,0,0,18); dotsL.Position=UDim2.new(0,0,0,194); dotsL.ZIndex=102
    task.spawn(function() local pts={"●  ·  ·","·  ●  ·","·  ·  ●","·  ●  ·"}; local i=1; while dotsL and dotsL.Parent do dotsL.Text=pts[i]; i=i%#pts+1; task.wait(0.32) end end)
    ov.BackgroundTransparency=1; tw(ov,{BackgroundTransparency=0},0.38)
    function Ldr:SetStatus(t) stL.Text=t end
    function Ldr:SetProgress(p) p=math.clamp(p,0,100); tw(pgFill,{Size=UDim2.new(p/100,0,1,0)},0.26); pctL.Text=math.floor(p).."%" end
    function Ldr:Finish(cb,delay_) self:SetProgress(100); self:SetStatus("Pronto!"); task.wait(delay_ or 0.5); tw(ov,{BackgroundTransparency=1},0.44); task.wait(0.48); pcall(function() ov:Destroy() end); if cb then cb() end end
    function Ldr:Destroy() pcall(function() ov:Destroy() end) end
    return Ldr
end

-- ============================================================
--  WINDOW  (Split Panel Style)
-- ============================================================
function PL7New:CreateWindow(opts)
    opts=opts or {}
    PL7New._currentTheme=opts.Theme or "Black"

    local Win={_tabs={},_activeTab=nil,_theme=PL7New.Themes[PL7New._currentTheme],_themeName=PL7New._currentTheme}
    local T=Win._theme
    local W=(opts.Size and opts.Size[1]) or 320
    local H=(opts.Size and opts.Size[2]) or 370
    local SIDE_W=54   -- sidebar estreita, so icones

    -- root
    local root=mkFrm(ScreenGui,UDim2.new(0,W,0,H),UDim2.new(0.5,-W/2,0.5,-H/2),T.Background)
    root.Name="PL7NewWindow"; root.ClipsDescendants=false
    mkCorner(root,14); mkStroke(root,T.Border,1,0.1); Win._root=root

    -- ── TOPBAR ──────────────────────────────────────────────
    local topbar=mkFrm(root,UDim2.new(1,0,0,44),UDim2.new(0,0,0,0),T.TopBar)
    mkCorner(topbar,14)
    mkFrm(root,UDim2.new(1,0,0,14),UDim2.new(0,0,0,30),T.TopBar).ZIndex=0

    -- dot colorido + titulo
    local dotAccent=mkFrm(topbar,UDim2.new(0,8,0,8),UDim2.new(0,14,0.5,-4),T.Accent)
    mkCorner(dotAccent,4)
    -- glow no dot
    task.spawn(function()
        while dotAccent and dotAccent.Parent do
            tw(dotAccent,{BackgroundTransparency=0.3},1,Enum.EasingStyle.Sine); task.wait(1)
            tw(dotAccent,{BackgroundTransparency=0},1,Enum.EasingStyle.Sine); task.wait(1)
        end
    end)

    local titL=mkLbl(topbar,opts.Title or "PL7 UI",14,T.Text)
    titL.Size=UDim2.new(1,-100,1,0); titL.Position=UDim2.new(0,28,0,0); Win._titleLbl=titL

    -- controles
    local ctrlF=mkFrm(topbar,UDim2.new(0,62,0,26),UDim2.new(1,-66,0.5,-13),Color3.new(0,0,0),1)
    mkList(ctrlF,Enum.FillDirection.Horizontal,5)

    local function mkCtrl(icon,col)
        local b=mkBtn(ctrlF,icon,12,col,Color3.new(0,0,0))
        b.BackgroundTransparency=1; b.Size=UDim2.new(0,26,0,26); mkCorner(b,7)
        b.MouseEnter:Connect(function() playSound("hover",0.08,1.3); b.BackgroundColor3=col; tw(b,{BackgroundTransparency=0.78},0.12) end)
        b.MouseLeave:Connect(function() tw(b,{BackgroundTransparency=1},0.12) end)
        return b
    end
    local cfgBtn=mkCtrl("⚙",T.TextDim)
    local searchBtn=mkCtrl("🔍",T.TextDim)
    local closeBtn=mkCtrl("✕",Color3.fromRGB(225,65,65))
    ctrlF.Size=UDim2.new(0,92,0,26); ctrlF.Position=UDim2.new(1,-96,0.5,-13)
    Win._searchBtn=searchBtn
    mkDrag(topbar,root)

    -- barra de pesquisa
    local searchBar=mkFrm(root,UDim2.new(1,-SIDE_W-12,0,32),UDim2.new(0,SIDE_W+6,0,50),T.Toggle)
    searchBar.Visible=false; searchBar.ZIndex=30; mkCorner(searchBar,8); mkStroke(searchBar,T.Accent,1,0.35)
    local searchBox=Instance.new("TextBox"); searchBox.Size=UDim2.new(1,-10,1,0); searchBox.Position=UDim2.new(0,5,0,0)
    searchBox.BackgroundTransparency=1; searchBox.Text=""; searchBox.TextColor3=T.Text; searchBox.TextSize=12
    searchBox.Font=Enum.Font.Gotham; searchBox.PlaceholderText="Pesquisar função..."; searchBox.PlaceholderColor3=T.TextDim
    searchBox.ClearTextOnFocus=false; searchBox.ZIndex=31; searchBox.Parent=searchBar

    local searchResults=mkFrm(root,UDim2.new(1,-SIDE_W-12,0,0),UDim2.new(0,SIDE_W+6,0,84),T.Sub)
    searchResults.AutomaticSize=Enum.AutomaticSize.Y; searchResults.Visible=false; searchResults.ZIndex=30
    mkCorner(searchResults,8); mkStroke(searchResults,T.Border,1,0.2)
    mkList(searchResults,Enum.FillDirection.Vertical,1); mkPad(searchResults,4,4,6,6)

    local searchOpen=false
    searchBtn.MouseButton1Click:Connect(function()
        searchOpen=not searchOpen
        searchBar.Visible=searchOpen; searchResults.Visible=false
        if searchOpen then searchBox:CaptureFocus() end
        tw(searchBtn,{TextTransparency=searchOpen and 0.3 or 0},0.12)
    end)

    local function doSearch(query)
        for _,c in pairs(searchResults:GetChildren()) do
            if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
        end
        if query=="" then searchResults.Visible=false; return end
        query=query:lower(); local found=0
        for _,tab in ipairs(Win._tabs) do
            for _,child in pairs(tab._content:GetDescendants()) do
                if (child:IsA("TextLabel") or child:IsA("TextButton")) and child.Text~="" then
                    local txt=child.Text:lower():gsub("<[^>]+>","")
                    if txt:find(query,1,true) and found<8 then
                        found=found+1
                        local rb=mkBtn(searchResults,child.Text:gsub("<[^>]+>",""),12,T.Text,T.Toggle)
                        rb.Size=UDim2.new(1,0,0,28); rb.TextXAlignment=Enum.TextXAlignment.Left; rb.ZIndex=31
                        mkPad(rb,0,0,8,8); mkCorner(rb,6)
                        local tabIco=mkLbl(rb,tab._iconLbl and tab._iconLbl.Text or "·",11,T.Accent,Enum.TextXAlignment.Right)
                        tabIco.Size=UDim2.new(0,20,1,0); tabIco.Position=UDim2.new(1,-22,0,0); tabIco.ZIndex=32
                        rb.MouseEnter:Connect(function() tw(rb,{BackgroundColor3=T.AccentDark},0.1) end)
                        rb.MouseLeave:Connect(function() tw(rb,{BackgroundColor3=T.Toggle},0.1) end)
                        rb.MouseButton1Click:Connect(function()
                            tab._iconBtn.MouseButton1Click:Fire()
                            searchOpen=false; searchBar.Visible=false; searchResults.Visible=false; searchBox.Text=""
                        end)
                    end
                end
            end
        end
        searchResults.Visible=(found>0)
        if found==0 then
            local nf=mkLbl(searchResults,"Nenhum resultado.",11,T.TextDim); nf.Size=UDim2.new(1,0,0,24); nf.ZIndex=31; searchResults.Visible=true
        end
    end

    searchBox:GetPropertyChangedSignal("Text"):Connect(function() doSearch(searchBox.Text) end)
    UserInputService.InputBegan:Connect(function(inp)
        if (inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch) and searchOpen then
            if inp.Target and not searchResults:IsAncestorOf(inp.Target) and inp.Target~=searchBtn and not searchBar:IsAncestorOf(inp.Target) then
                searchOpen=false; searchBar.Visible=false; searchResults.Visible=false; searchBox.Text=""
            end
        end
    end)

    closeBtn.MouseButton1Click:Connect(function()
        playSound("close",0.15,0.9)
        tw(root,{BackgroundTransparency=1,Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+18)},0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
        task.wait(0.2); root.Visible=false; root.BackgroundTransparency=0
        root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-18)
    end)

    -- ── SIDEBAR (scroll, so icones grandes) ─────────────────
    local sidebar=Instance.new("ScrollingFrame")
    sidebar.Name="PL7NewSidebar"
    sidebar.Size=UDim2.new(0,SIDE_W,1,-44)
    sidebar.Position=UDim2.new(0,0,0,44)
    sidebar.BackgroundColor3=T.Sidebar
    sidebar.BorderSizePixel=0
    sidebar.ScrollBarThickness=0
    sidebar.ScrollingDirection=Enum.ScrollingDirection.Y
    sidebar.CanvasSize=UDim2.new(0,0,0,0)
    sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y
    sidebar.ClipsDescendants=true
    sidebar.Parent=root
    mkList(sidebar,Enum.FillDirection.Vertical,2)
    local sbPad=Instance.new("UIPadding"); sbPad.PaddingTop=UDim.new(0,8); sbPad.PaddingBottom=UDim.new(0,8); sbPad.Parent=sidebar

    -- linha separadora sidebar | content
    local sideSep=mkFrm(root,UDim2.new(0,1,1,-44),UDim2.new(0,SIDE_W,0,44),T.Border)
    sideSep.BackgroundTransparency=0.3

    -- ── CONTENT AREA ────────────────────────────────────────
    local contentArea=mkFrm(root,UDim2.new(1,-SIDE_W-1,1,-46),UDim2.new(0,SIDE_W+1,0,45),T.Content)
    contentArea.ClipsDescendants=true; Win._contentArea=contentArea

    -- ── FLOATING BUTTON ─────────────────────────────────────
    local floatBar=mkFrm(ScreenGui,UDim2.new(1,0,0,46),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
    floatBar.Name="PL7NewFloatBar"
    local floatBtn=mkBtn(floatBar,opts.FloatText or "▸  ABRIR PAINEL",12,T.Background,T.Accent)
    floatBtn.Size=UDim2.new(0,148,0,34); floatBtn.Position=UDim2.new(0.5,-74,0.5,-17)
    floatBtn.TextXAlignment=Enum.TextXAlignment.Center; floatBtn.ZIndex=90
    mkCorner(floatBtn,8); Win._floatBtn=floatBtn

    task.spawn(function()
        while floatBtn and floatBtn.Parent do
            tw(floatBtn,{BackgroundColor3=T.AccentDark},1.8,Enum.EasingStyle.Sine); task.wait(1.8)
            tw(floatBtn,{BackgroundColor3=T.Accent},1.8,Enum.EasingStyle.Sine); task.wait(1.8)
        end
    end)

    floatBtn.MouseEnter:Connect(function()
        playSound("hover",0.08,1.2)
        tw(floatBtn,{Size=UDim2.new(0,158,0,34)},0.16,Enum.EasingStyle.Back)
        floatBtn.Position=UDim2.new(0.5,-79,0.5,-17)
    end)
    floatBtn.MouseLeave:Connect(function()
        tw(floatBtn,{Size=UDim2.new(0,148,0,34)},0.14); floatBtn.Position=UDim2.new(0.5,-74,0.5,-17)
    end)
    floatBtn.MouseButton1Click:Connect(function()
        if root.Visible then
            playSound("close",0.14,1.0)
            tw(root,{BackgroundTransparency=1,Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-12)},0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
            task.wait(0.2); root.Visible=false; root.BackgroundTransparency=0
            root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+12)
        else
            playSound("open",0.16,1.0)
            root.Visible=true; root.BackgroundTransparency=1
            root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-12)
            tw(root,{BackgroundTransparency=0,Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+12)},0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
        end
    end)

    -- ── APPLY THEME ─────────────────────────────────────────
    function Win:ApplyTheme(name)
        local th=PL7New.Themes[name]; if not th then return end
        T=th; self._theme=th; self._themeName=name; PL7New._currentTheme=name
        root.BackgroundColor3=th.Background; topbar.BackgroundColor3=th.TopBar
        sidebar.BackgroundColor3=th.Sidebar; sideSep.BackgroundColor3=th.Border
        contentArea.BackgroundColor3=th.Content; titL.TextColor3=th.Text
        dotAccent.BackgroundColor3=th.Accent; cfgBtn.TextColor3=th.TextDim
        floatBtn.TextColor3=th.Background; floatBtn.BackgroundColor3=th.Accent
        for _,c in pairs(root:GetChildren()) do if c:IsA("UIStroke") then c.Color=th.Border end end
        for _,tab in ipairs(self._tabs) do
            tab._iconBtn.BackgroundColor3=Color3.new(0,0,0)
            tab._iconLbl.TextColor3=th.IconInactive
            tab._content.BackgroundColor3=th.Content
            tab._content.ScrollBarImageColor3=th.ScrollBar
            tab._indBar.BackgroundColor3=th.Accent
            if tab==self._activeTab then
                tab._iconLbl.TextColor3=th.IconActive
                tab._iconBtn.BackgroundColor3=th.AccentDark
                tab._indBar.BackgroundColor3=th.Accent
            end
        end
        if self._settingsPanel then self._settingsPanel:Destroy(); self._settingsPanel=nil end
    end

    -- ── SETTINGS PANEL ──────────────────────────────────────
    local function buildSettings()
        if Win._settingsPanel then Win._settingsPanel:Destroy() end
        local sp=mkScroll(contentArea,T.Content,T.ScrollBar)
        sp.Name="PL7NewSettings"; sp.Visible=false; sp.ZIndex=20
        mkList(sp,Enum.FillDirection.Vertical,5); mkPad(sp,8,8,8,8)

        local function secHdr(txt)
            local h=mkFrm(sp,UDim2.new(1,0,0,22),nil,T.AccentDark); h.BackgroundTransparency=0.72; mkCorner(h,6)
            local l=mkLbl(h,"  "..txt,9,T.Accent); l.Size=UDim2.new(1,-8,1,0); return h
        end

        secHdr("TEMA")
        local tnames={"Black","Ghost","Blood","Void","Emerald","Gold","Ice","Rose","Ash","Ocean","Sunset","Mint"}
        local tDrop_open=false
        local tDrop_hdr=mkFrm(sp,UDim2.new(1,0,0,36),nil,T.Toggle); mkCorner(tDrop_hdr,8); mkStroke(tDrop_hdr,T.Border,1,0.25)
        local tDrop_lbl=mkLbl(tDrop_hdr,"  🎨  "..Win._themeName,12,T.Text); tDrop_lbl.Size=UDim2.new(1,-30,1,0)
        local tDrop_arr=mkLbl(tDrop_hdr,"▾",11,T.TextDim,Enum.TextXAlignment.Center); tDrop_arr.Size=UDim2.new(0,26,1,0); tDrop_arr.Position=UDim2.new(1,-26,0,0)
        local tDrop_box=mkFrm(sp,UDim2.new(1,0,0,0),nil,T.Card); tDrop_box.AutomaticSize=Enum.AutomaticSize.Y; tDrop_box.Visible=false
        mkCorner(tDrop_box,8); mkStroke(tDrop_box,T.Accent,1,0.55); mkList(tDrop_box,Enum.FillDirection.Vertical,1); mkPad(tDrop_box,4,4,6,6)
        for _,tn in ipairs(tnames) do
            local th2=PL7New.Themes[tn]
            local ob=mkBtn(tDrop_box,tn,12,th2.Accent,Color3.new(0,0,0))
            ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,30); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,10,10)
            local obleft=mkFrm(ob,UDim2.new(0,3,0.6,0),UDim2.new(0,0,0.2,0),th2.Accent); mkCorner(obleft,2)
            ob.MouseEnter:Connect(function() ob.BackgroundColor3=th2.AccentDark; tw(ob,{BackgroundTransparency=0.75},0.1) end)
            ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
            ob.MouseButton1Click:Connect(function()
                playSound("click",0.15,1.1); Win:ApplyTheme(tn); tDrop_lbl.Text="  🎨  "..tn
                tDrop_open=false; tDrop_box.Visible=false; tw(tDrop_arr,{Rotation=0},0.18)
                PL7New:Notify({Title="Tema",Text=tn.." aplicado!",Type="success",Duration=2,Theme=tn})
            end)
        end
        tDrop_hdr.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                tDrop_open=not tDrop_open; tDrop_box.Visible=tDrop_open; tw(tDrop_arr,{Rotation=tDrop_open and 180 or 0},0.18)
            end
        end)

        secHdr("IDIOMA / TRADUCAO")
        local langs={
            {"🇧🇷 Português (BR)","pt_BR"},{"🇵🇹 Português (PT)","pt_PT"},{"🇺🇸 English (US)","en_US"},
            {"🇬🇧 English (UK)","en_GB"},{"🇪🇸 Español","es"},{"🇲🇽 Español (MX)","es_MX"},
            {"🇫🇷 Français","fr"},{"🇩🇪 Deutsch","de"},{"🇮🇹 Italiano","it"},{"🇷🇺 Русский","ru"},
            {"🇨🇳 中文 (简体)","zh_CN"},{"🇹🇼 中文 (繁體)","zh_TW"},{"🇯🇵 日本語","ja"},
            {"🇰🇷 한국어","ko"},{"🇸🇦 العربية","ar"},{"🇹🇷 Türkçe","tr"},{"🇵🇱 Polski","pl"},
            {"🇳🇱 Nederlands","nl"},{"🇸🇪 Svenska","sv"},{"🇻🇳 Tiếng Việt","vi"},
            {"🇹🇭 ภาษาไทย","th"},{"🇮🇩 Bahasa Indonesia","id"},
        }
        local Translations={
            pt_BR={open="ABRIR PAINEL"},pt_PT={open="ABRIR PAINEL"},en_US={open="OPEN PANEL"},
            en_GB={open="OPEN PANEL"},es={open="ABRIR PANEL"},es_MX={open="ABRIR PANEL"},
            fr={open="OUVRIR"},de={open="ÖFFNEN"},it={open="APRI"},ru={open="ОТКРЫТЬ"},
            zh_CN={open="打开面板"},zh_TW={open="開啟面板"},ja={open="パネルを開く"},
            ko={open="패널 열기"},ar={open="فتح اللوحة"},tr={open="PANELİ AÇ"},
            pl={open="OTWÓRZ"},nl={open="OPENEN"},sv={open="ÖPPNA"},vi={open="MỞ BẢNG"},
            th={open="เปิดแผง"},id={open="BUKA PANEL"},
        }
        Win._lang="pt_BR"
        local lDrop_open=false
        local lDrop_hdr=mkFrm(sp,UDim2.new(1,0,0,36),nil,T.Toggle); mkCorner(lDrop_hdr,8); mkStroke(lDrop_hdr,T.Border,1,0.25)
        local lDrop_lbl=mkLbl(lDrop_hdr,"  🌐  Português (BR)",12,T.Text); lDrop_lbl.Size=UDim2.new(1,-30,1,0)
        local lDrop_arr=mkLbl(lDrop_hdr,"▾",11,T.TextDim,Enum.TextXAlignment.Center); lDrop_arr.Size=UDim2.new(0,26,1,0); lDrop_arr.Position=UDim2.new(1,-26,0,0)
        local lDrop_box=mkFrm(sp,UDim2.new(1,0,0,0),nil,T.Card); lDrop_box.AutomaticSize=Enum.AutomaticSize.Y; lDrop_box.Visible=false
        mkCorner(lDrop_box,8); mkStroke(lDrop_box,T.Accent,1,0.55); mkList(lDrop_box,Enum.FillDirection.Vertical,1); mkPad(lDrop_box,4,4,6,6)
        for _,lang in ipairs(langs) do
            local ob=mkBtn(lDrop_box,lang[1],12,T.Text,Color3.new(0,0,0))
            ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,28); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,10,10)
            ob.MouseEnter:Connect(function() ob.BackgroundColor3=T.AccentDark; tw(ob,{BackgroundTransparency=0.75},0.1) end)
            ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
            ob.MouseButton1Click:Connect(function()
                Win._lang=lang[2]; lDrop_lbl.Text="  🌐  "..lang[1]
                lDrop_open=false; lDrop_box.Visible=false; tw(lDrop_arr,{Rotation=0},0.18)
                local tr=Translations[lang[2]] or Translations.pt_BR
                if tr then floatBtn.Text=tr.open end
                PL7New:Notify({Title="Idioma",Text=lang[1].." aplicado!",Type="info",Duration=2})
            end)
        end
        lDrop_hdr.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                lDrop_open=not lDrop_open; lDrop_box.Visible=lDrop_open; tw(lDrop_arr,{Rotation=lDrop_open and 180 or 0},0.18)
            end
        end)

        secHdr("TAMANHO")
        for _,sz in ipairs({{"Pequeno",280,330},{"Medio",320,370},{"Grande",360,420},{"Enorme",410,480}}) do
            local sb=mkBtn(sp,sz[1].."   "..sz[2].."x"..sz[3],12,T.Text,T.Card); sb.Size=UDim2.new(1,0,0,32); sb.TextXAlignment=Enum.TextXAlignment.Left
            mkCorner(sb,8); mkStroke(sb,T.Border,1,0.3); mkPad(sb,0,0,12,12)
            sb.MouseEnter:Connect(function() tw(sb,{BackgroundColor3=T.AccentDark},0.12) end)
            sb.MouseLeave:Connect(function() tw(sb,{BackgroundColor3=T.Card},0.12) end)
            sb.MouseButton1Click:Connect(function()
                W=sz[2]; H=sz[3]; tw(root,{Size=UDim2.new(0,W,0,H)},0.28)
                PL7New:Notify({Title="Tamanho",Text=sz[1].." aplicado.",Type="info",Duration=2,Theme=Win._themeName})
            end)
        end

        secHdr("OPACIDADE")
        local opRow=mkFrm(sp,UDim2.new(1,0,0,36),nil,Color3.new(0,0,0),1)
        local opLbl=mkLbl(opRow,"100%",11,T.Accent,Enum.TextXAlignment.Right); opLbl.Size=UDim2.new(0,38,1,0); opLbl.Position=UDim2.new(1,-38,0,0)
        local opTrk=mkFrm(opRow,UDim2.new(1,-50,0,6),UDim2.new(0,0,0.5,-3),T.Toggle); mkCorner(opTrk,3)
        local opFill=mkFrm(opTrk,UDim2.new(1,0,1,0),nil,T.Accent); mkCorner(opFill,3)
        local opDrg=false
        local function opUp(px) local pct=math.clamp((px-opTrk.AbsolutePosition.X)/math.max(opTrk.AbsoluteSize.X,1),0,1); opFill.Size=UDim2.new(pct,0,1,0); opLbl.Text=math.floor(pct*100).."%"; root.BackgroundTransparency=1-pct end
        opTrk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then opDrg=true; opUp(i.Position.X) end end)
        UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then opDrg=false end end)
        UserInputService.InputChanged:Connect(function(i) if opDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then opUp(i.Position.X) end end)

        secHdr("TEXTO DO BOTAO FLUTUANTE")
        local ftb=Instance.new("TextBox"); ftb.Size=UDim2.new(1,0,0,34); ftb.BackgroundColor3=T.Toggle; ftb.Text=floatBtn.Text; ftb.TextColor3=T.Text; ftb.TextSize=12; ftb.Font=Enum.Font.Gotham; ftb.ClearTextOnFocus=false; ftb.PlaceholderText="Texto..."; ftb.PlaceholderColor3=T.TextDim; ftb.Parent=sp; mkCorner(ftb,8); mkStroke(ftb,T.Border,1,0.2); mkPad(ftb,0,0,10,10)
        ftb.FocusLost:Connect(function() floatBtn.Text=ftb.Text end)

        local csb=mkBtn(sp,"x  Fechar",11,Color3.fromRGB(225,75,75),T.Card); csb.Size=UDim2.new(1,0,0,32); csb.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(csb,8)
        csb.MouseButton1Click:Connect(function() sp.Visible=false; if Win._activeTab then Win._activeTab._content.Visible=true end end)
        Win._settingsPanel=sp; return sp
    end

    cfgBtn.MouseButton1Click:Connect(function()
        playSound("click",0.14,1.1)
        if not Win._settingsPanel then buildSettings() end
        local sp=Win._settingsPanel; sp.Visible=not sp.Visible
        if sp.Visible and Win._activeTab then Win._activeTab._content.Visible=false
        elseif not sp.Visible and Win._activeTab then Win._activeTab._content.Visible=true end
    end)

    -- ============================================================
    --  ADD TAB
    -- ============================================================
    function Win:AddTab(tabName, tabIcon)
        local tab={_window=self}

        -- botao na sidebar: quadrado arredondado, so icone grande
        local iconBtn=mkBtn(sidebar,"",22,T.IconInactive,Color3.new(0,0,0))
        iconBtn.BackgroundTransparency=1
        iconBtn.Size=UDim2.new(1,-10,0,46)
        iconBtn.AutoButtonColor=false
        tab._iconBtn=iconBtn

        -- detecta emoji ou usa primeira letra
        local iconTxt
        if tabIcon then
            iconTxt=tabIcon
        else
            local firstBytes=tabName:sub(1,4)
            if firstBytes:byte(1) and firstBytes:byte(1)>127 then
                iconTxt=firstBytes
            else
                iconTxt=tabName:sub(1,1):upper()
            end
        end

        local iconLbl=mkLbl(iconBtn,iconTxt,20,T.IconInactive,Enum.TextXAlignment.Center)
        iconLbl.Size=UDim2.new(1,0,1,0); tab._iconLbl=iconLbl

        -- indicador lateral esquerdo (pill)
        local indBar=mkFrm(iconBtn,UDim2.new(0,3,0,0),UDim2.new(0,0,0.5,0),T.Accent)
        indBar.Visible=false; mkCorner(indBar,2); tab._indBar=indBar

        -- tooltip com nome da aba (aparece ao hover)
        local tooltip=mkBtn(root,tabName,11,T.Text,T.Card)
        tooltip.Size=UDim2.new(0,0,0,26); tooltip.AutomaticSize=Enum.AutomaticSize.X
        tooltip.TextXAlignment=Enum.TextXAlignment.Center; tooltip.ZIndex=50
        tooltip.Visible=false; mkCorner(tooltip,6); mkStroke(tooltip,T.Border,1,0.2); mkPad(tooltip,0,0,10,10)
        tab._tooltip=tooltip

        iconBtn.MouseEnter:Connect(function()
            playSound("hover",0.06,1.4)
            tooltip.Visible=true
            tooltip.Position=UDim2.new(0,SIDE_W+6,0,iconBtn.AbsolutePosition.Y-root.AbsolutePosition.Y+10)
        end)
        iconBtn.MouseLeave:Connect(function() tooltip.Visible=false end)

        -- content scroll
        local content=mkScroll(contentArea,T.Content,T.ScrollBar)
        content.Name="NewTab_"..tabName; content.Visible=false; tab._content=content
        mkList(content,Enum.FillDirection.Vertical,6); mkPad(content,8,8,8,8)

        -- page title no content
        local pgTitleF=mkFrm(content,UDim2.new(1,0,0,36),nil,T.Content)
        pgTitleF.LayoutOrder=-200
        local pgTitle=mkLbl(pgTitleF,tabName,16,T.Text)
        pgTitle.Size=UDim2.new(1,-16,1,0); pgTitle.Position=UDim2.new(0,8,0,0)
        -- underline
        local pgLine=mkFrm(pgTitleF,UDim2.new(1,0,0,1),UDim2.new(0,0,1,-1),T.Accent)
        pgLine.BackgroundTransparency=0.6

        local function selectTab()
            for _,t in ipairs(self._tabs) do
                t._content.Visible=false
                tw(t._iconLbl,{TextColor3=T.IconInactive},0.15)
                tw(t._iconBtn,{BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=1},0.15)
                t._indBar.Visible=false
            end
            content.Visible=true; self._activeTab=tab
            if self._settingsPanel then self._settingsPanel.Visible=false end

            -- anima icone ativo
            iconBtn.BackgroundColor3=T.AccentDark
            tw(iconBtn,{BackgroundTransparency=0.72},0.18)
            tw(iconLbl,{TextColor3=T.IconActive},0.18)
            indBar.Visible=true
            tw(indBar,{Size=UDim2.new(0,3,0.6,0),Position=UDim2.new(0,0,0.2,0)},0.22,Enum.EasingStyle.Back)
            playSound("click",0.1,1.2)
        end

        iconBtn.MouseButton1Click:Connect(selectTab)
        table.insert(self._tabs,tab)
        if #self._tabs==1 then selectTab() end

        -- ────────────────────────────────────────────────────
        --  ADD SECTION
        -- ────────────────────────────────────────────────────
        function tab:AddSection(sectionName)
            local sec={_window=self._window}
            local function gT() return self._window._theme end

            local secF=mkFrm(content,UDim2.new(1,0,0,0),nil,gT().Card)
            secF.AutomaticSize=Enum.AutomaticSize.Y; mkCorner(secF,10); mkStroke(secF,gT().Border,1,0.35)
            mkList(secF,Enum.FillDirection.Vertical,2); mkPad(secF,6,6,8,8)

            if sectionName and sectionName~="" then
                local sh=mkFrm(secF,UDim2.new(1,-16,0,22),nil,Color3.new(0,0,0),1); sh.LayoutOrder=-100
                local sl=mkLbl(sh,sectionName,9,gT().Accent); sl.Size=UDim2.new(1,0,1,0)
                local sep=mkFrm(sh,UDim2.new(1,0,0,1),UDim2.new(0,0,1,-1),gT().Accent); sep.BackgroundTransparency=0.72
            end

            -- ── CARD WRAPPER (visual diferente do Old) ───────
            -- cada item fica num card com fundo ligeiramente diferente
            local function mkCard(h)
                local c=mkFrm(secF,UDim2.new(1,-16,0,h or 40),nil,gT().Sub)
                mkCorner(c,8); mkStroke(c,gT().Border,1,0.5)
                return c
            end

            -- ── TOGGLE ───────────────────────────────────────
            function sec:AddToggle(name,default,callback)
                local tobj={_val=default or false,_subs={},_exp=false}
                local wT=gT()

                local wrap=mkFrm(secF,UDim2.new(1,-16,0,0),nil,Color3.new(0,0,0),1)
                wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,3)

                local card=mkFrm(wrap,UDim2.new(1,0,0,42),nil,wT.Sub)
                mkCorner(card,8); mkStroke(card,wT.Border,1,0.5)

                -- label + desc col
                local labelCol=mkFrm(card,UDim2.new(1,-54,1,0),UDim2.new(0,10,0,0),Color3.new(0,0,0),1)
                local nL=mkLbl(labelCol,name,13,wT.Text); nL.Size=UDim2.new(1,0,1,0)

                -- arrow
                local arrL=mkLbl(card,"›",14,wT.TextDim,Enum.TextXAlignment.Center)
                arrL.Size=UDim2.new(0,16,1,0); arrL.Position=UDim2.new(1,-50,0,0); arrL.Visible=false

                -- toggle pill
                local togBg=mkFrm(card,UDim2.new(0,40,0,22),UDim2.new(1,-40,0.5,-11),wT.Toggle)
                mkCorner(togBg,11); mkStroke(togBg,wT.Border,1,0.2)
                local togTh=mkFrm(togBg,UDim2.new(0,16,0,16),UDim2.new(0,3,0.5,-8),wT.TextDim)
                mkCorner(togTh,8)

                -- sub container
                local subC=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Background)
                subC.AutomaticSize=Enum.AutomaticSize.Y; subC.Visible=false; subC.ClipsDescendants=true
                mkCorner(subC,8); mkStroke(subC,wT.Accent,1,0.6)
                mkList(subC,Enum.FillDirection.Vertical,1); mkPad(subC,5,5,8,8)
                tobj._subC=subC

                local function upVis(v)
                    if v then tw(togBg,{BackgroundColor3=wT.ToggleOn},0.18); tw(togTh,{Position=UDim2.new(0,21,0.5,-8),BackgroundColor3=Color3.fromRGB(255,255,255)},0.2,Enum.EasingStyle.Back)
                    else tw(togBg,{BackgroundColor3=wT.Toggle},0.18); tw(togTh,{Position=UDim2.new(0,3,0.5,-8),BackgroundColor3=wT.TextDim},0.2,Enum.EasingStyle.Back) end
                end
                upVis(tobj._val)

                local function fire()
                    playSound("toggle",0.12,tobj._val and 0.9 or 1.1)
                    tobj._val=not tobj._val; upVis(tobj._val)
                    if #tobj._subs>0 then tobj._exp=tobj._val; subC.Visible=tobj._val; arrL.Visible=tobj._val; tw(arrL,{Rotation=tobj._exp and 90 or 0},0.2) end
                    if callback then callback(tobj._val) end
                end

                togBg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fire() end end)
                card.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then if #tobj._subs>0 and tobj._val then tobj._exp=not tobj._exp; subC.Visible=tobj._exp; tw(arrL,{Rotation=tobj._exp and 90 or 0},0.2) end end end)

                -- hover no card
                card.MouseEnter:Connect(function() tw(card,{BackgroundColor3=wT.Toggle},0.12) end)
                card.MouseLeave:Connect(function() tw(card,{BackgroundColor3=wT.Sub},0.12) end)

                -- SUB TOGGLE
                function tobj:AddSubToggle(subName,subDef,subCb)
                    arrL.Visible=true; local sub={_val=subDef or false}; local wT2=gT()
                    local sRow=mkFrm(subC,UDim2.new(1,-8,0,32),nil,Color3.new(0,0,0),1)
                    local dot=mkLbl(sRow,"·",16,wT2.Accent,Enum.TextXAlignment.Left); dot.Size=UDim2.new(0,14,1,0)
                    local snL=mkLbl(sRow,subName,11,wT2.TextDim); snL.Size=UDim2.new(1,-50,1,0); snL.Position=UDim2.new(0,16,0,0)
                    local stBg=mkFrm(sRow,UDim2.new(0,34,0,18),UDim2.new(1,-34,0.5,-9),wT2.Toggle); mkCorner(stBg,9); mkStroke(stBg,wT2.Border,1,0.3)
                    local stTh=mkFrm(stBg,UDim2.new(0,14,0,14),UDim2.new(0,2,0.5,-7),wT2.TextDim); mkCorner(stTh,7)
                    local function upS(v)
                        if v then tw(stBg,{BackgroundColor3=wT2.ToggleOn},0.18); tw(stTh,{Position=UDim2.new(0,18,0.5,-7),BackgroundColor3=Color3.fromRGB(255,255,255)},0.2)
                        else tw(stBg,{BackgroundColor3=wT2.Toggle},0.18); tw(stTh,{Position=UDim2.new(0,2,0.5,-7),BackgroundColor3=wT2.TextDim},0.2) end
                    end; upS(sub._val)
                    stBg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then playSound("toggle",0.1,sub._val and 0.9 or 1.1); sub._val=not sub._val; upS(sub._val); if subCb then subCb(sub._val) end end end)
                    table.insert(tobj._subs,sub); function sub:Set(v) sub._val=v; upS(v) end; function sub:Get() return sub._val end; return sub
                end

                -- SUB SLIDER
                function tobj:AddSubSlider(subName,min,max,default,subCb)
                    arrL.Visible=true; local val=default or min; local sobj={_val=val}
                    local wrap2=mkFrm(subC,UDim2.new(1,-8,0,46),nil,Color3.new(0,0,0),1); mkList(wrap2,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(wrap2,UDim2.new(1,0,0,20),nil,Color3.new(0,0,0),1)
                    local d=mkLbl(hdr,"·",16,gT().Accent); d.Size=UDim2.new(0,14,1,0)
                    local nL2=mkLbl(hdr,subName,11,gT().TextDim); nL2.Size=UDim2.new(1,-48,1,0); nL2.Position=UDim2.new(0,16,0,0)
                    local vL=mkLbl(hdr,tostring(math.floor(val)),11,gT().Accent,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0,30,1,0); vL.Position=UDim2.new(1,-30,0,0)
                    local trk=mkFrm(wrap2,UDim2.new(1,-4,0,5),UDim2.new(0,2,0,0),gT().Toggle); mkCorner(trk,3)
                    local fill=mkFrm(trk,UDim2.new((val-min)/(max-min),0,1,0),nil,gT().Slider); mkCorner(fill,3)
                    local thumb=mkFrm(wrap2,UDim2.new(0,14,0,14),UDim2.new(0,-7,0,25),gT().Slider); mkCorner(thumb,7)
                    local sDrg=false
                    local function upS(px) local pct=math.clamp((px-trk.AbsolutePosition.X)/math.max(trk.AbsoluteSize.X,1),0,1); val=min+pct*(max-min); sobj._val=val; tw(fill,{Size=UDim2.new(pct,0,1,0)},0.07); tw(thumb,{Position=UDim2.new(0,pct*trk.AbsoluteSize.X-7,0,25)},0.07); vL.Text=tostring(math.floor(val)); if subCb then subCb(val) end end
                    trk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true; upS(i.Position.X) end end)
                    thumb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true end end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=false end end)
                    UserInputService.InputChanged:Connect(function(i) if sDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upS(i.Position.X) end end)
                    table.insert(tobj._subs,sobj); function sobj:Set(v) upS(trk.AbsolutePosition.X+math.clamp((v-min)/(max-min),0,1)*trk.AbsoluteSize.X) end; function sobj:Get() return sobj._val end; return sobj
                end

                -- SUB BUTTON
                function tobj:AddSubButton(subName,subCb)
                    arrL.Visible=true; local wT2=gT()
                    local sRow=mkFrm(subC,UDim2.new(1,-8,0,30),nil,Color3.new(0,0,0),1)
                    local d=mkLbl(sRow,"·",16,wT2.Accent); d.Size=UDim2.new(0,14,1,0)
                    local b=mkBtn(sRow,subName,11,wT2.Text,wT2.Toggle); b.Size=UDim2.new(1,-20,0,24); b.Position=UDim2.new(0,16,0.5,-12); b.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(b,7)
                    b.MouseEnter:Connect(function() tw(b,{BackgroundColor3=wT2.AccentDark,TextColor3=wT2.Accent},0.12) end)
                    b.MouseLeave:Connect(function() tw(b,{BackgroundColor3=wT2.Toggle,TextColor3=wT2.Text},0.12) end)
                    b.MouseButton1Click:Connect(function() playSound("click",0.14,1.1); tw(b,{BackgroundColor3=wT2.Accent},0.07); task.wait(0.07); tw(b,{BackgroundColor3=wT2.AccentDark},0.12); if subCb then subCb() end end)
                    table.insert(tobj._subs,{}); return b
                end

                -- SUB DROPDOWN
                function tobj:AddSubDropdown(subName,options,default,subCb)
                    arrL.Visible=true; local dobj={_val=default or options[1],_open=false}; local wT2=gT()
                    local ow=mkFrm(subC,UDim2.new(1,-8,0,0),nil,Color3.new(0,0,0),1); ow.AutomaticSize=Enum.AutomaticSize.Y; mkList(ow,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(ow,UDim2.new(1,0,0,30),nil,wT2.Toggle); mkCorner(hdr,8)
                    local d=mkLbl(hdr,"·",16,wT2.Accent); d.Size=UDim2.new(0,14,1,0); d.Position=UDim2.new(0,4,0,0)
                    local nL3=mkLbl(hdr,subName,11,wT2.TextDim); nL3.Size=UDim2.new(0.42,0,1,0); nL3.Position=UDim2.new(0,20,0,0)
                    local vL2=mkLbl(hdr,dobj._val,11,wT2.Accent,Enum.TextXAlignment.Right); vL2.Size=UDim2.new(0.36,0,1,0); vL2.Position=UDim2.new(0.5,0,0,0)
                    local arr=mkLbl(hdr,"v",10,wT2.TextDim,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,18,1,0); arr.Position=UDim2.new(1,-18,0,0)
                    local optBox=mkFrm(ow,UDim2.new(1,0,0,0),nil,wT2.Background); optBox.AutomaticSize=Enum.AutomaticSize.Y; optBox.Visible=false; mkCorner(optBox,8); mkStroke(optBox,wT2.Accent,1,0.6); mkList(optBox,Enum.FillDirection.Vertical,1); mkPad(optBox,3,3,6,6)
                    for _,opt in ipairs(options) do
                        local ob=mkBtn(optBox,opt,11,wT2.Text,Color3.new(0,0,0)); ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,26); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,8,8)
                        ob.MouseEnter:Connect(function() ob.BackgroundColor3=wT2.AccentDark; tw(ob,{BackgroundTransparency=0.72},0.1) end)
                        ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
                        ob.MouseButton1Click:Connect(function() playSound("click",0.12,1.1); dobj._val=opt; vL2.Text=opt; dobj._open=false; optBox.Visible=false; tw(arr,{Rotation=0},0.18); if subCb then subCb(opt) end end)
                    end
                    hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dobj._open=not dobj._open; optBox.Visible=dobj._open; tw(arr,{Rotation=dobj._open and 180 or 0},0.18) end end)
                    table.insert(tobj._subs,dobj); function dobj:Set(v) dobj._val=v; vL2.Text=v end; function dobj:Get() return dobj._val end; return dobj
                end

                -- SUB COLOR PICKER
                function tobj:AddSubColorPicker(subName,default,subCb)
                    arrL.Visible=true; local col=default or Color3.fromRGB(255,255,255); local cpObj={_val=col,_open=false}; local wT2=gT()
                    local r2,g2,b2=math.floor(col.R*255),math.floor(col.G*255),math.floor(col.B*255)
                    local ow=mkFrm(subC,UDim2.new(1,-8,0,0),nil,Color3.new(0,0,0),1); ow.AutomaticSize=Enum.AutomaticSize.Y; mkList(ow,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(ow,UDim2.new(1,0,0,30),nil,wT2.Toggle); mkCorner(hdr,8)
                    local d=mkLbl(hdr,"·",16,wT2.Accent); d.Size=UDim2.new(0,14,1,0); d.Position=UDim2.new(0,4,0,0)
                    local nL4=mkLbl(hdr,subName,11,wT2.TextDim); nL4.Size=UDim2.new(1,-54,1,0); nL4.Position=UDim2.new(0,20,0,0)
                    local prev=mkFrm(hdr,UDim2.new(0,18,0,18),UDim2.new(1,-38,0.5,-9),col); mkCorner(prev,5)
                    local cpArr=mkLbl(hdr,"v",10,wT2.TextDim,Enum.TextXAlignment.Center); cpArr.Size=UDim2.new(0,18,1,0); cpArr.Position=UDim2.new(1,-18,0,0)
                    local panel=mkFrm(ow,UDim2.new(1,0,0,0),nil,wT2.Background); panel.AutomaticSize=Enum.AutomaticSize.Y; panel.Visible=false; mkCorner(panel,8); mkStroke(panel,wT2.Accent,1,0.55); mkList(panel,Enum.FillDirection.Vertical,3); mkPad(panel,5,5,7,7)
                    local function rebC() local nc=Color3.fromRGB(r2,g2,b2); cpObj._val=nc; prev.BackgroundColor3=nc; if subCb then subCb(nc) end end
                    local chs={{"R",Color3.fromRGB(220,60,60)},{"G",Color3.fromRGB(60,200,80)},{"B",Color3.fromRGB(60,130,255)}}; local cv={r2,g2,b2}
                    for ci,ch in ipairs(chs) do
                        local crow=mkFrm(panel,UDim2.new(1,-6,0,26),nil,Color3.new(0,0,0),1); local chl=mkLbl(crow,ch[1],10,ch[2]); chl.Size=UDim2.new(0,14,1,0)
                        local ctrk=mkFrm(crow,UDim2.new(1,-56,0,5),UDim2.new(0,18,0.5,-2),wT2.Toggle); mkCorner(ctrk,3)
                        local cfill=mkFrm(ctrk,UDim2.new(cv[ci]/255,0,1,0),nil,ch[2]); mkCorner(cfill,3)
                        local cthumb=mkFrm(crow,UDim2.new(0,12,0,12),UDim2.new(0,18,0.5,-6),ch[2]); mkCorner(cthumb,6)
                        local cvLbl=mkLbl(crow,tostring(cv[ci]),10,wT2.TextDim,Enum.TextXAlignment.Right); cvLbl.Size=UDim2.new(0,28,1,0); cvLbl.Position=UDim2.new(1,-28,0,0)
                        local cDrg=false
                        local function cup(px) local pct=math.clamp((px-ctrk.AbsolutePosition.X)/math.max(ctrk.AbsoluteSize.X,1),0,1); cv[ci]=math.floor(pct*255); cfill.Size=UDim2.new(pct,0,1,0); cvLbl.Text=tostring(cv[ci]); r2,g2,b2=cv[1],cv[2],cv[3]; rebC() end
                        ctrk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=true; cup(i.Position.X) end end)
                        UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=false end end)
                        UserInputService.InputChanged:Connect(function(i) if cDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then cup(i.Position.X) end end)
                    end
                    hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cpObj._open=not cpObj._open; panel.Visible=cpObj._open; tw(cpArr,{Rotation=cpObj._open and 180 or 0},0.18) end end)
                    table.insert(tobj._subs,cpObj); function cpObj:Set(c) cpObj._val=c; prev.BackgroundColor3=c end; function cpObj:Get() return cpObj._val end; return cpObj
                end

                -- SUB LABEL
                function tobj:AddSubLabel(text)
                    arrL.Visible=true; local wT2=gT()
                    local sRow=mkFrm(subC,UDim2.new(1,-8,0,22),nil,Color3.new(0,0,0),1)
                    local d=mkLbl(sRow,"·",14,wT2.Accent); d.Size=UDim2.new(0,14,1,0)
                    local lbl=mkLbl(sRow,text,10,wT2.TextDim); lbl.Size=UDim2.new(1,-18,1,0); lbl.Position=UDim2.new(0,16,0,0); lbl.TextWrapped=true
                    table.insert(tobj._subs,{}); local obj={}; function obj:Set(t) lbl.Text=t end; function obj:Get() return lbl.Text end; return obj
                end

                function tobj:Set(v) tobj._val=v; upVis(v); if callback then callback(v) end end
                function tobj:Get() return tobj._val end
                return tobj
            end

            -- ── SLIDER ───────────────────────────────────────
            function sec:AddSlider(name,min,max,default,callback)
                local wT=gT(); local val=default or min; local sobj={_val=val}
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,52),nil,wT.Sub); mkCorner(wrap,8); mkStroke(wrap,wT.Border,1,0.5); mkPad(wrap,6,6,10,10)
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,22),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(hdr,name,13,wT.Text); nL.Size=UDim2.new(1,-50,1,0)
                local vL=mkLbl(hdr,tostring(math.floor(val)),12,wT.Accent,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0,46,1,0); vL.Position=UDim2.new(1,-46,0,0)
                local trk=mkFrm(wrap,UDim2.new(1,0,0,6),UDim2.new(0,0,0,28),wT.Toggle); mkCorner(trk,3)
                local fill=mkFrm(trk,UDim2.new((val-min)/(max-min),0,1,0),nil,wT.Slider); mkCorner(fill,3)
                local thumb=mkFrm(wrap,UDim2.new(0,18,0,18),UDim2.new(0,-9,0,25),wT.Slider); mkCorner(thumb,9)
                local sDrg=false
                local function upS(px) local pct=math.clamp((px-trk.AbsolutePosition.X)/math.max(trk.AbsoluteSize.X,1),0,1); val=min+pct*(max-min); sobj._val=val; tw(fill,{Size=UDim2.new(pct,0,1,0)},0.07); tw(thumb,{Position=UDim2.new(0,pct*trk.AbsoluteSize.X-9,0,25)},0.07); vL.Text=tostring(math.floor(val)); if callback then callback(val) end end
                trk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true; upS(i.Position.X) end end)
                thumb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true end end)
                UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=false end end)
                UserInputService.InputChanged:Connect(function(i) if sDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upS(i.Position.X) end end)
                function sobj:Set(v) upS(trk.AbsolutePosition.X+math.clamp((v-min)/(max-min),0,1)*trk.AbsoluteSize.X) end
                function sobj:Get() return sobj._val end; return sobj
            end

            -- ── DROPDOWN ─────────────────────────────────────
            function sec:AddDropdown(name,options,default,callback)
                local wT=gT(); local dobj={_val=default or options[1],_open=false}
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,0),nil,Color3.new(0,0,0),1); wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,3)
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,40),nil,wT.Sub); mkCorner(hdr,8); mkStroke(hdr,wT.Border,1,0.4); mkPad(hdr,0,0,10,10)
                local nL=mkLbl(hdr,name,13,wT.Text); nL.Size=UDim2.new(0.5,0,1,0)
                local vL=mkLbl(hdr,dobj._val,12,wT.Accent,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0.38,0,1,0); vL.Position=UDim2.new(0.5,0,0,0)
                local arr=mkLbl(hdr,"v",11,wT.TextDim,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,22,1,0); arr.Position=UDim2.new(1,-22,0,0)
                local optBox=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Background); optBox.AutomaticSize=Enum.AutomaticSize.Y; optBox.Visible=false; mkCorner(optBox,8); mkStroke(optBox,wT.Accent,1,0.5); mkList(optBox,Enum.FillDirection.Vertical,1); mkPad(optBox,4,4,6,6)
                for _,opt in ipairs(options) do
                    local ob=mkBtn(optBox,opt,12,wT.Text,Color3.new(0,0,0)); ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,32); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,10,10)
                    ob.MouseEnter:Connect(function() ob.BackgroundColor3=wT.AccentDark; tw(ob,{BackgroundTransparency=0.72},0.1) end)
                    ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
                    ob.MouseButton1Click:Connect(function() playSound("click",0.12,1.1); dobj._val=opt; vL.Text=opt; dobj._open=false; optBox.Visible=false; tw(arr,{Rotation=0},0.2); if callback then callback(opt) end end)
                end
                hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dobj._open=not dobj._open; optBox.Visible=dobj._open; tw(arr,{Rotation=dobj._open and 180 or 0},0.2) end end)
                function dobj:Set(v) dobj._val=v; vL.Text=v end; function dobj:Get() return dobj._val end; return dobj
            end

            -- ── BUTTON ───────────────────────────────────────
            function sec:AddButton(name,callback)
                local wT=gT()
                local b=mkBtn(secF,name,13,wT.Text,wT.Sub); b.Size=UDim2.new(1,-16,0,36); b.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(b,8); mkStroke(b,wT.Border,1,0.4)
                b.MouseEnter:Connect(function() playSound("hover",0.07,1.2); tw(b,{BackgroundColor3=wT.AccentDark,TextColor3=wT.Accent},0.14) end)
                b.MouseLeave:Connect(function() tw(b,{BackgroundColor3=wT.Sub,TextColor3=wT.Text},0.14) end)
                b.MouseButton1Click:Connect(function() playSound("click",0.16,1.0); tw(b,{BackgroundColor3=wT.Accent},0.07); task.wait(0.07); tw(b,{BackgroundColor3=wT.AccentDark},0.14); if callback then callback() end end)
                return b
            end

            -- ── LABEL ────────────────────────────────────────
            function sec:AddLabel(text)
                local wT=gT(); local l=mkLbl(secF,text,11,wT.TextDim); l.Size=UDim2.new(1,-16,0,20); l.TextWrapped=true
                local obj={}; function obj:Set(t) l.Text=t end; function obj:Get() return l.Text end; return obj
            end

            -- ── TEXTBOX ──────────────────────────────────────
            function sec:AddTextbox(name,placeholder,default,callback)
                local wT=gT()
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,58),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(wrap,name,11,wT.TextDim); nL.Size=UDim2.new(1,0,0,18)
                local tb=Instance.new("TextBox"); tb.Size=UDim2.new(1,0,0,34); tb.Position=UDim2.new(0,0,0,20); tb.BackgroundColor3=wT.Toggle; tb.Text=default or ""; tb.TextColor3=wT.Text; tb.TextSize=13; tb.Font=Enum.Font.Gotham; tb.ClearTextOnFocus=false; tb.PlaceholderText=placeholder or ""; tb.PlaceholderColor3=wT.TextDim; tb.Parent=wrap; mkCorner(tb,8); mkStroke(tb,wT.Border,1,0.15); mkPad(tb,0,0,10,10)
                tb.FocusLost:Connect(function(enter) if callback then callback(tb.Text,enter) end end)
                local obj={}; function obj:Set(v) tb.Text=v end; function obj:Get() return tb.Text end; return obj
            end

            -- ── COLOR PICKER ─────────────────────────────────
            function sec:AddColorPicker(name,default,callback)
                local wT=gT(); local col=default or Color3.fromRGB(255,255,255); local cpObj={_val=col,_open=false}
                local r3,g3,b3=math.floor(col.R*255),math.floor(col.G*255),math.floor(col.B*255)
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,0),nil,Color3.new(0,0,0),1); wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,3)
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,40),nil,wT.Sub); mkCorner(hdr,8); mkStroke(hdr,wT.Border,1,0.4); mkPad(hdr,0,0,10,10)
                local nL=mkLbl(hdr,name,13,wT.Text); nL.Size=UDim2.new(1,-60,1,0)
                local prev=mkFrm(hdr,UDim2.new(0,24,0,24),UDim2.new(1,-46,0.5,-12),col); mkCorner(prev,6)
                local arr=mkLbl(hdr,"v",11,wT.TextDim,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,20,1,0); arr.Position=UDim2.new(1,-20,0,0)
                local panel=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Card); panel.AutomaticSize=Enum.AutomaticSize.Y; panel.Visible=false; mkCorner(panel,8); mkStroke(panel,wT.Accent,1,0.5); mkList(panel,Enum.FillDirection.Vertical,4); mkPad(panel,6,6,8,8)
                local function rebC() local nc=Color3.fromRGB(r3,g3,b3); cpObj._val=nc; prev.BackgroundColor3=nc; if callback then callback(nc) end end
                local chs={{"R",Color3.fromRGB(220,60,60)},{"G",Color3.fromRGB(60,200,80)},{"B",Color3.fromRGB(60,130,255)}}; local cv={r3,g3,b3}
                for ci,ch in ipairs(chs) do
                    local crow=mkFrm(panel,UDim2.new(1,-8,0,30),nil,Color3.new(0,0,0),1); local chl=mkLbl(crow,ch[1],12,ch[2]); chl.Size=UDim2.new(0,16,1,0)
                    local ctrk=mkFrm(crow,UDim2.new(1,-62,0,6),UDim2.new(0,20,0.5,-3),wT.Toggle); mkCorner(ctrk,3)
                    local cfill=mkFrm(ctrk,UDim2.new(cv[ci]/255,0,1,0),nil,ch[2]); mkCorner(cfill,3)
                    local cthumb=mkFrm(crow,UDim2.new(0,14,0,14),UDim2.new(0,20,0.5,-7),ch[2]); mkCorner(cthumb,7)
                    local cvLbl=mkLbl(crow,tostring(cv[ci]),10,wT.TextDim,Enum.TextXAlignment.Right); cvLbl.Size=UDim2.new(0,32,1,0); cvLbl.Position=UDim2.new(1,-32,0,0)
                    local cDrg=false
                    local function cup(px) local pct=math.clamp((px-ctrk.AbsolutePosition.X)/math.max(ctrk.AbsoluteSize.X,1),0,1); cv[ci]=math.floor(pct*255); cfill.Size=UDim2.new(pct,0,1,0); cvLbl.Text=tostring(cv[ci]); r3,g3,b3=cv[1],cv[2],cv[3]; rebC() end
                    ctrk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=true; cup(i.Position.X) end end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=false end end)
                    UserInputService.InputChanged:Connect(function(i) if cDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then cup(i.Position.X) end end)
                end
                hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cpObj._open=not cpObj._open; panel.Visible=cpObj._open; tw(arr,{Rotation=cpObj._open and 180 or 0},0.2) end end)
                function cpObj:Set(c) cpObj._val=c; prev.BackgroundColor3=c end; function cpObj:Get() return cpObj._val end; return cpObj
            end

            -- ── KEYBIND ──────────────────────────────────────
            function sec:AddKeybind(name,default,callback)
                local wT=gT(); local key=default or Enum.KeyCode.Unknown; local listening=false; local kobj={_val=key}
                local row=mkFrm(secF,UDim2.new(1,-16,0,36),nil,wT.Sub); mkCorner(row,8); mkStroke(row,wT.Border,1,0.4); mkPad(row,0,0,10,10)
                local nL=mkLbl(row,name,13,wT.Text); nL.Size=UDim2.new(1,-80,1,0)
                local kb=mkBtn(row,key.Name or "NONE",10,wT.Accent,wT.Toggle); kb.Size=UDim2.new(0,68,0,24); kb.Position=UDim2.new(1,-68,0.5,-12); kb.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(kb,7); mkStroke(kb,wT.Accent,1,0.35)
                kb.MouseButton1Click:Connect(function() playSound("click",0.14,1.2); listening=true; kb.Text="···"; tw(kb,{BackgroundColor3=wT.Accent},0.13) end)
                UserInputService.InputBegan:Connect(function(inp,gpe)
                    if listening and inp.UserInputType==Enum.UserInputType.Keyboard then
                        listening=false; key=inp.KeyCode; kobj._val=key; kb.Text=key.Name; tw(kb,{BackgroundColor3=wT.Toggle},0.13); if callback then callback(key) end
                    elseif not gpe and inp.UserInputType==Enum.UserInputType.Keyboard and inp.KeyCode==key then if callback then callback(key) end end
                end)
                function kobj:Set(k) key=k; kobj._val=k; kb.Text=k.Name end; function kobj:Get() return kobj._val end; return kobj
            end

            return sec
        end -- AddSection
        return tab
    end -- AddTab

    -- ── ROLE COLORS (mesmo do Old) ───────────────────────────
    local RoleColors={owner=Color3.fromRGB(220,220,220),vip=Color3.fromRGB(255,196,0),creator=Color3.fromRGB(215,40,40),free=Color3.fromRGB(120,120,130)}
    local RoleLabels={owner="👑  DONO",vip="⭐  VIP",creator="🎨  CONTENT CREATOR",free="🔓  FREE"}
    local RoleBg={owner=Color3.fromRGB(30,30,30),vip=Color3.fromRGB(50,38,0),creator=Color3.fromRGB(50,8,8),free=Color3.fromRGB(22,22,26)}

    function Win:AddProfileTab(popts)
        popts=popts or {}
        local role=(popts.Role or "free"):lower()
        local key=popts.KeyUsed or "—"
        local username=popts.Username or LocalPlayer.Name
        local tabName=popts.TabName or "PERFIL"
        local roleColor=RoleColors[role] or RoleColors.free
        local roleLbl=RoleLabels[role] or role:upper()
        local roleBg=RoleBg[role] or RoleBg.free

        local tab=Win:AddTab(tabName,"👤")
        local content=tab._content

        local cardF=mkFrm(content,UDim2.new(1,0,0,0),nil,T.Card)
        cardF.AutomaticSize=Enum.AutomaticSize.Y; mkCorner(cardF,12); mkStroke(cardF,roleColor,1,0.35)
        mkList(cardF,Enum.FillDirection.Vertical,5); mkPad(cardF,14,14,14,14)

        -- badge
        local badgeF=mkFrm(cardF,UDim2.new(1,0,0,30),nil,Color3.new(0,0,0),1)
        local badgeBg=mkFrm(badgeF,UDim2.new(0,0,0,24),UDim2.new(0,0,0.5,-12),roleColor)
        badgeBg.AutomaticSize=Enum.AutomaticSize.X; mkCorner(badgeBg,5); mkPad(badgeBg,0,0,10,10)
        local badgeL=mkLbl(badgeBg,roleLbl,10,T.Background,Enum.TextXAlignment.Center)
        badgeL.Size=UDim2.new(0,0,1,0); badgeL.AutomaticSize=Enum.AutomaticSize.X

        -- boas vindas
        local wF=mkFrm(cardF,UDim2.new(1,0,0,46),nil,Color3.new(0,0,0),1)
        local wL1=mkLbl(wF,"Bem-vindo,",12,T.TextDim); wL1.Size=UDim2.new(1,0,0,18)
        local wL2=mkLbl(wF,username,18,roleColor); wL2.Size=UDim2.new(1,0,0,24); wL2.Position=UDim2.new(0,0,0,20)

        local sepF=mkFrm(cardF,UDim2.new(1,0,0,1),nil,roleColor); sepF.BackgroundTransparency=0.65

        local function infoRow(lb,val,vc)
            local row=mkFrm(cardF,UDim2.new(1,0,0,26),nil,Color3.new(0,0,0),1)
            local lL=mkLbl(row,lb,11,T.TextDim); lL.Size=UDim2.new(0.45,0,1,0)
            local vL=mkLbl(row,val,11,vc or T.Text,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0.55,0,1,0); vL.Position=UDim2.new(0.45,0,0,0)
            return row,vL
        end

        local masked=(#key>6) and (string.rep("*",#key-6)..key:sub(-6)) or key
        infoRow("🔑  Key:",masked,roleColor)
        infoRow("🎭  Role:",roleLbl:gsub("^.-%s+",""),roleColor)
        local dn=LocalPlayer.DisplayName or username
        infoRow("👤  Jogador:",dn,T.Text)
        if popts.ExtraInfo then for _,ei in ipairs(popts.ExtraInfo) do infoRow(ei.label or "",ei.value or "",ei.color or T.Text) end end

        local sepF2=mkFrm(cardF,UDim2.new(1,0,0,1),nil,roleColor); sepF2.BackgroundTransparency=0.65

        local copyBtn=mkBtn(cardF,"📋  Copiar Key",12,roleColor,T.Toggle)
        copyBtn.Size=UDim2.new(1,0,0,32); copyBtn.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(copyBtn,8); mkStroke(copyBtn,roleColor,1,0.45)
        copyBtn.MouseEnter:Connect(function() tw(copyBtn,{BackgroundColor3=RoleBg[role]},0.12) end)
        copyBtn.MouseLeave:Connect(function() tw(copyBtn,{BackgroundColor3=T.Toggle},0.12) end)
        copyBtn.MouseButton1Click:Connect(function()
            pcall(function() setclipboard(key) end)
            PL7New:Notify({Title="Key Copiada",Text="Copiado!",Type="success",Duration=2,Theme=Win._themeName})
        end)

        Win._role=role; Win._profileTab=tab; return tab
    end

    function Win:SetRoleVisibility(role,roleMap)
        role=(role or "free"):lower(); Win._role=role
        for tab,allowedRoles in pairs(roleMap) do
            local allowed=false; for _,r in ipairs(allowedRoles) do if r:lower()==role then allowed=true; break end end
            tab._iconBtn.Visible=allowed; tab._content.Visible=allowed and (tab==Win._activeTab)
            if not allowed and tab==Win._activeTab then for _,t in ipairs(Win._tabs) do if t._iconBtn.Visible then t._iconBtn.MouseButton1Click:Fire(); break end end end
        end
    end

    function Win:Toggle() root.Visible=not root.Visible end
    function Win:Destroy() pcall(function() root:Destroy() end); pcall(function() floatBar:Destroy() end) end

    -- open anim
    root.BackgroundTransparency=1
    root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-16)
    tw(root,{BackgroundTransparency=0,Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+16)},0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
    playSound("open",0.16,1.0)
    return Win
end

-- ============================================================
--  FIREBASE  (igual ao Old, compativel)
-- ============================================================
function PL7New:ValidateKeyFirebase(databaseUrl,key,callback)
    task.spawn(function()
        local ok,res=pcall(function() return game:HttpGet(databaseUrl.."/keys/"..key..".json") end)
        if not ok then callback(false,nil,nil,"Erro de rede"); return end
        local data=nil; pcall(function() data=HttpService:JSONDecode(res) end)
        if not data or data==HttpService:JSONDecode("null") then callback(false,nil,nil,"Key nao encontrada"); return end
        if data.desativada==true then callback(false,nil,data,"Key desativada"); return end
        if data.usada==true and data.usuario_maximo==1 then callback(false,nil,data,"Key de uso unico ja utilizada"); return end
        if data.expira_em then
            local ay,am,ad=data.expira_em:match("^(%d+)-(%d+)-(%d+)$")
            if ay and am and ad then
                local now=os.time(); local expTs=os.time({year=tonumber(ay),month=tonumber(am),day=tonumber(ad),hour=23,min=59,sec=59})
                if now>expTs then callback(false,nil,data,"Key expirada em "..data.expira_em); return end
            end
        end
        if data.usuario_maximo and data.usuarios_atuais then
            if data.usuarios_atuais>=data.usuario_maximo then callback(false,nil,data,"Limite de usuarios atingido ("..data.usuarios_atuais.."/"..data.usuario_maximo..")"); return end
        end
        pcall(function()
            local novos=(data.usuarios_atuais or 0)+1
            HttpService:RequestAsync({Url=databaseUrl.."/keys/"..key.."/usuarios_atuais.json",Method="PUT",Headers={["Content-Type"]="application/json"},Body=tostring(novos)})
        end)
        game.Players.LocalPlayer.AncestryChanged:Connect(function()
            pcall(function()
                local novos=math.max(0,(data.usuarios_atuais or 1)-1)
                HttpService:RequestAsync({Url=databaseUrl.."/keys/"..key.."/usuarios_atuais.json",Method="PUT",Headers={["Content-Type"]="application/json"},Body=tostring(novos)})
            end)
        end)
        local role=(data.role or "free"):lower()
        callback(true,role,data,"Acesso liberado como "..role)
    end)
end

function PL7New:ValidateKeyPastebin(pastebinUrl,key,callback)
    task.spawn(function()
        local ok,res=pcall(function() return game:HttpGet(pastebinUrl) end)
        if not ok then callback(false,nil,"Erro de rede"); return end
        local found=false; local role="free"
        for line in res:gmatch("[^\r\n]+") do
            line=line:match("^%s*(.-)%s*$")
            local k,r=line:match("^(.-)%s+%((.-)%)$")
            if k and r and k==key then found=true; role=r:lower(); break end
            if line==key then found=true; break end
        end
        if found then callback(true,role,{key=key,role=role})
        else callback(false,nil,"Key nao encontrada") end
    end)
end

return PL7New
