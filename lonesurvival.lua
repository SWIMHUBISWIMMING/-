---@diagnostic disable: undefined-global, deprecated, undefined-field



local function wrap(f) coroutine.resume(coroutine.create(f)) end
if game.GameId == 450749276 then
    getgenv().swimhub_settings.safemode = true
end
local title,title2 = '.gay | v%s | fps %s | ping %s', 'protogen.gay - lone survival'

local isusingfancyloader = true
local safeload = true
local noadonis = true
if isusingfancyloader then
    print("began")
end
local Library, ThemeManager, SaveManager, _esplib = nil, nil, nil, nil --[[loadstring(game:HttpGet("https://raw.githubusercontent.com/SWIMHUBISWIMMING/-/main/library/esp/tsv2.lua"))()]]
do
    local repo = 'https://raw.githubusercontent.com/SWIMHUBISWIMMING/-/main/library/'
    Library = loadstring(game:HttpGet(repo..'main'))()
    ThemeManager = loadstring(game:HttpGet(repo..'theme'))()
    SaveManager = loadstring(game:HttpGet(repo..'save'))()
    _esplib = loadstring(game:HttpGet(repo..'esp/esp.lua'))()
end

if isusingfancyloader then
    print(" [ 1/5 ] loaded library\n")
end
local Window = Library:CreateWindow({
    Title = title2,
    Center = true,
    AutoShow = true,
    TabPadding = 8
})
local Tabs = {
    Main = Window:AddTab('Game'),
    Misc = Window:AddTab('Misc'),
    Lua = Window:AddTab('Lua'),
    Settings = Window:AddTab('Settings'),
}

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local varsglobal = {
    visuals = {
        gradientenabled = false,
        gradientcolor1 = Color3.fromRGB(90, 90, 90),
        gradientcolor2 = Color3.fromRGB(150, 150, 150),
        oldgradient1 = Lighting.Ambient,
        oldgradient2 = Lighting.OutdoorAmbient,
        FogEnabled = false,
        oldFogStart = Lighting.FogStart,
        oldFogEnd = Lighting.FogEnd,
        oldFogColor = Lighting.FogColor,
        FogStart = 0,
        FogEnd = 0,
        FogColor = Color3.fromRGB(255, 255, 255),
        oldTime = Lighting.ClockTime,
        Time = 14,
        FovChanger = false,
        FovAdd = 0,
        OldFov = workspace.CurrentCamera.FieldOfView,
        ZoomAmt = 0,
        FovZoom = false,
    },
    cursor = {
        Enabled = false,
        CustomPos = false,
        Position = Vector2.new(0,0),
        Speed = 5,
        Radius = 25,
        Color = Color3.fromRGB(180, 50, 255),
        Thickness = 1.7,
        Outline = false,
        Resize = false,
        Dot = false,
        Gap = 10,
        TheGap = false,
        Text = {
            Logo = false,
            LogoColor = Color3.new(1,1,1),
            Name = false,
            NameColor = Color3.new(1,1,1),
            LogoFadingOffset = 0,
        },
        sussy = false,
        rainbow = false
    },
    thirdperson = false,
    thirdpdist = 0,
    speenx = 0,
    speeny = 0,
    speenz = 0,
    tpwalkspeed = 0,
    spinspeed = 0,
    infJumpDebounce = false,
    spamsettings = {
        speed = 0,
        num = 1,
        enabled = false,
        emojis = false,
        symb = false,
        emobmin=1,
        emobmax=2,
        symbmin=1,
        symbmax=2,
        symbols = {"$", "\"", "/", "%", "&", "_", "^", ">", "[", "]", ":", "™"},
        real = {
            [1] = {
                "\240\159\152\142", --"😎",
                "\240\159\152\136", --"😈",
                "\240\159\164\145", --"🤑",
                "\240\159\152\173", --"😭",
                "\240\159\164\175", --"🤯",
                "\240\159\165\182", --"🥶",
                "\240\159\152\179",--"😳",
                "\240\159\165\181",--"🥵",
                "\240\159\152\177",--"😱",
                "\240\159\152\161",--"😡",
                "\240\159\152\130",--"😂",
                "\240\159\166\129",--"🦁",
                "\240\159\166\134",--"🦆",
                "\240\159\166\138",--"🦊", 
                "\226\153\191"--"♿"
            },
            [2] = {
                "cheap game scripts @ .gg/swimhub",
                "quanity over quality @ .gg/swimhub",
                "good and cheap @ .gg/swimhub",
                "free furries @ .gg/swimhub",
                "supporting every country @ .gg/swimhub",
                "(Если ты из СНГ то тебе дешевле) @ .gg/swimhub",
                "the best paste @ .gg/swimhub",
                "not racist dev @ .gg/swimhub",
                "open source free script @ .gg/swimhub",
            }
        },
        customword = "",
        customwordenabled = false,
        chatlenghtpatch = 200,
    },
}
local function generateword(word)
    local final = " "..word.." "
    local function addsomething()
        if varsglobal.spamsettings.emojis and varsglobal.spamsettings.symb then
            local chosen, word = varsglobal.spamsettings.real[1], nil
            word = varsglobal.spamsettings.symbols[math.random(1,#varsglobal.spamsettings.symbols)]:rep(math.random(2,5))..chosen[math.random(1,#chosen)]:rep(1,2).." "
            return word
        elseif varsglobal.spamsettings.emojis then
            local chosen, word = varsglobal.spamsettings.real[1], nil
            word = chosen[math.random(1,#chosen)]:rep(1,2).." "
            return word
        elseif varsglobal.spamsettings.symb then
            local word = nil
            word = varsglobal.spamsettings.symbols[math.random(1,#varsglobal.spamsettings.symbols)]:rep(math.random(2,5)).." "
            return word
        else
            return ""
        end
    end
    if not varsglobal.spamsettings.emojis and not varsglobal.spamsettings.symb then
        return (final):sub(1, varsglobal.spamsettings.chatlenghtpatch)
    else
        return (addsomething()..addsomething()..final..addsomething()..addsomething()..final..addsomething()..addsomething()..final..addsomething()..addsomething()..final..addsomething()..addsomething()):sub(1,varsglobal.spamsettings.chatlenghtpatch)
    end
end
wrap(function()
    while task.wait(varsglobal.spamsettings.speed) do
        if varsglobal.spamsettings.enabled then
            if varsglobal.spamsettings.num >= #varsglobal.spamsettings.real[2] then
                if not varsglobal.spamsettings.customwordenabled then
                    varsglobal.spamsettings.num = 1
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(generateword(varsglobal.spamsettings.real[2][varsglobal.spamsettings.num]), "All")
                else
                    varsglobal.spamsettings.num = 1
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(generateword(varsglobal.spamsettings.customword), "All")
                end
            else
                if not varsglobal.spamsettings.customwordenabled then
                    varsglobal.spamsettings.num = varsglobal.spamsettings.num + 1
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(generateword(varsglobal.spamsettings.real[2][varsglobal.spamsettings.num]), "All")
                else
                    varsglobal.spamsettings.num = varsglobal.spamsettings.num + 1
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(generateword(varsglobal.spamsettings.customword), "All")
                end
            end
        end
    end
end)

local Visuals = Tabs.Main:AddRightTabbox()
if game.GameId ~= 4620241901 then
local TabEsp = Tabs.Main:AddRightTabbox()
local EnemyEspTab = TabEsp:AddTab('enemy')
local TeamEspTab = TabEsp:AddTab('friendly')

local enemysets = _esplib.teamSettings.enemy 
local teamsets = _esplib.teamSettings.friendly
EnemyEspTab:AddToggle('EspSwitch', {
    Text = 'enable esp',
    Default = false,
    Callback = function(first)
        enemysets.enabled = first
    end
})
EnemyEspTab:AddToggle('boxswitch', {
    Text = 'box esp',
    Default = false,  
    Callback = function(first)
        enemysets.box = first
    end
}):AddColorPicker('boxcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'box color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.boxColor[1] = Value
    end
})
EnemyEspTab:AddToggle('nameswitch', {
    Text = 'name esp',
    Default = false,  
    

    Callback = function(first)
        enemysets.name = first
    end
}):AddColorPicker('namecolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'name color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.nameColor[1] = Value
    end
})
EnemyEspTab:AddToggle('healthswitch', {
    Text = 'health bar esp',
    Default = false,  
    

    Callback = function(first)
        enemysets.healthBar = first
    end
})
EnemyEspTab:AddToggle('healthswitch', {
    Text = 'health text esp',
    Default = false,  
    

    Callback = function(first)
        enemysets.healthText = first
    end
}):AddColorPicker('healthcolor', {
    Default = Color3.new(0, 1, 0),
    Title = 'health color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.healthTextColor[1] = Value
    end
})
EnemyEspTab:AddToggle('tracerswitch', {
    Text = 'tracers esp',
    Default = false,  
    Callback = function(first)
        enemysets.tracer = first
    end
}):AddColorPicker('tracercolor', {
    Default = Color3.new(0, 1, 0),
    Title = 'tracer color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.tracerColor[1] = Value
    end
})
EnemyEspTab:AddDropdown('Enemy Tracer Origin', {Values = {'Top', 'Bottom', 'Mouse'},Default = 1,Multi = false,Text = 'tracer origin',Tooltip = 'select origin',Callback = function(Value)
    enemysets.tracerOrigin = Value
end})
EnemyEspTab:AddToggle('distswitch', {
    Text = 'distance esp',
    Default = false,  

    Callback = function(first)
        enemysets.distance = first
    end
}):AddColorPicker('distcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'distance color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.distanceColor[1] = Value
    end
})
EnemyEspTab:AddToggle('distswitchniger', {
    Text = 'chams',
    Default = false,  

    Callback = function(first)
        enemysets.chams = first
    end
}):AddColorPicker('distcolor1337', {
    Default = Color3.new(1, 1, 1),
    Title = 'chams outline',
    Transparency = 0,

    Callback = function(Value)
        enemysets.chamsOutlineColor[1] = Value
    end
}):AddColorPicker('distcolor228', {
    Default = Color3.new(1, 1, 1),
    Title = 'chams fill',
    Transparency = 0,

    Callback = function(Value)
        enemysets.chamsFillColor[1] = Value
    end
})

EnemyEspTab:AddToggle('outOfViewArrows/switch', { --//outOfViewArrows for EnemySets
    Text = 'oof arrows',
    Default = false,  
    Callback = function(first)
        enemysets.offScreenArrow = first 
    end
}):AddColorPicker('outOfViewArrowscolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'oof color',
    Transparency = 0,

    Callback = function(Value)
        enemysets.offScreenArrowColor[1] = Value
    end
})
EnemyEspTab:AddToggle('outOfViewArrows/switch', { --//outOfViewArrows for EnemySets
    Text = 'oof outline',
    Default = false,  
    Callback = function(first)
        enemysets.offScreenArrow = first 
    end
})
EnemyEspTab:AddSlider('outOfViewArrowsOutlines radius', {Text = 'oof radius', Default = 60,Min = 0,Max = 600,Rounding = 0,Compact = true})
:OnChanged(function(State)
    enemysets.offScreenArrowRadius = State
end)
EnemyEspTab:AddSlider('outOfViewArrowsOutlines Size', {Text = 'oof size', Default = 60,Min = 0,Max = 600,Rounding = 0,Compact = true})
:OnChanged(function(State)
    enemysets.offScreenArrowSize = State
end)


TeamEspTab:AddToggle('teamEspSwitch', {
    Text = 'enable esp',
    Default = false,
    Callback = function(first)
        teamsets.enabled = first
    end
})
TeamEspTab:AddToggle('teamboxswitch', {
    Text = 'box esp',
    Default = false,  
    Callback = function(first)
        teamsets.box = first
    end
}):AddColorPicker('teamboxcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'box color',
    Transparency = 0,

    Callback = function(Value)
        teamsets.boxColor[1] = Value
    end
})
TeamEspTab:AddToggle('teamnameswitch', {
    Text = 'name esp',
    Default = false,  
    

    Callback = function(first)
        teamsets.name = first
    end
}):AddColorPicker('teamnamecolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'name color',
    Transparency = 0,

    Callback = function(Value)
        teamsets.nameColor[1] = Value
    end
})
TeamEspTab:AddToggle('teamhealthswitch', {
    Text = 'health bar esp',
    Default = false,  
    

    Callback = function(first)
        teamsets.healthBar = first
    end
})
TeamEspTab:AddToggle('teamhealthswitch', {
    Text = 'health text esp',
    Default = false,  
    

    Callback = function(first)
        teamsets.healthText = first
    end
}):AddColorPicker('teamhealthcolor', {
    Default = Color3.new(0, 1, 0),
    Title = 'health color',
    Transparency = 0,

    Callback = function(Value)
        teamsets.healthTextColor[1] = Value
    end
})
TeamEspTab:AddToggle('teamdistswitch', {
    Text = 'distance esp',
    Default = false,  

    Callback = function(first)
        teamsets.distance = first
    end
}):AddColorPicker('teamdistcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'distance color',
    Transparency = 0,

    Callback = function(Value)
        teamsets.distanceColor[1] = Value
    end
})
_esplib.Load()
end
local WorldTab = Visuals:AddTab('world')
local Misc = Tabs.Misc:AddLeftGroupbox('Misc')
local CrosshairTab = Tabs.Misc:AddLeftGroupbox('crosshair')
local movetab = Tabs.Misc:AddRightGroupbox('movement')
local debugtab = Tabs.Misc:AddLeftGroupbox('debug')
local stuffz = Tabs.Settings:AddLeftGroupbox('stuffz')
local luatab = Tabs.Lua:AddRightGroupbox('swimlua');
(function()
    local draw, objects = {}, {}
    function draw:new(type, props)
        local obj = Drawing.new(type)
        for i, v in pairs(props) do
            obj[i] = v
        end
        objects[#objects+1] = obj
        return obj
    end
    function draw:removeall()
        for i, v in pairs(objects) do
            v:Remove()
        end
    end
    function draw:changevis(value)
        for i, v in pairs(objects) do
            v.Visible = value
        end
    end
    
    Misc:AddToggle('showwatermark', {Text='watermark',Default=false,Callback=function(v)draw:changevis(v)end}):AddColorPicker('watercolor', {Default = Color3.fromRGB(139, 68, 235),Title = 'watermark color',Transparency = 0})
    local toprightpos = Vector2.new(camera.ViewportSize.X-10, 10)

    local background = draw:new("Line", {
        To = toprightpos - Vector2.new(200, -(6+3)),
        From = toprightpos - Vector2.new(0, -(6+3)),
        Thickness = 15,
        Transparency = 0.7,
        Visible = true,
        Color = Color3.new(0,0,0),
        ZIndex = 1,
    })
    local topbar = draw:new("Line", {
        To = toprightpos - Vector2.new(200, 0),
        From = toprightpos - Vector2.new(0, 0),
        Thickness = 1,
        Transparency = 1,
        Visible = true,
        Color = Options["watercolor"].Value,
        ZIndex = 1,
    })
    local topbar1 = draw:new("Line", {
        To = toprightpos - Vector2.new(200, -1),
        From = toprightpos - Vector2.new(0, -1),
        Thickness = 1,
        Transparency = 1,
        Visible = true,
        Color = Options["watercolor"].Value,
        ZIndex = 1,
    })
    local logotext = draw:new("Text", {
        Text = "protogen",
        Size = 13,
        Font = 1,
        Outline = true,
        Center = false,
        Position = toprightpos - Vector2.new(200-5, -2),
        Transparency = 1,
        Visible = true,
        Color = Options["watercolor"].Value,
        ZIndex = 1,
    })
    local text = draw:new("Text", {
        Text = ".gay | fps | ping",
        Size = 13,
        Font = 1,
        Outline = true,
        Center = false,
        Position = toprightpos - Vector2.new(200-5, -2),
        Transparency = 1,
        Visible = true,
        Color = Color3.new(1,1,1),
        ZIndex = 1,
    })
    draw:changevis(false)
    local FrameTimer = tick()
    local FrameCounter = 0;
    local FPS = 60;
    RunService.Stepped:Connect(function()

        toprightpos = Vector2.new(camera.ViewportSize.X-10, 10)

        topbar.From = toprightpos
        topbar1.From = toprightpos - Vector2.new(0, -1)
        background.From = toprightpos - Vector2.new(0, -(6+3))

        topbar.To = toprightpos - Vector2.new(logotext.TextBounds.X+text.TextBounds.X+10, 0)
        topbar1.To = toprightpos - Vector2.new(logotext.TextBounds.X+text.TextBounds.X+10, -1)
        background.To = toprightpos - Vector2.new(logotext.TextBounds.X+text.TextBounds.X+10, -(6+3))

        logotext.Position = toprightpos - Vector2.new(logotext.TextBounds.X+text.TextBounds.X+5, -2)
        text.Position = toprightpos - Vector2.new(text.TextBounds.X+5, -2)

        topbar.Color = Options["watercolor"].Value
        topbar1.Color = Options["watercolor"].Value
        logotext.Color = Options["watercolor"].Value

        FrameCounter = FrameCounter + 1;
        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter;
            FrameTimer = tick();
            FrameCounter = 0;
        end;

        text.Text = title:format(
            "nil",
            math.floor(FPS),
            math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
        );
    end)
end)();
makefolder("swimhub\\lua")
local function refreshluas()
    local files = listfiles('swimhub\\lua')
    local valids = {}
    table.foreach(files, function(i, v)
        if v:sub(v:len()-3,v:len()) == ".lua" then
            table.insert(valids, v:sub(("swimhub\\lua"):len()+2))
        end
    end)
    table.foreach(valids, print)
    return valids
end
luatab:AddLabel("docs at dc server")
if noadonis then
    luatab:AddDropdown('luadropdown', {
        Values = {''},
        Default = 1,
        Multi = false,
        Text = 'lua list',
        Tooltip = 'select desired lua'
    }):SetValues(refreshluas())
    luatab:AddButton('refresh', function()
        Options.luadropdown:SetValues(refreshluas())
    end)
    local _nc;_nc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod():lower()
        local args = {...}
        if method == "getservice" and args[1] == "swimhub" then
            local set_identity = (type(syn) == 'table' and syn.set_thread_identity) or setidentity or setthreadcontext
            set_identity(7)
            local main = {
                LuaTab = Tabs.Lua
            }
            function main:Notify(...)
                return Library:Notify(...)
            end
            return main
        end
        return _nc(self, ...)
    end))
    luatab:AddButton('load desired lua', function()
        loadstring(readfile('swimhub\\lua\\'..Options["luadropdown"].Value))()
    end)
else
    luatab:AddLabel("not available")
end

do
    varsglobal.cursor.rainbow = false
    varsglobal.cursor.sussy = false
    CrosshairTab:AddToggle('crosshairenable', {
        Text = 'enable crosshair',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Enabled = first  
        end
    }):AddColorPicker('crosshaircolor', {
        Default = Color3.new(1, 1, 1),
        Title = 'crosshair color',
        Transparency = 0,
        Callback = function(Value)
            varsglobal.cursor.Color = Value
        end
    })
    CrosshairTab:AddSlider('crosshairspeed', {
        Text = 'speed',
        Default = 3,
        Min = 0.1,
        Max = 15,
        Rounding = 1,
        Compact = true,  
    }):OnChanged(function(State)
        varsglobal.cursor.Speed = State
    end)
    CrosshairTab:AddSlider('crosshairradius', {
        Text = 'radius',
        Default = 25,
        Min = 0.1,
        Max = 100,
        Rounding = 1,
        Compact = true,  
    }):OnChanged(function(State)
        varsglobal.cursor.Radius = State
    end)
    CrosshairTab:AddSlider('crosshairthickness', {
        Text = 'thickness',
        Default = 1.5,
        Min = 0.1,
        Max = 10,
        Rounding = 1,
        Compact = true,  
    }):OnChanged(function(State)
        varsglobal.cursor.Thickness = State
    end)
    CrosshairTab:AddSlider('crosshairgapsize', {
        Text = 'gap',
        Default = 5,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Compact = true,  
    }):OnChanged(function(State)
        varsglobal.cursor.Gap = State
    end)
    CrosshairTab:AddToggle('crosshairenablegap', {
        Text = 'math divide gap',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.TheGap = first  
        end
    })
    CrosshairTab:AddToggle('crosshairenableoutline', {
        Text = 'outline',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Outline = first  
        end
    })
    CrosshairTab:AddToggle('crosshairenableresize', {
        Text = 'resize animation',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Resize = first  
        end
    })
    CrosshairTab:AddToggle('crosshairenabledot', {
        Text = 'dot',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Dot = first  
        end
    })
    CrosshairTab:AddToggle('crosshairenablenazi', {
        Text = 'sussy',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.sussy = first  
        end
    })
    CrosshairTab:AddToggle('crosshairenablefaggot', {
        Text = 'rainbow',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.rainbow = first  
        end
    })
    CrosshairTab:AddToggle('crosshairtextLogo', {
        Text = 'text logo',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Text.Logo = first  
        end
    }):AddColorPicker('crosshairlogocolor', {
        Default = Color3.new(1, 1, 1),
        Title = 'logo color',
        Transparency = 0,
        Callback = function(Value)
            varsglobal.cursor.Text.LogoColor = Value
        end
    })
    CrosshairTab:AddToggle('crosshairtextName', {
        Text = 'text name',
        Default = false,  
    
        Callback = function(first)
            varsglobal.cursor.Text.Name = first  
        end
    }):AddColorPicker('crosshairtextcolor', {
        Default = Color3.new(1, 1, 1),
        Title = 'text color',
        Transparency = 0,
        Callback = function(Value)
            varsglobal.cursor.Text.NameColor = Value
        end
    })
    CrosshairTab:AddSlider('crosshairlogooffset', {
        Text = 'logo fade offset',
        Default = 0,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Compact = true,  
    }):OnChanged(function(State)
        varsglobal.cursor.Text.LogoFadingOffset = State
    end)
    local utility = {}
    
    -- // Functions
    function utility:new(type, properties)
        local object = Drawing.new(type)
        
        for i, v in pairs(properties) do
            object[i] = v
        end
        return object
    end
    -- // Initilisation
    local lines = {}
    -- // Drawings
    local outline = utility:new("Square",{
        Visible =  true,
        Size = Vector2.new(4, 4),
        Color = Color3.fromRGB(0, 0, 0),
        Filled = true,
        ZIndex = 1,
        Transparency = 1
    })
    --
    local dot = utility:new("Square",{
        Visible =  true,
        Size = Vector2.new(2, 2),
        Color = varsglobal.cursor.Color,
        Filled = true,
        ZIndex = 2,
        Transparency = 1
    })
    --
    local logotext = utility:new("Text", {
        Visible = false,
        Font = 2,
        Size = 13,
        Color = Color3.fromRGB(138, 128, 255),
        ZIndex = 3,
        Transparency = 1,
        Text = "protogen.gay",
        Center = true,
        Outline = true,
    })
    local text = utility:new("Text", {
        Visible = false,
        Font = 2,
        Size = 13,
        Color = Color3.new(1,1,1),
        ZIndex = 3,
        Transparency = 1,
        Text = plr.Name,
        Center = true,
        Outline = true,
    })
    --
    for i=1 , 4 do
        --
        local line_outline = utility:new("Line",{
            Visible =  true,
            From = Vector2.new(200,500),
            To = Vector2.new(200,500),
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = varsglobal.cursor.Thickness + 2.5,
            ZIndex = 1,
            Transparency = 1
        })
        --
        local line = utility:new("Line",{
            Visible =  true,
            From = Vector2.new(200,500),
            To = Vector2.new(200,500),
            Color = varsglobal.cursor.Color,
            Thickness = varsglobal.cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })

        local naziline = utility:new("Line",{
            Visible =  true,
            From = Vector2.new(200,500),
            To = Vector2.new(200,500),
            Color = varsglobal.cursor.Color,
            Thickness = varsglobal.cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })

        lines[i] = {line, line_outline, naziline}
    end
    -- // Main
    local angle = 0
    local transp = 0
    local reverse = false
    local function setreverse(value)
        if reverse ~= value then
            reverse = value
        end
    end
    --
    local pos, rainbow, rotationdegree, color = Vector2.zero, 0, 0, Color3.new()
    local math_cos, math_atan, math_pi, math_sin = math.cos, math.atan, math.pi, math.sin
    local function DEG2RAD(x) return x * math_pi / 180 end
    local function RAD2DEG(x) return x * 180 / math_pi end
    RunService.RenderStepped:Connect(function(delta)
        if varsglobal.cursor.Enabled then
            rainbow = rainbow + (delta * 0.5)
            if rainbow > 1.0 then rainbow = 0.0 end
            color = Color3.fromHSV(rainbow, 1, 1)
            if varsglobal.cursor.CustomPos then pos = varsglobal.cursor.Position else pos = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y)end
            if varsglobal.cursor.rainbow then color = Color3.fromHSV(rainbow, 1, 1) else color = varsglobal.cursor.Color end
            if transp <= 1.5+varsglobal.cursor.Text.LogoFadingOffset and not reverse then 
                transp = transp +((varsglobal.cursor.Speed * 10) * delta)
                if transp >= 1.5+varsglobal.cursor.Text.LogoFadingOffset then setreverse(true) end
            elseif reverse then
                transp = transp - ((varsglobal.cursor.Speed * 10) * delta)
                if transp <= 0-varsglobal.cursor.Text.LogoFadingOffset then setreverse(false) end
            end
            logotext.Position = Vector2.new(pos.X, (pos + Vector2.new(0, varsglobal.cursor.Radius + 5)).Y)
            logotext.Transparency = transp
            logotext.Visible = varsglobal.cursor.Text.Logo
            logotext.Color = varsglobal.cursor.Text.LogoColor
            --
            text.Position = Vector2.new(pos.X, (pos + Vector2.new(0, varsglobal.cursor.Radius + (varsglobal.cursor.Text.Logo and 19 or 5))).Y)
            text.Visible = varsglobal.cursor.Text.Name
            text.Color = varsglobal.cursor.Text.NameColor

            if varsglobal.cursor.sussy then
                local frametime = delta
                local a = varsglobal.cursor.Radius - 10
                local gamma = math_atan(a / a)
                
                if rotationdegree >= 90 then rotationdegree = 0 end
            
                for i = 1, 4 do  
                    local p_0 = (a * math_sin(DEG2RAD(rotationdegree + (i * 90))))
                    local p_1 = (a * math_cos(DEG2RAD(rotationdegree + (i * 90))))
                    local p_2 =((a / math_cos(gamma)) * math_sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
                    local p_3 =((a / math_cos(gamma)) * math_cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
            
                    
                    lines[i][1].From = Vector2.new(pos.X, pos.Y)
                    lines[i][1].To = Vector2.new(pos.X + p_0, pos.Y - p_1)
                    lines[i][1].Color = color
                    lines[i][1].Thickness = varsglobal.cursor.Thickness
                    lines[i][1].Visible = true
                    lines[i][3].From = Vector2.new(pos.X + p_0, pos.Y - p_1)
                    lines[i][3].To = Vector2.new(pos.X + p_2, pos.Y - p_3)
                    lines[i][3].Color = color
                    lines[i][3].Thickness = varsglobal.cursor.Thickness
                    lines[i][3].Visible = true
                end
                rotationdegree = rotationdegree + ((varsglobal.cursor.Speed * frametime) * 1000) 
            else
                angle = angle + ((varsglobal.cursor.Speed * 10) * delta)

                if angle >= 90 then
                    angle = 0
                end
                --
                dot.Visible = varsglobal.cursor.Dot
                dot.Color = color
                dot.Position = Vector2.new(pos.X - 1, pos.Y - 1)
                --
                outline.Visible = varsglobal.cursor.Outline and varsglobal.cursor.Dot
                outline.Position = Vector2.new(pos.X - 2, pos.Y - 2)
                --

                --
                for index, line in pairs(lines) do
                    index = index
                    if varsglobal.cursor.Resize then
                        x = {pos.X + (math.cos(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius + ((varsglobal.cursor.Radius * math.sin(angle)) / 9))), pos.X + (math.cos(angle + (index * (math.pi / 2))) * ( (varsglobal.cursor.Radius - 20) - (varsglobal.cursor.TheGap and (((varsglobal.cursor.Radius - 20) * math.cos(angle)) / 4) or (((varsglobal.cursor.Radius - 20) * math.cos(angle)) - 4))))}
                        y = {pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius + ((varsglobal.cursor.Radius * math.sin(angle)) / 9))), pos.Y + (math.sin(angle + (index * (math.pi / 2))) * ( (varsglobal.cursor.Radius - 20) - (varsglobal.cursor.TheGap and (((varsglobal.cursor.Radius - 20) * math.cos(angle)) / 4) or (((varsglobal.cursor.Radius - 20) * math.cos(angle)) - 4))))}
                        x1 = {pos.X + (math.cos(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius+1)), pos.X + (math.cos(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20+1 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20+1)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20+1)-varsglobal.cursor.Gap)) ))}
                        y1 = {pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius+1)), pos.Y + (math.sin(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20+1 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20+1)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20+1)-varsglobal.cursor.Gap)) ))}
                    else
                        x = {pos.X + (math.cos(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius)), pos.X + (math.cos(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20)-varsglobal.cursor.Gap)) ))}
                        y = {pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius)), pos.Y + (math.sin(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20)-varsglobal.cursor.Gap)) ))}
                        x1 = {pos.X + (math.cos(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius+1)), pos.X + (math.cos(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20+1 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20+1)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20+1)-varsglobal.cursor.Gap)) ))}
                        y1 = {pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (varsglobal.cursor.Radius+1)), pos.Y + (math.sin(angle + (index * (math.pi / 2))) * ( ( varsglobal.cursor.Radius - 20+1 ) - (varsglobal.cursor.TheGap and((varsglobal.cursor.Radius-20+1)/varsglobal.cursor.Gap)or((varsglobal.cursor.Radius-20+1)-varsglobal.cursor.Gap)) ))}
                    end
                    --
                    line[1].Visible = true
                    line[1].Color = color
                    line[1].From = Vector2.new(x[2], y[2])
                    line[1].To = Vector2.new(x[1], y[1])
                    line[1].Thickness = varsglobal.cursor.Thickness
                    --
                    line[2].Visible = varsglobal.cursor.Outline
                    line[2].From = Vector2.new(x1[2], y1[2])
                    line[2].To = Vector2.new(x1[1], y1[1])
                    line[2].Thickness = varsglobal.cursor.Thickness + 2.5

                    line[3].Visible = false
                end
            end
        else
            dot.Visible = false
            outline.Visible = false
            logotext.Visible = false
            text.Visible = false
            --
            for index, line in pairs(lines) do
                line[1].Visible = false
                line[2].Visible = false
                line[3].Visible = false
            end
        end
    end)
end


WorldTab:AddToggle('nograsss', {
    Text = 'no grass',
    Default = false,  
    Callback = function(first)
        sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", not first)
    end
})
WorldTab:AddButton('no fog', function()
    if Lighting:FindFirstChildOfClass("Atmosphere") then
        Lighting:FindFirstChildOfClass("Atmosphere"):Destroy()
    end
end)
WorldTab:AddSlider('timechanger', {
    Text = 'time changer',

    Default = varsglobal.visuals.oldTime,
    Min = 0,
    Max = 24,
    Rounding = 1,

    Compact = false,  
}):OnChanged(function(State)
    varsglobal.visuals.Time = State
end)
WorldTab:AddLabel('zoom bind'):AddKeyPicker('KeyPicker', {
    Default = 'None',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'zoom onto thing',
    NoUI = false,
    Callback = function(first)
        varsglobal.visuals.FovZoom = first
        if first then
            workspace.CurrentCamera.FieldOfView = varsglobal.visuals.ZoomAmt
        else
            workspace.CurrentCamera.FieldOfView = varsglobal.visuals.OldFov
        end
    end,
})
WorldTab:AddSlider('zoomslider', {
    Text = 'zoom slider',
    Default = varsglobal.visuals.OldFov - 30,
    Min = 0,
    Max = 120,
    Rounding = 0,
    Compact = false,  
}):OnChanged(function(State)
    varsglobal.visuals.ZoomAmt = State
end)
WorldTab:AddToggle('ambientswitch', {
    Text = 'enable ambient',
    Default = false,  
    

    Callback = function(first)
        varsglobal.visuals.gradientenabled = first
    end
}):AddColorPicker('ambientcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'ambient color1',
    Transparency = 0,

    Callback = function(Value)
        varsglobal.visuals.gradientcolor1 = Value
    end
}):AddColorPicker('ambientcolor1', {
    Default = Color3.new(1, 1, 1),
    Title = 'ambient color2',
    Transparency = 0,

    Callback = function(Value)
        varsglobal.visuals.gradientcolor2 = Value
    end
})
WorldTab:AddToggle('fogswitch', {
    Text = 'enable fog',
    Default = false,  
    

    Callback = function(first)
        varsglobal.visuals.FogEnabled = first
    end
}):AddColorPicker('fogcolor', {
    Default = Color3.new(1, 1, 1),
    Title = 'fog color',
    Transparency = 0,

    Callback = function(Value)
        varsglobal.visuals.FogColor = Value
    end
})
WorldTab:AddSlider('fogstart', {
    Text = 'fog start',

    Default = 0,
    Min = 0,
    Max = 1000,
    Rounding = 0,

    Compact = false,  
}):OnChanged(function(State)
    varsglobal.visuals.FogStart = State
end)
WorldTab:AddSlider('fogend', {
    Text = 'fog end',

    Default = 10000,
    Min = 0,
    Max = 10000,
    Rounding = 0,

    Compact = false,  
}):OnChanged(function(State)
    varsglobal.visuals.FogEnd = State
end)

if isusingfancyloader then
    print(" [ 3/5 ] loaded visuals\n")
end

Misc:AddToggle('keybindshoww', {
    Text = 'show keybinds',
    Default = false,  
    

    Callback = function(first)
        Library.KeybindFrame.Visible = first;
    end
})
Misc:AddToggle('ChatSPAM', {
    Text = 'adaptive chatspam',
    Default = false,  
    

    Callback = function(first)
        varsglobal.spamsettings.enabled = first
    end
})
Misc:AddSlider('spamspeed', {
    Text = 'message interval',
    Default = 3,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Compact = false,  
}):OnChanged(function(State)
    varsglobal.spamsettings.speed = State
end)
Misc:AddToggle('chatpsamcdstlbols', {
    Text = 'symbols',
    Default = false,  
    

    Callback = function(first)
        varsglobal.spamsettings.symb = first
    end
})
Misc:AddToggle('ChatSPAMemojis', {
    Text = 'emojis',
    Default = false,  
    

    Callback = function(first)
        varsglobal.spamsettings.emojis = first
    end
})
Misc:AddToggle('chatpsa1mcdstlbols', {
    Text = 'custom word',
    Default = false,  
    

    Callback = function(first)
        varsglobal.spamsettings.customwordenabled = first
    end
})
Misc:AddInput('customwordtextbox', {
    Default = 'protogen.gay on top',
    Numeric = false,
    Finished = false,

    Text = 'custom word',
    Tooltip = 'hmmm',

    Placeholder = 'enter text',

    Callback = function(Value)
        varsglobal.spamsettings.customword = Value
    end
})
Misc:AddButton('Rejoin', function()
    if #plrs:GetPlayers() <= 1 then
        plrs.LocalPlayer:Kick("\nrejoining⚡")
        wait()
        game:GetService("TeleportService"):Teleport(game.PlaceId, plrs.LocalPlayer)
    else
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plrs.LocalPlayer)
    end
end)

movetab:AddToggle('ToggleSpeed', {
    Text = 'speed toggle',
    Default = false,  
    

    Callback = function(first)
        tpwalking = first
        local chr = game:GetService("Players").LocalPlayer.Character
        local hum = chr and chr:WaitForChild("Humanoid")
        while tpwalking and chr and hum and hum.Parent do
            local delta = RunService.Heartbeat:Wait()
            if hum.MoveDirection.Magnitude > 0 then
                if varsglobal.tpwalkspeed then
                    chr:TranslateBy(hum.MoveDirection * tonumber(varsglobal.tpwalkspeed) * delta * 10)
                else
                    chr:TranslateBy(hum.MoveDirection * delta * 10)
                end
            end
        end
    end
})

movetab:AddSlider('CFrameSpeed', {
    Text = 'CFrame Speed',

    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,

    Compact = false,  
}):OnChanged(function(State)
    varsglobal.tpwalkspeed = State
end)
movetab:AddToggle('justspin', {
    Text = 'CFrame spin',
    Default = false,  

    Callback = function(first)

    end
})
movetab:AddSlider('justspinspeed', {
    Text = 'CFrame spin speed',

    Default = 1,
    Min = 1,
    Max = 30,
    Rounding = 1,

    Compact = false,  
}):OnChanged(function(State)
    varsglobal.spinspeed = State
end)

-- totally not cripware
local OriginalAutoRotate = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").AutoRotate or true
RunService.RenderStepped:Connect(function()
    camera = game:GetService("Workspace").CurrentCamera
    if varsglobal.visuals.gradientenabled then
        Lighting.Ambient = varsglobal.visuals.gradientcolor1
        Lighting.OutdoorAmbient = varsglobal.visuals.gradientcolor2
    else
        Lighting.Ambient = varsglobal.visuals.oldgradient1
        Lighting.OutdoorAmbient = varsglobal.visuals.oldgradient2
    end
    if varsglobal.visuals.FogEnabled then
        Lighting.FogStart = varsglobal.visuals.FogStart
        Lighting.FogEnd = varsglobal.visuals.FogEnd
        Lighting.FogColor = varsglobal.visuals.FogColor
    else
        Lighting.FogStart = varsglobal.visuals.oldFogStart
        Lighting.FogEnd = varsglobal.visuals.oldFogEnd
        Lighting.FogColor = varsglobal.visuals.oldFogColor
    end

    if varsglobal.visuals.FovZoom then camera.FieldOfView = varsglobal.visuals.ZoomAmt end

    Lighting.ClockTime = varsglobal.visuals.Time

    local SelfCharacter = plr.Character
    local SelfRootPart, SelfHumanoid = SelfCharacter and SelfCharacter:FindFirstChild("HumanoidRootPart"), SelfCharacter and SelfCharacter:FindFirstChildOfClass("Humanoid")
    if (SelfCharacter and SelfRootPart and SelfHumanoid) and Toggles["justspin"].Value then
        SelfHumanoid.AutoRotate = false
        local Angle do
            Angle = -math.atan2(camera.CFrame.LookVector.Z, camera.CFrame.LookVector.X) + tick() * varsglobal.spinspeed % 360
        end
        local NewAngle = CFrame.new(SelfRootPart.Position) * CFrame.Angles(0, Angle, 0)
        local function ToYRotation(_CFrame)
            local _, Y, _ = _CFrame:ToOrientation()
            return CFrame.new(_CFrame.Position) * CFrame.Angles(0, Y, 0)
        end
        local Angle2 = ToYRotation(NewAngle)
        SelfRootPart.CFrame = Angle2
    elseif (SelfCharacter and SelfRootPart and SelfHumanoid) and not Toggles["justspin"].Value then
        SelfHumanoid.AutoRotate = OriginalAutoRotate
    end
end)
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder('swimhub')
SaveManager:SetFolder('swimhub')
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToGroupbox(stuffz)
if isusingfancyloader then
    print(" [ 4/5 ] loaded misc\n")
end

local lsurv = {
    drawfov = false,
    aimfov = 0,
    silentaim = false,
    silentaimpart = "HumanoidRootPart",
    fovcolor = Color3.new(1,1,1),
    fovoutline = false,
    baseclipsize = 6,
    wallnigger = false
}
        
local lonesurvival = Tabs.Main:AddLeftGroupbox("Lone Survival")
local function GetClosest()
    local Target = nil
    local Closest = lsurv.aimfov
    for _,v in pairs(plrs:GetPlayers()) do
        if (v.Character and v ~= plr and v.Character:FindFirstChild(lsurv.silentaimpart)) then
            local Position, OnScreen = camera:WorldToScreenPoint(v.Character[lsurv.silentaimpart].Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
            if (Distance < Closest and OnScreen) then
                Closest = Distance
                Target = v.Character[lsurv.silentaimpart]
            end
        end
    end
    return Target
end

lonesurvival:AddToggle('silenw22', {
    Text = 'silent aim',
    Default = false,  
    

    Callback = function(first)
        lsurv.silentaim = first
    end
})

lonesurvival:AddDropdown('SilentAimHitPartjb', {
    Values = {'HumanoidRootPart', 'Head'},
    Default = 1,
    Multi = false,

    Text = 'silent aim part',
    Tooltip = 'select part',

    Callback = function(Value)
        lsurv.silentaimpart = Value
    end
})
lonesurvival:AddSlider('aimfov', {
    Text = 'aim fov',

    Default = 60,
    Min = 0,
    Max = 700,
    Rounding = 0,

    Compact = false,  
}):OnChanged(function(State)
    lsurv.aimfov = State
end)
lonesurvival:AddToggle('dra11wfov', {
    Text = 'draw fov',
    Default = false,  


    Callback = function(first)
        lsurv.drawfov = first
    end
}):AddColorPicker('fovc11olor', {
    Default = Color3.new(1, 1, 1),
    Title = 'fov color',
    Transparency = 0,

    Callback = function(Value)
        lsurv.fovcolor = Value
    end
})

lonesurvival:AddToggle('fov11outline', {
    Text = 'draw fov outline',
    Default = false,  


    Callback = function(first)
        lsurv.fovoutline = first
    end
})

lonesurvival:AddToggle('wallnigger', {
    Text = 'semi-wallbang',
    Default = false,
    Callback = function(first)
        lsurv.wallnigger = first
    end
})

lonesurvival:AddDivider()

lonesurvival:AddSlider('baseclipdist', {
    Text = 'vertical clip distance',

    Default = 6,
    Min = 4,
    Max = 10,
    Rounding = 0,

    Compact = false,  
}):OnChanged(function(State)
    lsurv.baseclipsize = State
end)
lonesurvival:AddLabel('downclip bind'):AddKeyPicker('lowclip', {
    Default = 'None',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'downclip',
    NoUI = false,
    Callback = function(first)
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") or nil
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.new(0, -lsurv.baseclipsize, 0)
        end
    end
})
lonesurvival:AddLabel('upclip bind'):AddKeyPicker('upclip', {
    Default = 'None',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'upclip',
    NoUI = false,
    Callback = function(first)
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") or nil
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.new(0, lsurv.baseclipsize, 0)
        end
    end
})
lonesurvival:AddDivider()
do
    local enable = false
    local speed = 5
    lonesurvival:AddToggle('flight', {Text = 'flight',Default = false,Callback = function(first)
        enable = first
    end}):AddKeyPicker('flight_key', {Default = 'nil',SyncToggleState = true,Mode = 'Toggle',Text = 'flight',NoUI = false,Callback = function(Value)end})
    lonesurvival:AddSlider('flightspeed', {Text = 'flight speed', Default = 5,Min = 0.1,Max = 10,Rounding = 1,Compact = true}):OnChanged(function(first)
        speed = first
    end)
    local userinput = game:GetService("UserInputService")
    local flycontrol = {
        space = false,
        shift = false,
        w = false,
        a = false,
        s = false,
        d = false,
    }

    userinput.InputBegan:Connect(function(input)
    	if input.KeyCode == Enum.KeyCode.W then
    		flycontrol.w = true
    	elseif input.KeyCode == Enum.KeyCode.A then
    		flycontrol.a = true
    	elseif input.KeyCode == Enum.KeyCode.S then
    		flycontrol.s = true
    	elseif input.KeyCode == Enum.KeyCode.D then
    		flycontrol.d = true
    	elseif input.KeyCode == Enum.KeyCode.Space then
    		flycontrol.space = true
    	elseif input.KeyCode == Enum.KeyCode.LeftShift then
    		flycontrol.shift = true
    	end
    end)
    userinput.InputEnded:Connect(function(input)
    	if input.KeyCode == Enum.KeyCode.W then
    		flycontrol.w = false
    	elseif input.KeyCode == Enum.KeyCode.A then
    		flycontrol.a = false
    	elseif input.KeyCode == Enum.KeyCode.S then
    		flycontrol.s = false
    	elseif input.KeyCode == Enum.KeyCode.D then
    		flycontrol.d = false
    	elseif input.KeyCode == Enum.KeyCode.Space then
    		flycontrol.space = false
    	elseif input.KeyCode == Enum.KeyCode.LeftShift then
    		flycontrol.shift = false
    	end
    end)
    RunService.Heartbeat:Connect(function(delta) -- physics
        if enable and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local s = speed
            local fc = flycontrol
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local cf = hrp.CFrame
            hrp.CFrame = cf * CFrame.new( (fc.d and s*delta*10 or 0) - (fc.a and s*delta*10 or 0), (fc.space and s*delta*10 or 0) - (fc.shift and s*delta*10 or 0), (fc.s and s*delta*10 or 0) - (fc.w and s*delta*10 or 0) )
            cf = cf * CFrame.new( (fc.d and s*delta*10 or 0) - (fc.a and s*delta*10 or 0), (fc.space and s*delta*10 or 0) - (fc.shift and s*delta*10 or 0), (fc.s and s*delta*10 or 0) - (fc.w and s*delta*10 or 0) )
            wrap(function()for _, v in pairs(plr.Character:GetDescendants()) do
                if v.IsA(v, "BasePart") then
                    v.Velocity, v.RotVelocity = Vector3.new(0, 0.1, 0), Vector3.new(0, 0, 0)
                end
            end end)
        end
    end)
end
local Target
local CircleInline = Drawing.new("Circle")
local CircleOutline = Drawing.new("Circle")
CircleInline.Transparency = 1
CircleInline.Thickness = 1
CircleInline.ZIndex = 2
CircleOutline.Thickness = 3
CircleOutline.Color = Color3.new()
CircleOutline.ZIndex = 1
RunService.RenderStepped:Connect(function()
    CircleOutline.Position = Vector2.new(mouse.X, mouse.Y + 36)
    CircleInline.Position = Vector2.new(mouse.X, mouse.Y + 36)
    CircleInline.Radius = lsurv.aimfov
    CircleInline.Color = lsurv.fovcolor
    CircleInline.Visible = lsurv.drawfov
    CircleOutline.Radius = lsurv.aimfov
    CircleOutline.Visible = (lsurv.drawfov and lsurv.fovoutline)
    Target = GetClosest()
end)

local ExpectedArguments = {
    Raycast = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Vector3", "Vector3", "RaycastParams"
        }
    }
}
local function getDirection(Origin, Position)
    return (Position - Origin).Unit * (Origin - Position).Magnitude
end
local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]
    if lsurv.silentaim and self == workspace and not checkcaller() and Method == "Raycast" then
        if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
            local A_Origin = Arguments[2]
            
            local HitPart = Target
            
            if HitPart then
                Arguments[3] = getDirection(A_Origin, HitPart.Position)
                if lsurv.wallnigger then
                    local raycastParams = Arguments[4]
                    local FilterDescendantsInstances = {HitPart.Parent}
                    local FilterType = Enum.RaycastFilterType.Whitelist
                    local CollisionGroup = raycastParams.CollisionGroup
                    Arguments[4] = RaycastParams.new(
                        {
                            FilterDescendantsInstances = FilterDescendantsInstances,
                            FilterType = FilterType,
                            IgnoreWater = true,
                            CollisionGroup = CollisionGroup
                        }
                    )
                end
                return oldNamecall(unpack(Arguments))
            end
        end
    end
    return oldNamecall(...)
end))