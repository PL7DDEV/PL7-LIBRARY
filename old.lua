--[[
    ██████╗ ██╗      ███████╗    ██╗   ██╗██╗
    ██╔══██╗██║      ╚════██║    ██║   ██║██║
    ██████╔╝██║          ██╔╝    ██║   ██║██║
    ██╔═══╝ ██║         ██╔╝     ██║   ██║██║
    ██║     ███████╗    ██║      ╚██████╔╝██║
    ╚═╝     ╚══════╝    ╚═╝       ╚═════╝ ╚═╝
    PL7 UI Library  |  v1.2.0
    Gotham | Black Default | Login | Emoji Tabs | Full Theme
--]]

local PL7 = {}
PL7.__index = PL7

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService      = game:GetService("HttpService")
local CoreGui          = game:GetService("CoreGui")
local LocalPlayer      = Players.LocalPlayer

-- ============================================================
--  FONT  (Gotham Regular em toda a UI)
-- ============================================================
local F = { Regular = Enum.Font.Gotham }

-- ============================================================
--  THEMES
-- ============================================================
PL7.Themes = {
    Black = {
        Name=        "Black",
        Background=  Color3.fromRGB(6,6,7),
        TopBar=      Color3.fromRGB(11,11,13),
        TabBar=      Color3.fromRGB(8,8,10),
        Content=     Color3.fromRGB(9,9,11),
        Accent=      Color3.fromRGB(225,225,225),
        AccentDark=  Color3.fromRGB(50,50,55),
        Border=      Color3.fromRGB(34,34,38),
        Text=        Color3.fromRGB(238,238,238),
        TextDim=     Color3.fromRGB(108,108,115),
        Toggle=      Color3.fromRGB(28,28,33),
        ToggleOn=    Color3.fromRGB(215,215,215),
        Sub=         Color3.fromRGB(13,13,16),
        Slider=      Color3.fromRGB(215,215,215),
        Notification=Color3.fromRGB(13,13,16),
        ScrollBar=   Color3.fromRGB(215,215,215),
    },
    Ghost = {
        Name=        "Ghost",
        Background=  Color3.fromRGB(8,10,18),
        TopBar=      Color3.fromRGB(14,20,36),
        TabBar=      Color3.fromRGB(6,8,16),
        Content=     Color3.fromRGB(10,13,22),
        Accent=      Color3.fromRGB(90,170,255),
        AccentDark=  Color3.fromRGB(30,70,140),
        Border=      Color3.fromRGB(30,60,100),
        Text=        Color3.fromRGB(200,220,255),
        TextDim=     Color3.fromRGB(90,120,165),
        Toggle=      Color3.fromRGB(20,40,80),
        ToggleOn=    Color3.fromRGB(90,170,255),
        Sub=         Color3.fromRGB(12,16,28),
        Slider=      Color3.fromRGB(90,170,255),
        Notification=Color3.fromRGB(14,20,36),
        ScrollBar=   Color3.fromRGB(90,170,255),
    },
    Blood = {
        Name=        "Blood",
        Background=  Color3.fromRGB(10,4,6),
        TopBar=      Color3.fromRGB(22,6,8),
        TabBar=      Color3.fromRGB(14,4,6),
        Content=     Color3.fromRGB(12,5,7),
        Accent=      Color3.fromRGB(215,40,40),
        AccentDark=  Color3.fromRGB(100,10,10),
        Border=      Color3.fromRGB(100,22,22),
        Text=        Color3.fromRGB(255,185,185),
        TextDim=     Color3.fromRGB(155,85,85),
        Toggle=      Color3.fromRGB(60,12,12),
        ToggleOn=    Color3.fromRGB(215,40,40),
        Sub=         Color3.fromRGB(18,6,6),
        Slider=      Color3.fromRGB(215,40,40),
        Notification=Color3.fromRGB(20,6,6),
        ScrollBar=   Color3.fromRGB(215,40,40),
    },
    Void = {
        Name=        "Void",
        Background=  Color3.fromRGB(8,6,16),
        TopBar=      Color3.fromRGB(18,10,36),
        TabBar=      Color3.fromRGB(10,6,22),
        Content=     Color3.fromRGB(10,7,18),
        Accent=      Color3.fromRGB(160,95,190),
        AccentDark=  Color3.fromRGB(70,30,100),
        Border=      Color3.fromRGB(80,40,130),
        Text=        Color3.fromRGB(225,195,255),
        TextDim=     Color3.fromRGB(130,100,180),
        Toggle=      Color3.fromRGB(50,20,80),
        ToggleOn=    Color3.fromRGB(160,95,190),
        Sub=         Color3.fromRGB(14,8,28),
        Slider=      Color3.fromRGB(160,95,190),
        Notification=Color3.fromRGB(16,10,32),
        ScrollBar=   Color3.fromRGB(160,95,190),
    },
    Emerald = {
        Name=        "Emerald",
        Background=  Color3.fromRGB(4,13,8),
        TopBar=      Color3.fromRGB(8,24,14),
        TabBar=      Color3.fromRGB(4,15,9),
        Content=     Color3.fromRGB(5,15,9),
        Accent=      Color3.fromRGB(52,220,118),
        AccentDark=  Color3.fromRGB(16,90,45),
        Border=      Color3.fromRGB(20,100,50),
        Text=        Color3.fromRGB(185,255,215),
        TextDim=     Color3.fromRGB(90,165,120),
        Toggle=      Color3.fromRGB(10,52,26),
        ToggleOn=    Color3.fromRGB(52,220,118),
        Sub=         Color3.fromRGB(6,18,10),
        Slider=      Color3.fromRGB(52,220,118),
        Notification=Color3.fromRGB(8,20,12),
        ScrollBar=   Color3.fromRGB(52,220,118),
    },
    Gold = {
        Name=        "Gold",
        Background=  Color3.fromRGB(14,10,4),
        TopBar=      Color3.fromRGB(28,20,6),
        TabBar=      Color3.fromRGB(18,12,4),
        Content=     Color3.fromRGB(16,11,5),
        Accent=      Color3.fromRGB(255,200,0),
        AccentDark=  Color3.fromRGB(140,100,0),
        Border=      Color3.fromRGB(140,100,10),
        Text=        Color3.fromRGB(255,242,185),
        TextDim=     Color3.fromRGB(180,152,82),
        Toggle=      Color3.fromRGB(80,55,0),
        ToggleOn=    Color3.fromRGB(255,200,0),
        Sub=         Color3.fromRGB(20,14,4),
        Slider=      Color3.fromRGB(255,200,0),
        Notification=Color3.fromRGB(26,18,4),
        ScrollBar=   Color3.fromRGB(255,200,0),
    },
    Ice = {
        Name=        "Ice",
        Background=  Color3.fromRGB(10,16,22),
        TopBar=      Color3.fromRGB(16,28,40),
        TabBar=      Color3.fromRGB(8,14,20),
        Content=     Color3.fromRGB(12,18,26),
        Accent=      Color3.fromRGB(110,225,255),
        AccentDark=  Color3.fromRGB(30,110,160),
        Border=      Color3.fromRGB(40,130,180),
        Text=        Color3.fromRGB(205,242,255),
        TextDim=     Color3.fromRGB(100,172,212),
        Toggle=      Color3.fromRGB(20,60,90),
        ToggleOn=    Color3.fromRGB(110,225,255),
        Sub=         Color3.fromRGB(12,22,32),
        Slider=      Color3.fromRGB(110,225,255),
        Notification=Color3.fromRGB(14,24,36),
        ScrollBar=   Color3.fromRGB(110,225,255),
    },
    Rose = {
        Name=        "Rose",
        Background=  Color3.fromRGB(16,8,12),
        TopBar=      Color3.fromRGB(28,12,20),
        TabBar=      Color3.fromRGB(18,8,14),
        Content=     Color3.fromRGB(20,10,15),
        Accent=      Color3.fromRGB(255,105,155),
        AccentDark=  Color3.fromRGB(140,40,80),
        Border=      Color3.fromRGB(140,52,90),
        Text=        Color3.fromRGB(255,202,222),
        TextDim=     Color3.fromRGB(182,112,142),
        Toggle=      Color3.fromRGB(80,22,46),
        ToggleOn=    Color3.fromRGB(255,105,155),
        Sub=         Color3.fromRGB(22,10,16),
        Slider=      Color3.fromRGB(255,105,155),
        Notification=Color3.fromRGB(26,12,18),
        ScrollBar=   Color3.fromRGB(255,105,155),
    },
    Ash = {
        Name=        "Ash",
        Background=  Color3.fromRGB(14,14,16),
        TopBar=      Color3.fromRGB(22,22,26),
        TabBar=      Color3.fromRGB(16,16,18),
        Content=     Color3.fromRGB(18,18,20),
        Accent=      Color3.fromRGB(185,185,205),
        AccentDark=  Color3.fromRGB(80,80,100),
        Border=      Color3.fromRGB(62,62,80),
        Text=        Color3.fromRGB(222,222,232),
        TextDim=     Color3.fromRGB(122,122,142),
        Toggle=      Color3.fromRGB(50,50,65),
        ToggleOn=    Color3.fromRGB(185,185,205),
        Sub=         Color3.fromRGB(20,20,24),
        Slider=      Color3.fromRGB(185,185,205),
        Notification=Color3.fromRGB(20,20,24),
        ScrollBar=   Color3.fromRGB(185,185,205),
    },
    Ocean = {
        Name=        "Ocean",
        Background=  Color3.fromRGB(5,14,26),
        TopBar=      Color3.fromRGB(8,22,42),
        TabBar=      Color3.fromRGB(6,16,30),
        Content=     Color3.fromRGB(7,17,32),
        Accent=      Color3.fromRGB(0,188,212),
        AccentDark=  Color3.fromRGB(0,80,100),
        Border=      Color3.fromRGB(0,90,120),
        Text=        Color3.fromRGB(185,242,252),
        TextDim=     Color3.fromRGB(80,160,185),
        Toggle=      Color3.fromRGB(0,40,70),
        ToggleOn=    Color3.fromRGB(0,188,212),
        Sub=         Color3.fromRGB(6,18,34),
        Slider=      Color3.fromRGB(0,188,212),
        Notification=Color3.fromRGB(8,20,38),
        ScrollBar=   Color3.fromRGB(0,188,212),
    },
    Sunset = {
        Name=        "Sunset",
        Background=  Color3.fromRGB(16,8,14),
        TopBar=      Color3.fromRGB(28,12,18),
        TabBar=      Color3.fromRGB(20,9,15),
        Content=     Color3.fromRGB(22,10,16),
        Accent=      Color3.fromRGB(255,130,60),
        AccentDark=  Color3.fromRGB(150,55,10),
        Border=      Color3.fromRGB(150,60,30),
        Text=        Color3.fromRGB(255,225,200),
        TextDim=     Color3.fromRGB(185,130,100),
        Toggle=      Color3.fromRGB(90,32,12),
        ToggleOn=    Color3.fromRGB(255,130,60),
        Sub=         Color3.fromRGB(24,12,14),
        Slider=      Color3.fromRGB(255,130,60),
        Notification=Color3.fromRGB(26,12,16),
        ScrollBar=   Color3.fromRGB(255,130,60),
    },
    Mint = {
        Name=        "Mint",
        Background=  Color3.fromRGB(6,16,14),
        TopBar=      Color3.fromRGB(10,26,22),
        TabBar=      Color3.fromRGB(7,18,16),
        Content=     Color3.fromRGB(8,19,17),
        Accent=      Color3.fromRGB(100,235,195),
        AccentDark=  Color3.fromRGB(20,100,80),
        Border=      Color3.fromRGB(25,110,90),
        Text=        Color3.fromRGB(195,252,235),
        TextDim=     Color3.fromRGB(90,170,145),
        Toggle=      Color3.fromRGB(15,55,46),
        ToggleOn=    Color3.fromRGB(100,235,195),
        Sub=         Color3.fromRGB(8,20,18),
        Slider=      Color3.fromRGB(100,235,195),
        Notification=Color3.fromRGB(10,22,20),
        ScrollBar=   Color3.fromRGB(100,235,195),
    },
}

-- ============================================================
--  HELPERS
-- ============================================================
local function tw(obj, props, t, style, dir)
    TweenService:Create(obj,
        TweenInfo.new(t or 0.18, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
        props):Play()
end

local function mkCorner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = p; return c
end

local function mkStroke(p, col, thick, trans)
    local s = Instance.new("UIStroke")
    s.Color=col; s.Thickness=thick or 1; s.Transparency=trans or 0
    s.Parent=p; return s
end

local function mkPad(p, t, b, l, r)
    local u = Instance.new("UIPadding")
    u.PaddingTop=UDim.new(0,t or 6); u.PaddingBottom=UDim.new(0,b or 6)
    u.PaddingLeft=UDim.new(0,l or 10); u.PaddingRight=UDim.new(0,r or 10)
    u.Parent=p; return u
end

local function mkList(p, dir, sp)
    local l = Instance.new("UIListLayout")
    l.FillDirection=dir or Enum.FillDirection.Vertical
    l.Padding=UDim.new(0,sp or 3)
    l.SortOrder=Enum.SortOrder.LayoutOrder
    l.Parent=p; return l
end

local function mkLbl(parent, text, sz, col, bold, xa)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency=1
    l.Text=text or ""; l.TextSize=sz or 13
    l.TextColor3=col or Color3.fromRGB(230,230,230)
    l.Font=Enum.Font.Gotham   -- sempre Gotham normal
    l.TextXAlignment=xa or Enum.TextXAlignment.Left
    l.TextYAlignment=Enum.TextYAlignment.Center
    l.RichText=true
    l.Size=UDim2.new(1,0,0,(sz or 13)+6)
    l.Parent=parent; return l
end

local function mkBtn(parent, text, sz, col, bg, bold)
    local b = Instance.new("TextButton")
    b.BackgroundColor3=bg or Color3.fromRGB(22,22,26)
    b.Text=text or ""; b.TextSize=sz or 13
    b.TextColor3=col or Color3.fromRGB(230,230,230)
    b.Font=Enum.Font.Gotham   -- sempre Gotham normal
    b.AutoButtonColor=false; b.BorderSizePixel=0
    b.RichText=true; b.Parent=parent; return b
end

local function mkFrm(parent, size, pos, col, trans)
    local f = Instance.new("Frame")
    f.Size=size or UDim2.new(1,0,0,36)
    f.Position=pos or UDim2.new(0,0,0,0)
    f.BackgroundColor3=col or Color3.fromRGB(10,10,14)
    f.BackgroundTransparency=trans or 0
    f.BorderSizePixel=0; f.Parent=parent; return f
end

local function mkScroll(parent, col, accent)
    local s = Instance.new("ScrollingFrame")
    s.BackgroundColor3=col or Color3.fromRGB(9,9,11)
    s.BackgroundTransparency=0; s.BorderSizePixel=0
    s.ScrollBarThickness=3
    s.ScrollBarImageColor3=accent or Color3.fromRGB(215,215,215)
    s.CanvasSize=UDim2.new(0,0,0,0)
    s.AutomaticCanvasSize=Enum.AutomaticSize.Y
    s.Size=UDim2.new(1,0,1,0); s.Parent=parent; return s
end

local function mkDrag(handle, target)
    local dragging,dragInput,dragStart,startPos=false,nil,nil,nil
    local function update(inp)
        local d=inp.Position-dragStart
        tw(target,{Position=UDim2.new(
            startPos.X.Scale,startPos.X.Offset+d.X,
            startPos.Y.Scale,startPos.Y.Offset+d.Y
        )},0.07)
    end
    handle.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1
        or inp.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=inp.Position; startPos=target.Position
            inp.Changed:Connect(function()
                if inp.UserInputState==Enum.UserInputState.End then dragging=false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseMovement
        or inp.UserInputType==Enum.UserInputType.Touch then dragInput=inp end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if inp==dragInput and dragging then update(inp) end
    end)
end

-- ============================================================
--  SCREEN GUI
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name="PL7UI"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset=true
pcall(function() ScreenGui.Parent=CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent=LocalPlayer:WaitForChild("PlayerGui") end

-- Notif holder
local NotifHolder = mkFrm(ScreenGui,UDim2.new(0,290,1,0),UDim2.new(1,-302,0,0),Color3.new(0,0,0),1)
NotifHolder.Name="PL7Notifs"
local _nl=mkList(NotifHolder,Enum.FillDirection.Vertical,8)
_nl.VerticalAlignment=Enum.VerticalAlignment.Bottom
Instance.new("UIPadding",NotifHolder).PaddingBottom=UDim.new(0,14)

-- ============================================================
--  NOTIFICATIONS
-- ============================================================
local NC={success=Color3.fromRGB(52,220,118),error=Color3.fromRGB(225,55,55),warning=Color3.fromRGB(255,198,0),info=Color3.fromRGB(90,175,255)}
local NI={success="✓",error="✕",warning="⚠",info="ℹ"}

function PL7:Notify(opts)
    opts=opts or {}
    local th=PL7.Themes[opts.Theme or PL7._currentTheme or "Black"]
    local nType=opts.Type or "info"
    local accent=NC[nType] or NC.info
    local dur=opts.Duration or 4

    local card=mkFrm(NotifHolder,UDim2.new(1,0,0,76),nil,th.Notification)
    card.ClipsDescendants=true; card.LayoutOrder=os.clock()*10000
    mkCorner(card,12); mkStroke(card,accent,1,0.5)

    local stripe=mkFrm(card,UDim2.new(0,4,1,0),nil,accent); mkCorner(stripe,2)
    local ico=mkFrm(card,UDim2.new(0,34,0,34),UDim2.new(0,16,0.5,-17),th.AccentDark); mkCorner(ico,17)
    local icoL=mkLbl(ico,NI[nType],15,accent,true,Enum.TextXAlignment.Center); icoL.Size=UDim2.new(1,0,1,0)
    local tL=mkLbl(card,opts.Title or "PL7 UI",14,th.Text,true); tL.Size=UDim2.new(1,-64,0,20); tL.Position=UDim2.new(0,58,0,12)
    local bL=mkLbl(card,opts.Text or "",12,th.TextDim); bL.Size=UDim2.new(1,-64,0,32); bL.Position=UDim2.new(0,58,0,30); bL.TextWrapped=true
    local pgBg=mkFrm(card,UDim2.new(1,0,0,3),UDim2.new(0,0,1,-3),th.Border)
    local pg=mkFrm(pgBg,UDim2.new(1,0,1,0),nil,accent); mkCorner(pg,1)

    card.Position=UDim2.new(1,12,0,0)
    tw(card,{Position=UDim2.new(0,0,0,0)},0.3,Enum.EasingStyle.Back)
    task.spawn(function()
        local steps=dur*30
        for i=steps,0,-1 do
            if pg and pg.Parent then pg.Size=UDim2.new(i/steps,0,1,0) end
            task.wait(1/30)
        end
        tw(card,{Position=UDim2.new(1,12,0,0)},0.22)
        task.wait(0.25); pcall(function() card:Destroy() end)
    end)
    return card
end

-- ============================================================
--  LOGIN SCREEN
-- ============================================================
function PL7:CreateLogin(opts)
    opts=opts or {}
    local th=PL7.Themes[opts.Theme or "Black"]
    local Login={}

    -- overlay
    local ov=mkFrm(ScreenGui,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),opts.BgColor or Color3.fromRGB(4,4,5))
    ov.Name="PL7Login"; ov.ZIndex=200

    -- grid decoration
    for i=1,5 do
        local h=mkFrm(ov,UDim2.new(1,0,0,1),UDim2.new(0,0,i*0.18,0),th.Border); h.BackgroundTransparency=0.88; h.ZIndex=200
        local v=mkFrm(ov,UDim2.new(0,1,1,0),UDim2.new(i*0.18,0,0,0),th.Border); v.BackgroundTransparency=0.88; v.ZIndex=200
    end

    -- card
    local card=mkFrm(ov,UDim2.new(0,340,0,0),UDim2.new(0.5,-170,0.5,-150),th.TopBar)
    card.AutomaticSize=Enum.AutomaticSize.Y; card.ZIndex=201
    mkCorner(card,16); mkStroke(card,th.Border,1,0.12)

    -- inner list
    mkList(card,Enum.FillDirection.Vertical,0)
    mkPad(card,24,24,24,24)

    -- top accent bar
    local topAcc=mkFrm(card,UDim2.new(0.5,0,0,2),UDim2.new(0.25,0,0,0),th.Accent)
    mkCorner(topAcc,1); topAcc.BackgroundTransparency=0.5; topAcc.ZIndex=202; topAcc.LayoutOrder=-10

    -- logo / icon
    local icoFrm=mkFrm(card,UDim2.new(1,0,0,52),nil,Color3.new(0,0,0),1)
    icoFrm.LayoutOrder=0
    local icoL=mkLbl(icoFrm,opts.Icon or "◈",32,th.Accent,true,Enum.TextXAlignment.Center)
    icoL.Size=UDim2.new(1,0,1,0); icoL.ZIndex=202
    task.spawn(function()
        local t=0
        while icoL and icoL.Parent do
            t=t+0.04; icoL.TextTransparency=0.05+math.abs(math.sin(t*0.7))*0.2; task.wait(0.04)
        end
    end)

    -- title
    local titFrm=mkFrm(card,UDim2.new(1,0,0,32),nil,Color3.new(0,0,0),1); titFrm.LayoutOrder=1
    local titL=mkLbl(titFrm,opts.Title or "PL7 UI",22,th.Text,true,Enum.TextXAlignment.Center)
    titL.Size=UDim2.new(1,0,1,0); titL.ZIndex=202

    -- subtitle
    local subFrm=mkFrm(card,UDim2.new(1,0,0,20),nil,Color3.new(0,0,0),1); subFrm.LayoutOrder=2
    local subL=mkLbl(subFrm,opts.Subtitle or "Faça login para continuar",13,th.TextDim,false,Enum.TextXAlignment.Center)
    subL.Size=UDim2.new(1,0,1,0); subL.ZIndex=202

    -- spacer
    local sp1=mkFrm(card,UDim2.new(1,0,0,12),nil,Color3.new(0,0,0),1); sp1.LayoutOrder=3

    -- ── KEY MODE ──────────────────────────────────────────
    local keyResult = nil
    local onSuccess,onFail = nil,nil

    if opts.UseKey then
        -- key input box
        local kFrm=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1)
        kFrm.AutomaticSize=Enum.AutomaticSize.Y; kFrm.LayoutOrder=4
        mkList(kFrm,Enum.FillDirection.Vertical,6)

        local kLbl=mkLbl(kFrm,"🔑  Chave de Acesso",12,th.TextDim,true)
        kLbl.Size=UDim2.new(1,0,0,18); kLbl.ZIndex=202

        local kBox=Instance.new("TextBox")
        kBox.Size=UDim2.new(1,0,0,38); kBox.BackgroundColor3=th.Toggle
        kBox.Text=""; kBox.TextColor3=th.Text; kBox.TextSize=13; kBox.Font=F.Regular
        kBox.ClearTextOnFocus=false; kBox.PlaceholderText="Cole sua key aqui..."
        kBox.PlaceholderColor3=th.TextDim; kBox.ZIndex=202; kBox.Parent=kFrm
        if opts.HideKey then kBox.TextTransparency=1 end -- opcional mascarar
        mkCorner(kBox,9); mkStroke(kBox,th.Border,1,0.2); mkPad(kBox,0,0,12,12)

        -- link key
        if opts.KeyLink then
            local getLbl=mkLbl(kFrm,"🔗  "..opts.KeyLink,10,th.Accent,false,Enum.TextXAlignment.Center)
            getLbl.Size=UDim2.new(1,0,0,16); getLbl.ZIndex=202
        end

        -- status label
        local statFrm=mkFrm(card,UDim2.new(1,0,0,18),nil,Color3.new(0,0,0),1); statFrm.LayoutOrder=5
        local statL=mkLbl(statFrm,"",12,th.TextDim,false,Enum.TextXAlignment.Center)
        statL.Size=UDim2.new(1,0,1,0); statL.ZIndex=202

        -- confirm button
        local cfmFrm=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1); cfmFrm.LayoutOrder=6
        local cfmBtn=mkBtn(cfmFrm,"✓  Confirmar Key",14,th.Background,th.Accent)
        cfmBtn.Size=UDim2.new(1,0,0,40); cfmBtn.TextXAlignment=Enum.TextXAlignment.Center; cfmBtn.ZIndex=202
        mkCorner(cfmBtn,10)
        cfmBtn.MouseEnter:Connect(function() tw(cfmBtn,{BackgroundColor3=th.AccentDark},0.12) end)
        cfmBtn.MouseLeave:Connect(function() tw(cfmBtn,{BackgroundColor3=th.Accent},0.12) end)

        cfmBtn.MouseButton1Click:Connect(function()
            local input=kBox.Text
            local valid=false
            if opts.Keys then
                for _,k in ipairs(opts.Keys) do
                    if k==input then valid=true; break end
                end
            elseif opts.KeyValidator then
                valid=opts.KeyValidator(input)
            else
                valid=(input~="")
            end

            if valid then
                keyResult=input
                statL.Text="✓  Acesso liberado!"; statL.TextColor3=NC.success
                tw(cfmBtn,{BackgroundColor3=NC.success},0.2)
                task.wait(0.8)
                tw(ov,{BackgroundTransparency=1},0.4)
                task.wait(0.42); pcall(function() ov:Destroy() end)
                if onSuccess then onSuccess(input) end
            else
                statL.Text="✕  Key inválida."; statL.TextColor3=NC.error
                tw(kBox,{BackgroundColor3=Color3.fromRGB(80,15,15)},0.1)
                task.wait(0.3); tw(kBox,{BackgroundColor3=th.Toggle},0.2)
                if onFail then onFail(input) end
            end
        end)

    else
        -- ── USER/PASS MODE ────────────────────────────────
        local formFrm=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1)
        formFrm.AutomaticSize=Enum.AutomaticSize.Y; formFrm.LayoutOrder=4
        mkList(formFrm,Enum.FillDirection.Vertical,8)

        local function mkField(lbTxt, ph, hidden)
            local wrap=mkFrm(formFrm,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1)
            wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,4)
            local lb=mkLbl(wrap,lbTxt,11,th.TextDim,true); lb.Size=UDim2.new(1,0,0,16); lb.ZIndex=202
            local tb=Instance.new("TextBox")
            tb.Size=UDim2.new(1,0,0,38); tb.BackgroundColor3=th.Toggle
            tb.Text=""; tb.TextSize=13; tb.Font=F.Regular
            tb.TextColor3=th.Text; tb.ClearTextOnFocus=false
            tb.PlaceholderText=ph or ""; tb.PlaceholderColor3=th.TextDim
            if hidden then tb.TextTransparency=1 end
            tb.ZIndex=202; tb.Parent=wrap
            mkCorner(tb,9); mkStroke(tb,th.Border,1,0.2); mkPad(tb,0,0,12,12)
            return tb
        end

        local userBox=mkField("👤  Usuário","Seu usuário...",false)
        local passBox=mkField("🔒  Senha","••••••••",true)

        -- show/hide senha
        local showPassBtn=mkBtn(formFrm,"👁  Mostrar senha",11,th.TextDim,Color3.new(0,0,0),false)
        showPassBtn.BackgroundTransparency=1; showPassBtn.Size=UDim2.new(0,140,0,20)
        showPassBtn.ZIndex=202
        local passVisible=false
        showPassBtn.MouseButton1Click:Connect(function()
            passVisible=not passVisible
            passBox.TextTransparency=passVisible and 0 or 1
            showPassBtn.Text=passVisible and "🙈  Esconder senha" or "👁  Mostrar senha"
        end)

        -- status
        local statFrm=mkFrm(card,UDim2.new(1,0,0,18),nil,Color3.new(0,0,0),1); statFrm.LayoutOrder=5
        local statL=mkLbl(statFrm,"",12,th.TextDim,false,Enum.TextXAlignment.Center)
        statL.Size=UDim2.new(1,0,1,0); statL.ZIndex=202

        -- login button
        local lgFrm=mkFrm(card,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1); lgFrm.LayoutOrder=6
        local lgBtn=mkBtn(lgFrm,"→  Entrar",14,th.Background,th.Accent)
        lgBtn.Size=UDim2.new(1,0,0,40); lgBtn.TextXAlignment=Enum.TextXAlignment.Center; lgBtn.ZIndex=202
        mkCorner(lgBtn,10)
        lgBtn.MouseEnter:Connect(function() tw(lgBtn,{BackgroundColor3=th.AccentDark},0.12) end)
        lgBtn.MouseLeave:Connect(function() tw(lgBtn,{BackgroundColor3=th.Accent},0.12) end)

        lgBtn.MouseButton1Click:Connect(function()
            local u=userBox.Text; local p=passBox.Text
            local valid=false
            if opts.Users then
                for _,pair in ipairs(opts.Users) do
                    if pair[1]==u and pair[2]==p then valid=true; break end
                end
            elseif opts.AuthValidator then
                valid=opts.AuthValidator(u,p)
            else
                valid=(u~="" and p~="")
            end

            if valid then
                statL.Text="✓  Bem-vindo, "..u.."!"; statL.TextColor3=NC.success
                tw(lgBtn,{BackgroundColor3=NC.success},0.2)
                task.wait(0.8)
                tw(ov,{BackgroundTransparency=1},0.4)
                task.wait(0.42); pcall(function() ov:Destroy() end)
                if onSuccess then onSuccess(u,p) end
            else
                statL.Text="✕  Usuário ou senha incorretos."; statL.TextColor3=NC.error
                tw(userBox,{BackgroundColor3=Color3.fromRGB(80,15,15)},0.1)
                tw(passBox,{BackgroundColor3=Color3.fromRGB(80,15,15)},0.1)
                task.wait(0.3)
                tw(userBox,{BackgroundColor3=th.Toggle},0.2)
                tw(passBox,{BackgroundColor3=th.Toggle},0.2)
                if onFail then onFail(u,p) end
            end
        end)
    end

    -- version footer
    local sp2=mkFrm(card,UDim2.new(1,0,0,8),nil,Color3.new(0,0,0),1); sp2.LayoutOrder=9
    local verFrm=mkFrm(card,UDim2.new(1,0,0,16),nil,Color3.new(0,0,0),1); verFrm.LayoutOrder=10
    local verL=mkLbl(verFrm,opts.Version or "PL7 UI  v1.2.0",10,th.TextDim,false,Enum.TextXAlignment.Center)
    verL.Size=UDim2.new(1,0,1,0); verL.ZIndex=202

    ov.BackgroundTransparency=1
    tw(ov,{BackgroundTransparency=0},0.38)

    function Login:OnSuccess(cb) onSuccess=cb end
    function Login:OnFail(cb) onFail=cb end
    function Login:Destroy() pcall(function() ov:Destroy() end) end

    return Login
end

-- ============================================================
--  LOADER
-- ============================================================
function PL7:CreateLoader(opts)
    opts=opts or {}
    local th=PL7.Themes[opts.Theme or "Black"]
    local Ldr={}

    local ov=mkFrm(ScreenGui,UDim2.new(1,0,1,0),UDim2.new(0,0,0,0),opts.BgColor or Color3.fromRGB(4,4,5))
    ov.Name="PL7Loader"; ov.ZIndex=100

    for i=1,5 do
        local h=mkFrm(ov,UDim2.new(1,0,0,1),UDim2.new(0,0,i*0.18,0),th.Border); h.BackgroundTransparency=0.88; h.ZIndex=100
        local v=mkFrm(ov,UDim2.new(0,1,1,0),UDim2.new(i*0.18,0,0,0),th.Border); v.BackgroundTransparency=0.88; v.ZIndex=100
    end

    local card=mkFrm(ov,UDim2.new(0,350,0,275),UDim2.new(0.5,-175,0.5,-137),th.TopBar)
    card.ZIndex=101; mkCorner(card,18); mkStroke(card,th.Border,1,0.15)

    local tLine=mkFrm(card,UDim2.new(0.5,0,0,2),UDim2.new(0.25,0,0,0),th.Accent)
    mkCorner(tLine,1); tLine.BackgroundTransparency=0.5; tLine.ZIndex=102

    if opts.Logo then
        local img=Instance.new("ImageLabel")
        img.Size=UDim2.new(0,56,0,56); img.Position=UDim2.new(0.5,-28,0,22)
        img.BackgroundTransparency=1; img.Image=opts.Logo; img.ZIndex=102; img.Parent=card
    else
        local ico=mkLbl(card,opts.Icon or "◈",36,th.Accent,true,Enum.TextXAlignment.Center)
        ico.Size=UDim2.new(1,0,0,58); ico.Position=UDim2.new(0,0,0,20); ico.ZIndex=102
        task.spawn(function()
            local t=0
            while ico and ico.Parent do
                t=t+0.04; ico.TextTransparency=0.05+math.abs(math.sin(t*0.8))*0.2; task.wait(0.04)
            end
        end)
    end

    local titL=mkLbl(card,opts.Title or "PL7 UI",24,th.Text,true,Enum.TextXAlignment.Center)
    titL.Size=UDim2.new(1,-20,0,30); titL.Position=UDim2.new(0,10,0,86); titL.ZIndex=102

    local stL=mkLbl(card,opts.Subtitle or "Carregando...",13,th.TextDim,false,Enum.TextXAlignment.Center)
    stL.Size=UDim2.new(1,-30,0,20); stL.Position=UDim2.new(0,15,0,120); stL.ZIndex=102

    local pgBg=mkFrm(card,UDim2.new(1,-44,0,6),UDim2.new(0,22,0,156),th.Border)
    pgBg.ZIndex=102; mkCorner(pgBg,3)
    local pgFill=mkFrm(pgBg,UDim2.new(0,0,1,0),nil,th.Accent); pgFill.ZIndex=103; mkCorner(pgFill,3)

    local pctL=mkLbl(card,"0%",12,th.Accent,true,Enum.TextXAlignment.Center)
    pctL.Size=UDim2.new(1,0,0,18); pctL.Position=UDim2.new(0,0,0,168); pctL.ZIndex=102

    local dotsL=mkLbl(card,"· · ·",13,th.TextDim,false,Enum.TextXAlignment.Center)
    dotsL.Size=UDim2.new(1,0,0,18); dotsL.Position=UDim2.new(0,0,0,194); dotsL.ZIndex=102
    task.spawn(function()
        local pts={"●  ·  ·","·  ●  ·","·  ·  ●","·  ●  ·"}; local i=1
        while dotsL and dotsL.Parent do dotsL.Text=pts[i]; i=i%#pts+1; task.wait(0.32) end
    end)

    ov.BackgroundTransparency=1; tw(ov,{BackgroundTransparency=0},0.38)

    function Ldr:SetStatus(t) stL.Text=t end
    function Ldr:SetProgress(p)
        p=math.clamp(p,0,100); tw(pgFill,{Size=UDim2.new(p/100,0,1,0)},0.26)
        pctL.Text=math.floor(p).."%"
    end
    function Ldr:Finish(cb,delay_)
        self:SetProgress(100); self:SetStatus("Pronto!")
        task.wait(delay_ or 0.5); tw(ov,{BackgroundTransparency=1},0.44)
        task.wait(0.48); pcall(function() ov:Destroy() end)
        if cb then cb() end
    end
    function Ldr:Destroy() pcall(function() ov:Destroy() end) end
    return Ldr
end

-- ============================================================
--  WINDOW
-- ============================================================
function PL7:CreateWindow(opts)
    opts=opts or {}
    PL7._currentTheme=opts.Theme or "Black"

    local Win={_tabs={},_activeTab=nil,_theme=PL7.Themes[PL7._currentTheme],_themeName=PL7._currentTheme}
    local T=Win._theme
    local W=(opts.Size and opts.Size[1]) or 315
    local H=(opts.Size and opts.Size[2]) or 365
    local TAB_W=76

    -- root
    local root=mkFrm(ScreenGui,UDim2.new(0,W,0,H),UDim2.new(0.5,-W/2,0.5,-H/2),T.Background)
    root.Name="PL7Window"; root.ClipsDescendants=false
    mkCorner(root,12); mkStroke(root,T.Border,1,0.1); Win._root=root

    local shad=Instance.new("ImageLabel")
    -- sombra removida

    -- topbar
    local topbar=mkFrm(root,UDim2.new(1,0,0,46),UDim2.new(0,0,0,0),T.TopBar)
    mkCorner(topbar,12)
    local topfix=mkFrm(root,UDim2.new(1,0,0,12),UDim2.new(0,0,0,34),T.TopBar); topfix.ZIndex=0

    local tUnder=mkFrm(topbar,UDim2.new(0.45,0,0,2),UDim2.new(0.275,0,1,-1),T.Accent)
    tUnder.BackgroundTransparency=0.55; mkCorner(tUnder,1)

    -- titulo com fonte Gotham normal
    local titL2=mkLbl(topbar,opts.Title or "PL7 UI",14,T.Text,false)
    titL2.Font=Enum.Font.Gotham
    titL2.Size=UDim2.new(1,-96,1,0); titL2.Position=UDim2.new(0,14,0,0); Win._titleLbl=titL2

    local ctrlF=mkFrm(topbar,UDim2.new(0,62,0,28),UDim2.new(1,-66,0.5,-14),Color3.new(0,0,0),1)
    mkList(ctrlF,Enum.FillDirection.Horizontal,6)

    local function mkCtrl(icon,col)
        local b=mkBtn(ctrlF,icon,13,col,Color3.new(0,0,0))
        b.Font=Enum.Font.Gotham
        b.BackgroundTransparency=1; b.Size=UDim2.new(0,28,0,28); mkCorner(b,7)
        b.MouseEnter:Connect(function()
            b.BackgroundColor3=col
            tw(b,{BackgroundTransparency=0.78,Size=UDim2.new(0,28,0,28)},0.14,Enum.EasingStyle.Quad)
        end)
        b.MouseLeave:Connect(function()
            tw(b,{BackgroundTransparency=1},0.14,Enum.EasingStyle.Quad)
        end)
        return b
    end
    local cfgBtn=mkCtrl("⚙",T.TextDim)
    local closeBtn=mkCtrl("✕",Color3.fromRGB(225,65,65))
    mkDrag(topbar,root)

    -- fechar: slide down + fade
    closeBtn.MouseButton1Click:Connect(function()
        tw(root,{
            Position=UDim2.new(
                root.Position.X.Scale, root.Position.X.Offset,
                root.Position.Y.Scale, root.Position.Y.Offset+18
            ),
            BackgroundTransparency=1,
        }, 0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        for _,d in pairs(root:GetDescendants()) do
            if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
                tw(d,{TextTransparency=1},0.15)
            elseif d:IsA("Frame") or d:IsA("ScrollingFrame") then
                tw(d,{BackgroundTransparency=1},0.15)
            end
        end
        task.wait(0.2); root.Visible=false
        root.BackgroundTransparency=0
        for _,d in pairs(root:GetDescendants()) do
            if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
                d.TextTransparency=0
            elseif d:IsA("Frame") then
                -- nao resetar manualmente, deixa o tema cuidar
            end
        end
    end)

    -- tabbar com SCROLL
    local tabBar=Instance.new("ScrollingFrame")
    tabBar.Name="PL7TabBar"
    tabBar.Size=UDim2.new(0,TAB_W,1,-46)
    tabBar.Position=UDim2.new(0,0,0,46)
    tabBar.BackgroundColor3=T.TabBar
    tabBar.BorderSizePixel=0
    tabBar.ScrollBarThickness=0        -- scrollbar invisivel (scroll existe mas nao aparece)
    tabBar.ScrollingDirection=Enum.ScrollingDirection.Y
    tabBar.CanvasSize=UDim2.new(0,0,0,0)
    tabBar.AutomaticCanvasSize=Enum.AutomaticSize.Y
    tabBar.ClipsDescendants=true
    tabBar.Parent=root
    mkList(tabBar,Enum.FillDirection.Vertical,0)
    local tbPad=Instance.new("UIPadding"); tbPad.PaddingTop=UDim.new(0,6); tbPad.PaddingBottom=UDim.new(0,6); tbPad.Parent=tabBar

    local tabSep=mkFrm(root,UDim2.new(0,1,1,-46),UDim2.new(0,TAB_W,0,46),T.Border); tabSep.BackgroundTransparency=0.25

    -- content
    local contentArea=mkFrm(root,UDim2.new(1,-TAB_W-1,1,-48),UDim2.new(0,TAB_W+1,0,47),T.Content)
    contentArea.ClipsDescendants=true; Win._contentArea=contentArea

    -- float button
    local floatBar=mkFrm(ScreenGui,UDim2.new(1,0,0,46),UDim2.new(0,0,0,0),Color3.new(0,0,0),1)
    floatBar.Name="PL7FloatBar"
    local floatBtn=mkBtn(floatBar,opts.FloatText or "◈  ABRIR PAINEL",12,T.Accent,T.TopBar)
    floatBtn.Font=Enum.Font.Gotham
    floatBtn.Size=UDim2.new(0,152,0,34); floatBtn.Position=UDim2.new(0.5,-76,0.5,-17)
    floatBtn.TextXAlignment=Enum.TextXAlignment.Center; floatBtn.ZIndex=90
    mkCorner(floatBtn,17); mkStroke(floatBtn,T.Accent,1,0.35); Win._floatBtn=floatBtn

    -- float pulse suave
    task.spawn(function()
        while floatBtn and floatBtn.Parent do
            tw(floatBtn,{BackgroundColor3=T.AccentDark},1.8,Enum.EasingStyle.Sine)
            task.wait(1.8)
            tw(floatBtn,{BackgroundColor3=T.TopBar},1.8,Enum.EasingStyle.Sine)
            task.wait(1.8)
        end
    end)

    floatBtn.MouseEnter:Connect(function()
        tw(floatBtn,{Size=UDim2.new(0,164,0,34)},0.16,Enum.EasingStyle.Back)
        floatBtn.Position=UDim2.new(0.5,-82,0.5,-17)
    end)
    floatBtn.MouseLeave:Connect(function()
        tw(floatBtn,{Size=UDim2.new(0,152,0,34)},0.16,Enum.EasingStyle.Quad)
        floatBtn.Position=UDim2.new(0.5,-76,0.5,-17)
    end)
    floatBtn.MouseButton1Click:Connect(function()
        if root.Visible then
            -- fechar com slide up + fade
            tw(root,{
                Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-14),
                BackgroundTransparency=1,
            },0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
            task.wait(0.2)
            root.Visible=false
            root.BackgroundTransparency=0
            root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+14)
        else
            -- abrir com slide down + fade in
            root.Visible=true
            root.BackgroundTransparency=1
            root.Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset-14)
            tw(root,{
                BackgroundTransparency=0,
                Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+14),
            },0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
        end
    end)

    -- ── APPLY THEME (FULL) ───────────────────────────────────
    function Win:ApplyTheme(name)
        local th=PL7.Themes[name]; if not th then return end
        T=th; self._theme=th; self._themeName=name; PL7._currentTheme=name

        -- root structure
        root.BackgroundColor3=th.Background
        topbar.BackgroundColor3=th.TopBar; topfix.BackgroundColor3=th.TopBar
        tabBar.BackgroundColor3=th.TabBar; tabSep.BackgroundColor3=th.Border
        contentArea.BackgroundColor3=th.Content
        tUnder.BackgroundColor3=th.Accent
        titL2.TextColor3=th.Text
        cfgBtn.TextColor3=th.TextDim
        floatBtn.TextColor3=th.Accent; floatBtn.BackgroundColor3=th.TopBar
        -- root stroke
        for _,c in pairs(root:GetChildren()) do
            if c:IsA("UIStroke") then c.Color=th.Border end
        end

        -- tabs
        for _,tab in ipairs(self._tabs) do
            tab._btn.BackgroundColor3=Color3.new(0,0,0)
            tab._nameL.TextColor3=th.TextDim
            tab._iconL.TextColor3=th.TextDim
            tab._abg.BackgroundColor3=th.Accent
            tab._ind.BackgroundColor3=th.Accent
            -- content
            tab._content.BackgroundColor3=th.Content
            tab._content.ScrollBarImageColor3=th.ScrollBar
            if tab==self._activeTab then
                tab._nameL.TextColor3=th.Accent
                tab._iconL.TextColor3=th.Accent
                tab._ind.BackgroundColor3=th.Accent
                tab._abg.BackgroundColor3=th.Accent
            end
            -- sections inside content
            for _,child in pairs(tab._content:GetChildren()) do
                if child:IsA("Frame") then
                    child.BackgroundColor3=th.Sub
                    for _,s in pairs(child:GetChildren()) do
                        if s:IsA("UIStroke") then s.Color=th.Border end
                    end
                    -- rows inside section
                    for _,row in pairs(child:GetDescendants()) do
                        if row:IsA("TextLabel") then
                            -- preserve accent colored labels
                        end
                        if row:IsA("Frame") and row.Name=="ToggleBg" then
                            -- toggle bg handled by toggle state
                        end
                    end
                end
            end
        end

        -- rebuild settings next open
        if self._settingsPanel then self._settingsPanel:Destroy(); self._settingsPanel=nil end
    end

    -- ── SETTINGS ────────────────────────────────────────────
    local function buildSettings()
        if Win._settingsPanel then Win._settingsPanel:Destroy() end
        local sp=mkScroll(contentArea,T.Content,T.ScrollBar)
        sp.Name="PL7SettingsPanel"; sp.Visible=false; sp.ZIndex=20
        mkList(sp,Enum.FillDirection.Vertical,5); mkPad(sp,8,8,8,8)

        local function secHdr(txt)
            local h=mkFrm(sp,UDim2.new(1,0,0,24),nil,T.AccentDark); h.BackgroundTransparency=0.7; mkCorner(h,6)
            local l=mkLbl(h,"  "..txt,10,T.Accent,true); l.Size=UDim2.new(1,-8,1,0); return h
        end

        secHdr("TEMA")
        local tnames={"Black","Ghost","Blood","Void","Emerald","Gold","Ice","Rose","Ash","Ocean","Sunset","Mint"}
        local tGrid=mkFrm(sp,UDim2.new(1,0,0,0),nil,Color3.new(0,0,0),1); tGrid.AutomaticSize=Enum.AutomaticSize.Y
        local ug=Instance.new("UIGridLayout"); ug.CellSize=UDim2.new(0.5,-3,0,34); ug.CellPadding=UDim2.new(0,6,0,5); ug.SortOrder=Enum.SortOrder.LayoutOrder; ug.Parent=tGrid
        for _,tn in ipairs(tnames) do
            local th2=PL7.Themes[tn]
            local tb=mkBtn(tGrid,tn,12,th2.Accent,th2.Background); tb.TextXAlignment=Enum.TextXAlignment.Center
            mkCorner(tb,8); mkStroke(tb,th2.Accent,Win._themeName==tn and 2 or 1,Win._themeName==tn and 0 or 0.5)
            tb.MouseButton1Click:Connect(function()
                Win:ApplyTheme(tn)
                PL7:Notify({Title="Tema",Text=tn.." aplicado!",Type="success",Duration=2,Theme=tn})
            end)
        end

        secHdr("TAMANHO DO PAINEL")
        for _,sz in ipairs({{"Pequeno",275,330},{"Médio",315,365},{"Grande",360,420},{"Enorme",410,480}}) do
            local sb=mkBtn(sp,sz[1].."   "..sz[2].."×"..sz[3],12,T.Text,T.Sub); sb.Size=UDim2.new(1,0,0,34); sb.TextXAlignment=Enum.TextXAlignment.Left
            mkCorner(sb,8); mkStroke(sb,T.Border,1,0.3); mkPad(sb,0,0,12,12)
            sb.MouseEnter:Connect(function() tw(sb,{BackgroundColor3=T.AccentDark},0.12) end)
            sb.MouseLeave:Connect(function() tw(sb,{BackgroundColor3=T.Sub},0.12) end)
            sb.MouseButton1Click:Connect(function()
                W=sz[2]; H=sz[3]; tw(root,{Size=UDim2.new(0,W,0,H)},0.28)
                PL7:Notify({Title="Tamanho",Text=sz[1].." aplicado.",Type="info",Duration=2,Theme=Win._themeName})
            end)
        end

        secHdr("OPACIDADE DO PAINEL")
        local opRow=mkFrm(sp,UDim2.new(1,0,0,38),nil,Color3.new(0,0,0),1)
        local opLbl=mkLbl(opRow,"100%",12,T.Accent,true,Enum.TextXAlignment.Right); opLbl.Size=UDim2.new(0,40,1,0); opLbl.Position=UDim2.new(1,-40,0,0)
        local opTrk=mkFrm(opRow,UDim2.new(1,-52,0,6),UDim2.new(0,0,0.5,-3),T.Toggle); mkCorner(opTrk,3)
        local opFill=mkFrm(opTrk,UDim2.new(1,0,1,0),nil,T.Accent); mkCorner(opFill,3)
        local opThumb=mkFrm(opRow,UDim2.new(0,18,0,18),UDim2.new(1,-58,0.5,-9),T.Accent); mkCorner(opThumb,9)
        local opDrg=false
        local function opUp(px)
            local pct=math.clamp((px-opTrk.AbsolutePosition.X)/math.max(opTrk.AbsoluteSize.X,1),0,1)
            opFill.Size=UDim2.new(pct,0,1,0); opLbl.Text=math.floor(pct*100).."%"; root.BackgroundTransparency=1-pct
        end
        opTrk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then opDrg=true; opUp(i.Position.X) end end)
        UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then opDrg=false end end)
        UserInputService.InputChanged:Connect(function(i) if opDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then opUp(i.Position.X) end end)

        secHdr("TEXTO BOTÃO FLUTUANTE")
        local ftb=Instance.new("TextBox"); ftb.Size=UDim2.new(1,0,0,36); ftb.BackgroundColor3=T.Toggle
        ftb.Text=floatBtn.Text; ftb.TextColor3=T.Text; ftb.TextSize=13; ftb.Font=F.Regular
        ftb.ClearTextOnFocus=false; ftb.PlaceholderText="Texto..."; ftb.PlaceholderColor3=T.TextDim; ftb.Parent=sp
        mkCorner(ftb,8); mkStroke(ftb,T.Border,1,0.2); mkPad(ftb,0,0,10,10)
        ftb.FocusLost:Connect(function() floatBtn.Text=ftb.Text end)

        local csb=mkBtn(sp,"✕  Fechar",12,Color3.fromRGB(225,75,75),T.Sub); csb.Size=UDim2.new(1,0,0,34); csb.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(csb,8)
        csb.MouseButton1Click:Connect(function() sp.Visible=false; if Win._activeTab then Win._activeTab._content.Visible=true end end)

        Win._settingsPanel=sp; return sp
    end

    cfgBtn.MouseButton1Click:Connect(function()
        if not Win._settingsPanel then buildSettings() end
        local sp=Win._settingsPanel; sp.Visible=not sp.Visible
        if sp.Visible and Win._activeTab then Win._activeTab._content.Visible=false
        elseif not sp.Visible and Win._activeTab then Win._activeTab._content.Visible=true end
    end)

    -- ============================================================
    --  ADD TAB  — suporta emoji no nome
    -- ============================================================
    function Win:AddTab(tabName, tabIcon)
        local tab={_window=self}

        local tabBtn=mkBtn(tabBar,"",10,T.TextDim,Color3.new(0,0,0))
        tabBtn.BackgroundTransparency=1; tabBtn.Size=UDim2.new(1,0,0,62); tabBtn.AutoButtonColor=false; tab._btn=tabBtn

        -- icon label — suporta emoji ou imageId
        local iconL2
        if tabIcon then
            -- emoji ou texto passado em tabIcon
            iconL2=mkLbl(tabBtn,tabIcon,22,T.TextDim,true,Enum.TextXAlignment.Center)
        else
            -- detecta se tabName começa com emoji (caracter multi-byte acima de ASCII)
            local firstChar=tabName:sub(1,4)
            local isEmoji=(firstChar:byte(1) and firstChar:byte(1)>127)
            if isEmoji then
                iconL2=mkLbl(tabBtn,firstChar,22,T.TextDim,true,Enum.TextXAlignment.Center)
            else
                iconL2=mkLbl(tabBtn,tabName:sub(1,1):upper(),22,T.TextDim,true,Enum.TextXAlignment.Center)
            end
        end
        iconL2.Size=UDim2.new(1,0,0,28); iconL2.Position=UDim2.new(0,0,0,7); tab._iconL=iconL2

        -- name label (small, below icon)
        -- strip emoji from display name for label
        local displayName=tabName:gsub("^[%z\1-\127\194-\244][\128-\191]*%s*","",1)
        if displayName=="" then displayName=tabName end
        local nameL2=mkLbl(tabBtn,displayName:upper(),8,T.TextDim,false,Enum.TextXAlignment.Center)
        nameL2.Size=UDim2.new(1,-2,0,12); nameL2.Position=UDim2.new(0,1,0,36); tab._nameL=nameL2

        -- active indicator pill
        local ind=mkFrm(tabBtn,UDim2.new(0,3,0,0),UDim2.new(1,-3,0.5,0),T.Accent); ind.Visible=false; mkCorner(ind,2); tab._ind=ind
        local abg=mkFrm(tabBtn,UDim2.new(1,-8,1,-10),UDim2.new(0,4,0,5),T.Accent); abg.BackgroundTransparency=1; mkCorner(abg,8); tab._abg=abg

        -- content scrollframe
        local content=mkScroll(contentArea,T.Content,T.ScrollBar)
        content.Name="Tab_"..tabName; content.Visible=false; tab._content=content
        mkList(content,Enum.FillDirection.Vertical,6); mkPad(content,8,8,7,7)

        local function selectTab()
            for _,t in ipairs(self._tabs) do
                t._content.Visible=false
                tw(t._nameL,{TextColor3=T.TextDim},0.15); tw(t._iconL,{TextColor3=T.TextDim},0.15)
                tw(t._abg,{BackgroundTransparency=1},0.15); t._ind.Visible=false
            end
            content.Visible=true; self._activeTab=tab
            if self._settingsPanel then self._settingsPanel.Visible=false end
            tw(nameL2,{TextColor3=T.Accent},0.15); tw(iconL2,{TextColor3=T.Accent},0.15)
            ind.Visible=true
            tw(ind,{Size=UDim2.new(0,3,0.62,0),Position=UDim2.new(1,-3,0.19,0)},0.22,Enum.EasingStyle.Back)
            abg.BackgroundColor3=T.Accent; tw(abg,{BackgroundTransparency=0.88},0.15)
        end

        tabBtn.MouseButton1Click:Connect(selectTab)
        table.insert(self._tabs,tab)
        if #self._tabs==1 then selectTab() end

        -- ── ADD SECTION ──────────────────────────────────────
        function tab:AddSection(sectionName)
            local sec={_window=self._window}
            local function gT() return self._window._theme end

            local secF=mkFrm(content,UDim2.new(1,0,0,0),nil,gT().Sub)
            secF.AutomaticSize=Enum.AutomaticSize.Y; mkCorner(secF,10); mkStroke(secF,gT().Border,1,0.3)
            mkList(secF,Enum.FillDirection.Vertical,2); mkPad(secF,6,6,8,8)

            if sectionName and sectionName~="" then
                local sh=mkFrm(secF,UDim2.new(1,-16,0,24),nil,Color3.new(0,0,0),1); sh.LayoutOrder=-100
                local sl=mkLbl(sh,sectionName,10,gT().Accent,true); sl.Size=UDim2.new(1,0,1,0)
                local sep=mkFrm(sh,UDim2.new(1,0,0,1),UDim2.new(0,0,1,-1),gT().Accent); sep.BackgroundTransparency=0.72
            end

            -- ── TOGGLE ───────────────────────────────────────
            function sec:AddToggle(name,default,callback)
                local tobj={_val=default or false,_subs={},_exp=false}
                local wT=gT()

                local wrap=mkFrm(secF,UDim2.new(1,-16,0,0),nil,Color3.new(0,0,0),1)
                wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,2)

                local row=mkFrm(wrap,UDim2.new(1,0,0,40),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(row,name,13,wT.Text,false); nL.Size=UDim2.new(1,-58,1,0)
                local arrL=mkLbl(row,"›",15,wT.TextDim,true,Enum.TextXAlignment.Center)
                arrL.Size=UDim2.new(0,18,1,0); arrL.Position=UDim2.new(1,-56,0,0); arrL.Visible=false

                local togBg=mkFrm(row,UDim2.new(0,42,0,24),UDim2.new(1,-42,0.5,-12),wT.Toggle)
                togBg.Name="ToggleBg"; mkCorner(togBg,12); mkStroke(togBg,wT.Border,1,0.2)
                local togTh=mkFrm(togBg,UDim2.new(0,18,0,18),UDim2.new(0,3,0.5,-9),wT.TextDim); mkCorner(togTh,9)

                local subC=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Background)
                subC.AutomaticSize=Enum.AutomaticSize.Y; subC.Visible=false; subC.ClipsDescendants=true
                mkCorner(subC,8); mkStroke(subC,wT.Accent,1,0.6)
                mkList(subC,Enum.FillDirection.Vertical,1); mkPad(subC,4,4,8,8)
                tobj._subC=subC

                local function upVis(v)
                    if v then
                        tw(togBg,{BackgroundColor3=wT.ToggleOn},0.18)
                        tw(togTh,{Position=UDim2.new(0,21,0.5,-9),BackgroundColor3=Color3.fromRGB(255,255,255)},0.2,Enum.EasingStyle.Back)
                    else
                        tw(togBg,{BackgroundColor3=wT.Toggle},0.18)
                        tw(togTh,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=wT.TextDim},0.2,Enum.EasingStyle.Back)
                    end
                end
                upVis(tobj._val)

                local function fire()
                    tobj._val=not tobj._val; upVis(tobj._val)
                    if #tobj._subs>0 then
                        tobj._exp=tobj._val; subC.Visible=tobj._val; arrL.Visible=tobj._val
                        tw(arrL,{Rotation=tobj._exp and 90 or 0},0.2)
                    end
                    if callback then callback(tobj._val) end
                end

                togBg.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fire() end
                end)
                row.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                        if #tobj._subs>0 and tobj._val then tobj._exp=not tobj._exp; subC.Visible=tobj._exp; tw(arrL,{Rotation=tobj._exp and 90 or 0},0.2) end
                    end
                end)

                -- sub helpers
                local function mkSubRow(h)
                    local r=mkFrm(subC,UDim2.new(1,-8,0,h or 34),nil,Color3.new(0,0,0),1)
                    local d=mkLbl(r,"·",16,wT.Accent,true); d.Size=UDim2.new(0,14,1,0)
                    return r,d
                end

                function tobj:AddSubToggle(subName,subDef,subCb)
                    arrL.Visible=true; local sub={_val=subDef or false}
                    local r,_=mkSubRow(34)
                    local snL=mkLbl(r,subName,11,wT.TextDim,false); snL.Size=UDim2.new(1,-54,1,0); snL.Position=UDim2.new(0,18,0,0)
                    local stBg=mkFrm(r,UDim2.new(0,36,0,20),UDim2.new(1,-36,0.5,-10),wT.Toggle); mkCorner(stBg,10); mkStroke(stBg,wT.Border,1,0.3)
                    local stTh=mkFrm(stBg,UDim2.new(0,16,0,16),UDim2.new(0,2,0.5,-8),wT.TextDim); mkCorner(stTh,8)
                    local function upS(v)
                        if v then tw(stBg,{BackgroundColor3=wT.ToggleOn},0.18); tw(stTh,{Position=UDim2.new(0,18,0.5,-8),BackgroundColor3=Color3.fromRGB(255,255,255)},0.2)
                        else tw(stBg,{BackgroundColor3=wT.Toggle},0.18); tw(stTh,{Position=UDim2.new(0,2,0.5,-8),BackgroundColor3=wT.TextDim},0.2) end
                    end; upS(sub._val)
                    stBg.InputBegan:Connect(function(i)
                        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sub._val=not sub._val; upS(sub._val); if subCb then subCb(sub._val) end end
                    end)
                    table.insert(tobj._subs,sub)
                    function sub:Set(v) sub._val=v; upS(v) end; function sub:Get() return sub._val end; return sub
                end

                function tobj:AddSubSlider(subName,min,max,default,subCb)
                    arrL.Visible=true; local val=default or min; local sobj={_val=val}
                    local wrap2=mkFrm(subC,UDim2.new(1,-8,0,48),nil,Color3.new(0,0,0),1); mkList(wrap2,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(wrap2,UDim2.new(1,0,0,20),nil,Color3.new(0,0,0),1)
                    local d=mkLbl(hdr,"·",16,wT.Accent,true); d.Size=UDim2.new(0,14,1,0)
                    local nL2=mkLbl(hdr,subName,11,wT.TextDim,false); nL2.Size=UDim2.new(1,-50,1,0); nL2.Position=UDim2.new(0,16,0,0)
                    local vL=mkLbl(hdr,tostring(math.floor(val)),11,wT.Accent,true,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0,32,1,0); vL.Position=UDim2.new(1,-32,0,0)
                    local trk=mkFrm(wrap2,UDim2.new(1,-4,0,6),UDim2.new(0,2,0,0),wT.Toggle); mkCorner(trk,3)
                    local fill=mkFrm(trk,UDim2.new((val-min)/(max-min),0,1,0),nil,wT.Slider); mkCorner(fill,3)
                    local thumb=mkFrm(wrap2,UDim2.new(0,16,0,16),UDim2.new(0,-8,0,26),wT.Slider); mkCorner(thumb,8)
                    local sDrg=false
                    local function upS(px)
                        local pct=math.clamp((px-trk.AbsolutePosition.X)/math.max(trk.AbsoluteSize.X,1),0,1)
                        val=min+pct*(max-min); sobj._val=val; tw(fill,{Size=UDim2.new(pct,0,1,0)},0.07)
                        tw(thumb,{Position=UDim2.new(0,pct*trk.AbsoluteSize.X-8,0,26)},0.07)
                        vL.Text=tostring(math.floor(val)); if subCb then subCb(val) end
                    end
                    trk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true; upS(i.Position.X) end end)
                    thumb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=true end end)
                    UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDrg=false end end)
                    UserInputService.InputChanged:Connect(function(i) if sDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upS(i.Position.X) end end)
                    table.insert(tobj._subs,sobj)
                    function sobj:Set(v) upS(trk.AbsolutePosition.X+math.clamp((v-min)/(max-min),0,1)*trk.AbsoluteSize.X) end
                    function sobj:Get() return sobj._val end; return sobj
                end

                function tobj:AddSubButton(subName,subCb)
                    arrL.Visible=true; local r,_=mkSubRow(32)
                    local b=mkBtn(r,subName,11,wT.Text,wT.Toggle); b.Size=UDim2.new(1,-20,0,26); b.Position=UDim2.new(0,16,0.5,-13); b.TextXAlignment=Enum.TextXAlignment.Center
                    mkCorner(b,8); mkStroke(b,wT.Border,1,0.3)
                    b.MouseEnter:Connect(function() tw(b,{BackgroundColor3=wT.AccentDark,TextColor3=wT.Accent},0.12) end)
                    b.MouseLeave:Connect(function() tw(b,{BackgroundColor3=wT.Toggle,TextColor3=wT.Text},0.12) end)
                    b.MouseButton1Click:Connect(function() tw(b,{BackgroundColor3=wT.Accent},0.07); task.wait(0.07); tw(b,{BackgroundColor3=wT.AccentDark},0.12); if subCb then subCb() end end)
                    table.insert(tobj._subs,{}); return b
                end

                function tobj:AddSubDropdown(subName,options,default,subCb)
                    arrL.Visible=true; local dobj={_val=default or options[1],_open=false}
                    local ow=mkFrm(subC,UDim2.new(1,-8,0,0),nil,Color3.new(0,0,0),1); ow.AutomaticSize=Enum.AutomaticSize.Y; mkList(ow,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(ow,UDim2.new(1,0,0,32),nil,wT.Toggle); mkCorner(hdr,8); mkStroke(hdr,wT.Border,1,0.3)
                    local d=mkLbl(hdr,"·",16,wT.Accent,true); d.Size=UDim2.new(0,16,1,0); d.Position=UDim2.new(0,4,0,0)
                    local nL3=mkLbl(hdr,subName,11,wT.TextDim,false); nL3.Size=UDim2.new(0.45,0,1,0); nL3.Position=UDim2.new(0,22,0,0)
                    local vL2=mkLbl(hdr,dobj._val,11,wT.Accent,true,Enum.TextXAlignment.Right); vL2.Size=UDim2.new(0.35,0,1,0); vL2.Position=UDim2.new(0.5,0,0,0)
                    local arr=mkLbl(hdr,"▾",11,wT.TextDim,true,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,20,1,0); arr.Position=UDim2.new(1,-20,0,0)
                    local optBox=mkFrm(ow,UDim2.new(1,0,0,0),nil,wT.Background); optBox.AutomaticSize=Enum.AutomaticSize.Y; optBox.Visible=false; mkCorner(optBox,8); mkStroke(optBox,wT.Accent,1,0.6); mkList(optBox,Enum.FillDirection.Vertical,1); mkPad(optBox,3,3,6,6)
                    for _,opt in ipairs(options) do
                        local ob=mkBtn(optBox,opt,11,wT.Text,Color3.new(0,0,0)); ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,28); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,8,8)
                        ob.MouseEnter:Connect(function() ob.BackgroundColor3=wT.AccentDark; tw(ob,{BackgroundTransparency=0.72},0.1) end)
                        ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
                        ob.MouseButton1Click:Connect(function() dobj._val=opt; vL2.Text=opt; dobj._open=false; optBox.Visible=false; tw(arr,{Rotation=0},0.18); if subCb then subCb(opt) end end)
                    end
                    hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dobj._open=not dobj._open; optBox.Visible=dobj._open; tw(arr,{Rotation=dobj._open and 180 or 0},0.18) end end)
                    table.insert(tobj._subs,dobj); function dobj:Set(v) dobj._val=v; vL2.Text=v end; function dobj:Get() return dobj._val end; return dobj
                end

                function tobj:AddSubColorPicker(subName,default,subCb)
                    arrL.Visible=true; local col=default or Color3.fromRGB(255,255,255); local cpObj={_val=col,_open=false}
                    local r2,g2,b2=math.floor(col.R*255),math.floor(col.G*255),math.floor(col.B*255)
                    local ow=mkFrm(subC,UDim2.new(1,-8,0,0),nil,Color3.new(0,0,0),1); ow.AutomaticSize=Enum.AutomaticSize.Y; mkList(ow,Enum.FillDirection.Vertical,2)
                    local hdr=mkFrm(ow,UDim2.new(1,0,0,32),nil,wT.Toggle); mkCorner(hdr,8); mkStroke(hdr,wT.Border,1,0.3)
                    local d=mkLbl(hdr,"·",16,wT.Accent,true); d.Size=UDim2.new(0,16,1,0); d.Position=UDim2.new(0,4,0,0)
                    local nL4=mkLbl(hdr,subName,11,wT.TextDim,false); nL4.Size=UDim2.new(1,-58,1,0); nL4.Position=UDim2.new(0,22,0,0)
                    local prev=mkFrm(hdr,UDim2.new(0,20,0,20),UDim2.new(1,-42,0.5,-10),col); mkCorner(prev,5); mkStroke(prev,wT.Border,1,0)
                    local cpArr=mkLbl(hdr,"▾",11,wT.TextDim,true,Enum.TextXAlignment.Center); cpArr.Size=UDim2.new(0,20,1,0); cpArr.Position=UDim2.new(1,-20,0,0)
                    local panel=mkFrm(ow,UDim2.new(1,0,0,0),nil,wT.Background); panel.AutomaticSize=Enum.AutomaticSize.Y; panel.Visible=false; mkCorner(panel,8); mkStroke(panel,wT.Accent,1,0.55); mkList(panel,Enum.FillDirection.Vertical,3); mkPad(panel,5,5,7,7)
                    local function rebC() local nc=Color3.fromRGB(r2,g2,b2); cpObj._val=nc; prev.BackgroundColor3=nc; if subCb then subCb(nc) end end
                    local chs={{"R",Color3.fromRGB(220,60,60)},{"G",Color3.fromRGB(60,200,80)},{"B",Color3.fromRGB(60,130,255)}}
                    local cv={r2,g2,b2}
                    for ci,ch in ipairs(chs) do
                        local crow=mkFrm(panel,UDim2.new(1,-6,0,28),nil,Color3.new(0,0,0),1)
                        local chl=mkLbl(crow,ch[1],10,ch[2],true); chl.Size=UDim2.new(0,14,1,0)
                        local ctrk=mkFrm(crow,UDim2.new(1,-58,0,5),UDim2.new(0,18,0.5,-2),wT.Toggle); mkCorner(ctrk,3)
                        local cfill=mkFrm(ctrk,UDim2.new(cv[ci]/255,0,1,0),nil,ch[2]); mkCorner(cfill,3)
                        local cthumb=mkFrm(crow,UDim2.new(0,14,0,14),UDim2.new(0,18,0.5,-7),ch[2]); mkCorner(cthumb,7)
                        local cvLbl=mkLbl(crow,tostring(cv[ci]),10,wT.TextDim,true,Enum.TextXAlignment.Right); cvLbl.Size=UDim2.new(0,30,1,0); cvLbl.Position=UDim2.new(1,-30,0,0)
                        local cDrg=false
                        local function cup(px) local pct=math.clamp((px-ctrk.AbsolutePosition.X)/math.max(ctrk.AbsoluteSize.X,1),0,1); cv[ci]=math.floor(pct*255); cfill.Size=UDim2.new(pct,0,1,0); cvLbl.Text=tostring(cv[ci]); r2,g2,b2=cv[1],cv[2],cv[3]; rebC() end
                        ctrk.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=true; cup(i.Position.X) end end)
                        UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cDrg=false end end)
                        UserInputService.InputChanged:Connect(function(i) if cDrg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then cup(i.Position.X) end end)
                    end
                    hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then cpObj._open=not cpObj._open; panel.Visible=cpObj._open; tw(cpArr,{Rotation=cpObj._open and 180 or 0},0.18) end end)
                    table.insert(tobj._subs,cpObj); function cpObj:Set(c) cpObj._val=c; prev.BackgroundColor3=c end; function cpObj:Get() return cpObj._val end; return cpObj
                end

                function tobj:AddSubLabel(text)
                    arrL.Visible=true; local r,_=mkSubRow(22)
                    local lbl2=mkLbl(r,text,11,wT.TextDim,false); lbl2.Size=UDim2.new(1,-18,1,0); lbl2.Position=UDim2.new(0,16,0,0); lbl2.TextWrapped=true
                    table.insert(tobj._subs,{}); local obj={}; function obj:Set(t) lbl2.Text=t end; function obj:Get() return lbl2.Text end; return obj
                end

                function tobj:Set(v) tobj._val=v; upVis(v); if callback then callback(v) end end
                function tobj:Get() return tobj._val end
                return tobj
            end

            -- ── SLIDER ───────────────────────────────────────
            function sec:AddSlider(name,min,max,default,callback)
                local wT=gT(); local val=default or min; local sobj={_val=val}
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,54),nil,Color3.new(0,0,0),1)
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,24),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(hdr,name,13,wT.Text,false); nL.Size=UDim2.new(1,-52,1,0)
                local vL=mkLbl(hdr,tostring(math.floor(val)),12,wT.Accent,true,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0,48,1,0); vL.Position=UDim2.new(1,-48,0,0)
                local trk=mkFrm(wrap,UDim2.new(1,0,0,7),UDim2.new(0,0,0,32),wT.Toggle); mkCorner(trk,4); mkStroke(trk,wT.Border,1,0.35)
                local fill=mkFrm(trk,UDim2.new((val-min)/(max-min),0,1,0),nil,wT.Slider); mkCorner(fill,4)
                local thumb=mkFrm(wrap,UDim2.new(0,20,0,20),UDim2.new(0,-10,0,29),wT.Slider); mkCorner(thumb,10); mkStroke(thumb,wT.Accent,1,0.12)
                local sDrg=false
                local function upS(px)
                    local pct=math.clamp((px-trk.AbsolutePosition.X)/math.max(trk.AbsoluteSize.X,1),0,1)
                    val=min+pct*(max-min); sobj._val=val; tw(fill,{Size=UDim2.new(pct,0,1,0)},0.07)
                    tw(thumb,{Position=UDim2.new(0,pct*trk.AbsoluteSize.X-10,0,29)},0.07); vL.Text=tostring(math.floor(val)); if callback then callback(val) end
                end
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
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,40),nil,wT.Toggle); mkCorner(hdr,10); mkStroke(hdr,wT.Border,1,0.22)
                local nL=mkLbl(hdr,name,13,wT.Text,false); nL.Size=UDim2.new(0.5,0,1,0); nL.Position=UDim2.new(0,12,0,0)
                local vL=mkLbl(hdr,dobj._val,12,wT.Accent,true,Enum.TextXAlignment.Right); vL.Size=UDim2.new(0.38,0,1,0); vL.Position=UDim2.new(0.5,0,0,0)
                local arr=mkLbl(hdr,"▾",13,wT.TextDim,true,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,24,1,0); arr.Position=UDim2.new(1,-24,0,0)
                local optBox=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Sub); optBox.AutomaticSize=Enum.AutomaticSize.Y; optBox.Visible=false; mkCorner(optBox,10); mkStroke(optBox,wT.Accent,1,0.52); mkList(optBox,Enum.FillDirection.Vertical,1); mkPad(optBox,4,4,6,6)
                for _,opt in ipairs(options) do
                    local ob=mkBtn(optBox,opt,13,wT.Text,Color3.new(0,0,0)); ob.BackgroundTransparency=1; ob.Size=UDim2.new(1,0,0,34); ob.TextXAlignment=Enum.TextXAlignment.Left; mkPad(ob,0,0,10,10)
                    ob.MouseEnter:Connect(function() ob.BackgroundColor3=wT.AccentDark; tw(ob,{BackgroundTransparency=0.72},0.1) end)
                    ob.MouseLeave:Connect(function() tw(ob,{BackgroundTransparency=1},0.1) end)
                    ob.MouseButton1Click:Connect(function() dobj._val=opt; vL.Text=opt; dobj._open=false; optBox.Visible=false; tw(arr,{Rotation=0},0.2); if callback then callback(opt) end end)
                end
                hdr.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dobj._open=not dobj._open; optBox.Visible=dobj._open; tw(arr,{Rotation=dobj._open and 180 or 0},0.2) end end)
                function dobj:Set(v) dobj._val=v; vL.Text=v end; function dobj:Get() return dobj._val end; return dobj
            end

            -- ── BUTTON ───────────────────────────────────────
            function sec:AddButton(name,callback)
                local wT=gT()
                local b=mkBtn(secF,name,13,wT.Text,wT.Toggle); b.Size=UDim2.new(1,-16,0,38); b.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(b,10); mkStroke(b,wT.Border,1,0.22)
                b.MouseEnter:Connect(function() tw(b,{BackgroundColor3=wT.AccentDark,TextColor3=wT.Accent},0.13) end)
                b.MouseLeave:Connect(function() tw(b,{BackgroundColor3=wT.Toggle,TextColor3=wT.Text},0.13) end)
                b.MouseButton1Click:Connect(function() tw(b,{BackgroundColor3=wT.Accent},0.07); task.wait(0.07); tw(b,{BackgroundColor3=wT.AccentDark},0.14); if callback then callback() end end)
                return b
            end

            -- ── LABEL ────────────────────────────────────────
            function sec:AddLabel(text)
                local wT=gT(); local l=mkLbl(secF,text,11,wT.TextDim,false); l.Size=UDim2.new(1,-16,0,20); l.TextWrapped=true
                local obj={}; function obj:Set(t) l.Text=t end; function obj:Get() return l.Text end; return obj
            end

            -- ── TEXTBOX ──────────────────────────────────────
            function sec:AddTextbox(name,placeholder,default,callback)
                local wT=gT()
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,60),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(wrap,name,11,wT.TextDim,false); nL.Size=UDim2.new(1,0,0,20)
                local tb=Instance.new("TextBox"); tb.Size=UDim2.new(1,0,0,36); tb.Position=UDim2.new(0,0,0,22)
                tb.BackgroundColor3=wT.Toggle; tb.Text=default or ""; tb.TextColor3=wT.Text; tb.TextSize=13; tb.Font=F.Regular
                tb.ClearTextOnFocus=false; tb.PlaceholderText=placeholder or ""; tb.PlaceholderColor3=wT.TextDim; tb.Parent=wrap
                mkCorner(tb,9); mkStroke(tb,wT.Border,1,0.15); mkPad(tb,0,0,10,10)
                tb.FocusLost:Connect(function(enter) if callback then callback(tb.Text,enter) end end)
                local obj={}; function obj:Set(v) tb.Text=v end; function obj:Get() return tb.Text end; return obj
            end

            -- ── COLOR PICKER ─────────────────────────────────
            function sec:AddColorPicker(name,default,callback)
                local wT=gT(); local col=default or Color3.fromRGB(255,255,255); local cpObj={_val=col,_open=false}
                local r3,g3,b3=math.floor(col.R*255),math.floor(col.G*255),math.floor(col.B*255)
                local wrap=mkFrm(secF,UDim2.new(1,-16,0,0),nil,Color3.new(0,0,0),1); wrap.AutomaticSize=Enum.AutomaticSize.Y; mkList(wrap,Enum.FillDirection.Vertical,3)
                local hdr=mkFrm(wrap,UDim2.new(1,0,0,40),nil,wT.Toggle); mkCorner(hdr,10); mkStroke(hdr,wT.Border,1,0.22)
                local nL=mkLbl(hdr,name,13,wT.Text,false); nL.Size=UDim2.new(1,-62,1,0); nL.Position=UDim2.new(0,12,0,0)
                local prev=mkFrm(hdr,UDim2.new(0,26,0,26),UDim2.new(1,-50,0.5,-13),col); mkCorner(prev,7); mkStroke(prev,wT.Border,1,0)
                local arr=mkLbl(hdr,"▾",13,wT.TextDim,true,Enum.TextXAlignment.Center); arr.Size=UDim2.new(0,22,1,0); arr.Position=UDim2.new(1,-22,0,0)
                local panel=mkFrm(wrap,UDim2.new(1,0,0,0),nil,wT.Sub); panel.AutomaticSize=Enum.AutomaticSize.Y; panel.Visible=false; mkCorner(panel,10); mkStroke(panel,wT.Accent,1,0.52); mkList(panel,Enum.FillDirection.Vertical,4); mkPad(panel,6,6,8,8)
                local function rebC() local nc=Color3.fromRGB(r3,g3,b3); cpObj._val=nc; prev.BackgroundColor3=nc; if callback then callback(nc) end end
                local chs={{"R",Color3.fromRGB(220,60,60)},{"G",Color3.fromRGB(60,200,80)},{"B",Color3.fromRGB(60,130,255)}}; local cv={r3,g3,b3}
                for ci,ch in ipairs(chs) do
                    local crow=mkFrm(panel,UDim2.new(1,-8,0,32),nil,Color3.new(0,0,0),1)
                    local chl=mkLbl(crow,ch[1],12,ch[2],true); chl.Size=UDim2.new(0,16,1,0)
                    local ctrk=mkFrm(crow,UDim2.new(1,-64,0,6),UDim2.new(0,20,0.5,-3),wT.Toggle); mkCorner(ctrk,3)
                    local cfill=mkFrm(ctrk,UDim2.new(cv[ci]/255,0,1,0),nil,ch[2]); mkCorner(cfill,3)
                    local cthumb=mkFrm(crow,UDim2.new(0,16,0,16),UDim2.new(0,20,0.5,-8),ch[2]); mkCorner(cthumb,8)
                    local cvLbl=mkLbl(crow,tostring(cv[ci]),11,wT.TextDim,true,Enum.TextXAlignment.Right); cvLbl.Size=UDim2.new(0,34,1,0); cvLbl.Position=UDim2.new(1,-34,0,0)
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
                local row=mkFrm(secF,UDim2.new(1,-16,0,38),nil,Color3.new(0,0,0),1)
                local nL=mkLbl(row,name,13,wT.Text,false); nL.Size=UDim2.new(1,-82,1,0)
                local kb=mkBtn(row,key.Name or "NONE",11,wT.Accent,wT.Toggle); kb.Size=UDim2.new(0,72,0,28); kb.Position=UDim2.new(1,-72,0.5,-14); kb.TextXAlignment=Enum.TextXAlignment.Center; mkCorner(kb,8); mkStroke(kb,wT.Accent,1,0.32)
                kb.MouseButton1Click:Connect(function() listening=true; kb.Text="  ···"; tw(kb,{BackgroundColor3=wT.Accent},0.13) end)
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

    function Win:Toggle() root.Visible=not root.Visible end
    function Win:Destroy() pcall(function() root:Destroy() end); pcall(function() floatBar:Destroy() end) end

    -- ── ROLE COLORS ─────────────────────────────────────────
    local RoleColors = {
        owner   = Color3.fromRGB(220, 220, 220), -- branco/preto
        vip     = Color3.fromRGB(255, 196, 0),   -- amarelo
        creator = Color3.fromRGB(215, 40,  40),  -- vermelho
        free    = Color3.fromRGB(120, 120, 130),  -- cinza
    }
    local RoleLabels = {
        owner   = "👑  DONO",
        vip     = "⭐  VIP",
        creator = "🎨  CONTENT CREATOR",
        free    = "🔓  FREE",
    }
    local RoleBg = {
        owner   = Color3.fromRGB(30, 30, 30),
        vip     = Color3.fromRGB(50, 38, 0),
        creator = Color3.fromRGB(50, 8, 8),
        free    = Color3.fromRGB(22, 22, 26),
    }

    -- ── ADD PROFILE TAB ─────────────────────────────────────
    -- opts:
    --   KeyUsed    = string  (a key que o usuário usou)
    --   Role       = string  ("owner"|"vip"|"creator"|"free")
    --   Username   = string  (nome do jogador, opcional)
    --   TabName    = string  (nome da aba, padrão "PERFIL")
    --   ExtraInfo  = {{ label="..", value=".." }, ...}  linhas extras
    function Win:AddProfileTab(popts)
        popts = popts or {}
        local role     = (popts.Role or "free"):lower()
        local key      = popts.KeyUsed  or "—"
        local username = popts.Username or LocalPlayer.Name
        local tabName  = popts.TabName  or "👤 PERFIL"
        local roleColor= RoleColors[role] or RoleColors.free
        local roleLbl  = RoleLabels[role] or role:upper()
        local roleBg   = RoleBg[role]     or RoleBg.free

        local tab = Win:AddTab(tabName)
        local sec = tab:AddSection("")

        -- ── CARD de boas-vindas ──────────────────────────────
        local cardF = mkFrm(tab._content, UDim2.new(1,0,0,0), nil, roleBg)
        cardF.AutomaticSize = Enum.AutomaticSize.Y
        mkCorner(cardF, 12)
        mkStroke(cardF, roleColor, 1, 0.35)
        mkList(cardF, Enum.FillDirection.Vertical, 4)
        mkPad(cardF, 14, 14, 16, 16)

        -- ícone + role badge
        local badgeRow = mkFrm(cardF, UDim2.new(1,0,0,36), nil, Color3.new(0,0,0), 1)

        local badgeBg = mkFrm(badgeRow, UDim2.new(0,0,0,28), nil, roleColor)
        badgeBg.AutomaticSize = Enum.AutomaticSize.X
        mkCorner(badgeBg, 6)
        mkPad(badgeBg, 0, 0, 10, 10)
        local badgeL = mkLbl(badgeBg, roleLbl, 11, T.Background, true, Enum.TextXAlignment.Center)
        badgeL.Size = UDim2.new(0, 0, 1, 0)
        badgeL.AutomaticSize = Enum.AutomaticSize.X

        -- "Bem-vindo, USERNAME"
        local welcomeF = mkFrm(cardF, UDim2.new(1,0,0,0), nil, Color3.new(0,0,0), 1)
        welcomeF.AutomaticSize = Enum.AutomaticSize.Y

        local wLine1 = mkLbl(welcomeF, "Bem-vindo,", 12, T.TextDim, false)
        wLine1.Size = UDim2.new(1,0,0,18)

        local wLine2 = mkLbl(welcomeF, username, 18, roleColor, true)
        wLine2.Size = UDim2.new(1,0,0,26)
        wLine2.Position = UDim2.new(0,0,0,18)
        welcomeF.Size = UDim2.new(1,0,0,48)

        -- separador
        local sepF = mkFrm(cardF, UDim2.new(1,0,0,1), nil, roleColor)
        sepF.BackgroundTransparency = 0.65

        -- ── Linhas de info ───────────────────────────────────
        local function infoRow(lbTxt, valTxt, valCol)
            local row = mkFrm(cardF, UDim2.new(1,0,0,26), nil, Color3.new(0,0,0), 1)
            local lb  = mkLbl(row, lbTxt, 11, T.TextDim, false)
            lb.Size = UDim2.new(0.45, 0, 1, 0)
            local vl  = mkLbl(row, valTxt, 11, valCol or T.Text, true, Enum.TextXAlignment.Right)
            vl.Size = UDim2.new(0.55, 0, 1, 0)
            vl.Position = UDim2.new(0.45, 0, 0, 0)
            return row, vl
        end

        -- Key usada (mascarada: mostra só últimos 6 chars)
        local masked = (#key > 6) and (string.rep("*", #key-6) .. key:sub(-6)) or key
        infoRow("🔑  Key:", masked, roleColor)

        -- Role
        infoRow("🎭  Role:", roleLbl:gsub("^.-%s+",""), roleColor)

        -- Jogador (DisplayName se disponível)
        local dispName = pcall(function() return LocalPlayer.DisplayName end) and LocalPlayer.DisplayName or username
        infoRow("👤  Jogador:", dispName, T.Text)

        -- Extras configuráveis
        if popts.ExtraInfo then
            for _, ei in ipairs(popts.ExtraInfo) do
                infoRow(ei.label or "", ei.value or "", ei.color or T.Text)
            end
        end

        -- separador final
        local sepF2 = mkFrm(cardF, UDim2.new(1,0,0,1), nil, roleColor)
        sepF2.BackgroundTransparency = 0.65

        -- botão copiar key
        local copyBtn = mkBtn(cardF, "📋  Copiar Key", 12, roleColor, T.Toggle)
        copyBtn.Size = UDim2.new(1,0,0,34)
        copyBtn.TextXAlignment = Enum.TextXAlignment.Center
        mkCorner(copyBtn, 8); mkStroke(copyBtn, roleColor, 1, 0.45)
        copyBtn.MouseEnter:Connect(function() tw(copyBtn, {BackgroundColor3=roleBg}, 0.12) end)
        copyBtn.MouseLeave:Connect(function() tw(copyBtn, {BackgroundColor3=T.Toggle}, 0.12) end)
        copyBtn.MouseButton1Click:Connect(function()
            pcall(function() setclipboard(key) end)
            PL7:Notify({Title="Key Copiada", Text="Key copiada para a área de transferência.", Type="success", Duration=2, Theme=Win._themeName})
        end)

        -- store role on window for tab visibility
        Win._role = role
        Win._profileTab = tab
        return tab
    end

    -- ── ROLE-BASED TAB VISIBILITY ────────────────────────────
    -- roleMap = { TabObject = {"owner","vip","creator","free"}, ... }
    -- Chame após criar todas as abas:
    -- Win:SetRoleVisibility(role, { [TabESP]={"owner","vip"}, [TabAim]={"owner"} })
    function Win:SetRoleVisibility(role, roleMap)
        role = (role or "free"):lower()
        Win._role = role
        for tab, allowedRoles in pairs(roleMap) do
            local allowed = false
            for _, r in ipairs(allowedRoles) do
                if r:lower() == role then allowed = true; break end
            end
            -- hide tab button and content if not allowed
            tab._btn.Visible     = allowed
            tab._content.Visible = allowed and (tab == Win._activeTab)
            if not allowed and tab == Win._activeTab then
                -- switch to first visible tab
                for _, t in ipairs(Win._tabs) do
                    if t._btn.Visible then
                        t._btn.MouseButton1Click:Fire()
                        break
                    end
                end
            end
        end
    end

    -- animacao de abertura: slide down + fade in
    root.BackgroundTransparency=1
    root.Position=UDim2.new(
        root.Position.X.Scale, root.Position.X.Offset,
        root.Position.Y.Scale, root.Position.Y.Offset-16
    )
    tw(root,{
        BackgroundTransparency=0,
        Position=UDim2.new(root.Position.X.Scale,root.Position.X.Offset,root.Position.Y.Scale,root.Position.Y.Offset+16),
    },0.24,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
    return Win
end

-- ============================================================
--  KEY VALIDATOR HELPERS  (Firebase / Pastebin)
-- ============================================================

-- ============================================================
--  FIREBASE REALTIME DATABASE  --  ValidateKeyFirebase
-- ============================================================
--
--  ESTRUTURA OBRIGATORIA no Firebase:
--
--  keys/
--    PL7-SUAKEY/
--      data_criacao:    "2026-04-26"   (string YYYY-MM-DD)
--      desativada:      false          (bool)
--      dias:            7              (number -- duracao em dias)
--      expira_em:       "2026-05-03"   (string YYYY-MM-DD)
--      usada:           false          (bool -- true = key de uso unico ja usada)
--      usuario_maximo:  999            (number -- max de usuarios simultaneos)
--      usuarios_atuais: 0              (number -- contador atual)
--      role:            "vip"          (string: "owner"|"vip"|"creator"|"free")
--
--  RETORNO do callback:  callback(valid, role, data, motivo)
--    valid  = true/false
--    role   = "owner" | "vip" | "creator" | "free" | nil
--    data   = tabela completa do Firebase ou nil
--    motivo = string descrevendo o resultado
--
--  USO:
--    PL7:ValidateKeyFirebase(
--        "https://keys-bb23e-default-rtdb.firebaseio.com",
--        "PL7-0EAIN7WD",
--        function(valid, role, data, motivo)
--            if valid then
--                abrirUI(key, role)
--            else
--                print("Negado:", motivo)
--            end
--        end
--    )
-- ============================================================
function PL7:ValidateKeyFirebase(databaseUrl, key, callback)
    local HttpService = game:GetService("HttpService")

    task.spawn(function()

        -- 1. busca o no da key
        local ok, res = pcall(function()
            return game:HttpGet(databaseUrl .. "/keys/" .. key .. ".json")
        end)

        if not ok then
            callback(false, nil, nil, "Erro de rede: nao foi possivel acessar o Firebase")
            return
        end

        -- 2. decodifica JSON
        local data = nil
        local decOk = pcall(function()
            data = HttpService:JSONDecode(res)
        end)

        if not decOk or data == nil or data == HttpService:JSONDecode("null") then
            callback(false, nil, nil, "Key nao encontrada")
            return
        end

        -- 3. checa campo desativada
        if data.desativada == true then
            callback(false, nil, data, "Key desativada pelo administrador")
            return
        end

        -- 4. checa campo usada (keys de uso unico)
        if data.usada == true and data.usuario_maximo == 1 then
            callback(false, nil, data, "Key de uso unico ja utilizada")
            return
        end

        -- 5. checa expiracao  (expira_em no formato "YYYY-MM-DD")
        if data.expira_em then
            -- converte "YYYY-MM-DD" para os componentes
            local ay, am, ad = data.expira_em:match("^(%d+)-(%d+)-(%d+)$")
            if ay and am and ad then
                -- pega data atual via os.time (Roblox usa UTC)
                local now = os.time()
                local expTs = os.time({
                    year  = tonumber(ay),
                    month = tonumber(am),
                    day   = tonumber(ad),
                    hour  = 23, min = 59, sec = 59,
                })
                if now > expTs then
                    callback(false, nil, data, "Key expirada em " .. data.expira_em)
                    return
                end
            end
        end

        -- 6. checa limite de usuarios simultaneos
        if data.usuario_maximo and data.usuarios_atuais then
            if data.usuarios_atuais >= data.usuario_maximo then
                callback(false, nil, data,
                    "Limite de usuarios atingido ("
                    .. data.usuarios_atuais .. "/" .. data.usuario_maximo .. ")")
                return
            end
        end

        -- 7. incrementa usuarios_atuais no Firebase
        pcall(function()
            local novosUsuarios = (data.usuarios_atuais or 0) + 1
            -- PATCH via HttpService (requer regras de escrita no Firebase)
            HttpService:RequestAsync({
                Url    = databaseUrl .. "/keys/" .. key .. "/usuarios_atuais.json",
                Method = "PUT",
                Headers= {["Content-Type"] = "application/json"},
                Body   = tostring(novosUsuarios),
            })
        end)

        -- 8. decrementa usuarios_atuais quando o jogador sair
        game.Players.LocalPlayer.AncestryChanged:Connect(function()
            pcall(function()
                local novosUsuarios = math.max(0, (data.usuarios_atuais or 1) - 1)
                HttpService:RequestAsync({
                    Url    = databaseUrl .. "/keys/" .. key .. "/usuarios_atuais.json",
                    Method = "PUT",
                    Headers= {["Content-Type"] = "application/json"},
                    Body   = tostring(novosUsuarios),
                })
            end)
        end)

        -- 9. tudo ok -- retorna role
        local role = (data.role or "free"):lower()
        callback(true, role, data, "Acesso liberado como " .. role)
    end)
end

-- Pastebin
-- Formato do Pastebin: uma key por linha assim:
--   MINHAKEY123 (vip)
--   OUTRAKEY456 (owner)
--   FREEKEY789 (free)
function PL7:ValidateKeyPastebin(pastebinUrl, key, callback)
    task.spawn(function()
        local ok, res = pcall(function()
            return game:HttpGet(pastebinUrl)
        end)
        if not ok then callback(false, nil, "Erro de rede") return end
        -- parse lines
        local found = false
        local role  = "free"
        for line in res:gmatch("[^\r\n]+") do
            line = line:match("^%s*(.-)%s*$") -- trim
            -- match: KEY (role)
            local k, r = line:match("^(.-)%s+%((.-)%)$")
            if k and r and k == key then
                found = true; role = r:lower(); break
            end
            -- match: KEY sem role
            if line == key then
                found = true; break
            end
        end
        if found then
            callback(true, role, {key=key, role=role})
        else
            callback(false, nil, "Key não encontrada")
        end
    end)
end

return PL7
