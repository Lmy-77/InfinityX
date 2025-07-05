-- start
print[[                                                                     
 /$$$$$$            /$$$$$$  /$$           /$$   /$$               /$$   /$$
|_  $$_/           /$$__  $$|__/          |__/  | $$              | $$  / $$
  | $$   /$$$$$$$ | $$  \__/ /$$ /$$$$$$$  /$$ /$$$$$$   /$$   /$$|  $$/ $$/
  | $$  | $$__  $$| $$$$    | $$| $$__  $$| $$|_  $$_/  | $$  | $$ \  $$$$/ 
  | $$  | $$  \ $$| $$_/    | $$| $$  \ $$| $$  | $$    | $$  | $$  >$$  $$ 
  | $$  | $$  | $$| $$      | $$| $$  | $$| $$  | $$ /$$| $$  | $$ /$$/\  $$
 /$$$$$$| $$  | $$| $$      | $$| $$  | $$| $$  |  $$$$/|  $$$$$$$| $$  \ $$
|______/|__/  |__/|__/      |__/|__/  |__/|__/   \___/   \____  $$|__/  |__/
                                                         /$$  | $$          
                                                        |  $$$$$$/          
                                                         \______/           
]]
print("InfinityX Internal UI loaded successfully!")



-- add ui library / settings
local IDEModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/lib/ide.lua"))()
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
ReGui:DefineTheme("InfinityX", {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(120, 100, 120),
	Text = Color3.fromRGB(200, 180, 200),

	FrameBg = Color3.fromRGB(25, 20, 25),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(120, 100, 120),
	FrameBgTransparencyActive = 0.4,

	CheckMark = Color3.fromRGB(150, 100, 150),
	SliderGrab = Color3.fromRGB(150, 100, 150),
	ButtonsBg = Color3.fromRGB(150, 100, 150),
	CollapsingHeaderBg = Color3.fromRGB(150, 100, 150),
	CollapsingHeaderText = Color3.fromRGB(200, 180, 200),
	RadioButtonHoveredBg = Color3.fromRGB(150, 100, 150),

	WindowBg = Color3.fromRGB(35, 30, 35),
	TitleBarBg = Color3.fromRGB(35, 30, 35),
	TitleBarBgActive = Color3.fromRGB(50, 45, 50),

	TabTextPaddingTop = UDim.new(0, 3),
	TabTextPaddingBottom = UDim.new(0, 8),
	TabText = ReGui.Accent.Gray,
	TabBg = ReGui.Accent.Dark,
	ActiveTabText = ReGui.Accent.White,
	ActiveTabBg = ReGui.Accent.Light,
	TabsBarBg = Color3.fromRGB(36, 36, 36),
	TabsBarBgTransparency = 0,

	Border = Color3.fromRGB(50, 45, 50),
	ResizeGrab = Color3.fromRGB(50, 45, 50),
	RegionBgTransparency = 1,
})
local Window = ReGui:Window({
	Title = "InfintyX • Internal UI",
	Theme = "InfinityX",
	NoClose = true,
  NoResize = true,
  NoCollapse = true,
	Size = UDim2.new(0, 680, 0, 500),
}):Center()



-- Create tabs
local Group = Window:List({
	UiPadding = 1,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
})
local TabsBar = Group:List({
	Border = true,
	UiPadding = 8,
	BorderColor = Color3.fromRGB(158, 158, 158),
	BorderThickness = 1,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
	HorizontalAlignment = Enum.HorizontalAlignment.Center,
	AutomaticSize = Enum.AutomaticSize.None,
	FlexMode = Enum.UIFlexMode.None,
	Size = UDim2.new(0, 40, 1, 0),
	CornerRadius = UDim.new(0, 4)
})
local TabSelector = Group:TabSelector({
	NoTabsBar = true,
	Size = UDim2.fromScale(0.5, 1)
})

local function CreateTab(Name: string, Icon)
	local Tab = TabSelector:CreateTab({
		Name = Name
	})

	local List = Tab:List({
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		UiPadding = 5,
		Spacing = 10
	})

	local Button = TabsBar:Image({
		Image = Icon,
		Ratio = 1,
		RatioAxis = Enum.DominantAxis.Width,
		Size = UDim2.fromScale(1, 1),
		Callback = function(self)
			TabSelector:SetActiveTab(Tab)
		end,
	})

	ReGui:SetItemTooltip(Button, function(Canvas)
		Canvas:Label({
			Text = Name
		})
	end)

	return List
end

local function CreateRegion(Parent, Title)
	local Region = Parent:Region({
		Border = true,
		BorderColor = Window:GetThemeKey("Border"),
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 5)
	})

	Region:Label({
		Text = Title
	})

	return Region
end



-- source
local Executor = CreateTab("Executor", ReGui.Icons.Script)
local ExecutorSection = CreateRegion(Executor, "Code")
local IDE = IDEModule.CodeFrame.new({
  Editable = true,
  FontSize = 14,
  Colors = SyntaxColors,
  FontFace = TextFont,
  Border = true
})
ReGui:ApplyFlags({
	Object = IDE.Gui,
	WindowClass = Window,
	Class = {
		Parent = ExecutorSection:GetObject(),
		Fill = true,
		BackgroundTransparency = 1
	}
})
IDE:SetText([[
-- This script made by Lmy77
-- Script version: 1.0
-- This script is universal, so you can use it in any game
-- Thanks for using this script and heve fun!
]])
ExecutorSection:Separator()
local List = ExecutorSection:List()
List:Button({
	Text = "Execute",
	Callback = function()
		loadstring(IDE:GetText())()
	end
})
List:Button({
	Text = "Save file",
	Callback = function()
    local SaveFileModal = Window:PopupModal({
      Title = "Save File Settings",
      NoMove = true,
      AutoSize = "Y"
    })
    local sf = SaveFileModal:InputText({
      Label = "File name",
      Placeholder = '...',
    })
    local cf = SaveFileModal:InputText({
      Label = "File compact",
      Placeholder = '.lua',
    })
    SaveFileModal:Separator()
    local row = SaveFileModal:Row()
    row:Button({
      Text = "Save",
      Callback = function()
        local savedName = sf:GetValue() .. cf:GetValue()
        if not isfolder('InfinityX') then
          makefolder('InfinityX')
          makefolder('InfinityX/Key-System')
          makefolder('InfinityX/Game')
          makefolder('InfinityX/Settings')
          makefolder('InfinityX/Internal Ui')
          makefolder('InfinityX/Internal Ui/Saved Files')
        end
        if not isfile('InfinityX/Internal Ui/Saved Files/'..savedName) then
          writefile('InfinityX/Internal Ui/Saved Files/'..savedName, IDE:GetText())
          wait(.5)
          SaveFileModal:ClosePopup()
        elseif isfile('InfinityX/Internal Ui/Saved Files/'..savedName) then
          local WaringModal = Window:PopupModal({
            Title = "Waring",
            NoMove = true,
            AutoSize = "Y"
          })
          WaringModal:Label({
            Text = "File already exists, do you want to overwrite it?"
          })
          WaringModal:Separator()
          local rowW = WaringModal:Row()
          rowW:Button({
            Text = "Yes",
            Callback = function()
              writefile('InfinityX/Internal Ui/Saved Files/'..savedName, IDE:GetText())
              wait(.5)
              WaringModal:ClosePopup()
              wait(.2)
              SaveFileModal:ClosePopup()
            end,
          })
          for i = 1, 70 do
            rowW:Region()
          end
          rowW:Button({
            Text = "Close",
            Callback = function()
              WaringModal:ClosePopup()
            end,
          })
        end
      end,
    })
    for i = 1, 68 do
      row:Region()
    end
    row:Button({
      Text = "Close",
      Callback = function()
        SaveFileModal:ClosePopup()
      end,
    })
	end
})
List:Button({
	Text = "Load file",
	Callback = function()
    local LoadFileModal = Window:PopupModal({
      Title = "Load File Settings",
      NoMove = true,
      AutoSize = "Y"
    })
    function GetFiles()
      local files = {}
      if isfolder('InfinityX/Internal Ui/Saved Files') then
        for _, file in pairs(listfiles('InfinityX/Internal Ui/Saved Files')) do
          table.insert(files, file:match("([^/]+)$"))
        end
      end
      return files
    end
    local fd = LoadFileModal:Combo({
      Label = "Select file",
      Items = GetFiles(),
      Selected = '...',
      Callback = function(self, Value)
        selectedFile = Value
      end
    })
    LoadFileModal:Separator()
    local rowL = LoadFileModal:Row()
    rowL:Button({
      Text = "Load",
      Callback = function()
        IDE:SetText(readfile(selectedFile))
        wait(.5)
        LoadFileModal:ClosePopup()
      end,
    })
    rowL:Button({
      Text = "Delete file",
      Callback = function()
        delfile(selectedFile)
        wait(.5)
        LoadFileModal:ClosePopup()
      end,
    })
    for i = 1, 46 do
      rowL:Region()
    end
    rowL:Button({
      Text = "Close",
      Callback = function()
        LoadFileModal:ClosePopup()
      end,
    })
	end
})
for i = 1, 63 do
  List:Region()
end
List:Button({
	Text = "Settings",
	Callback = function()
    local EditorModal = Window:PopupModal({
      Title = "Editor Settings",
      NoMove = true,
      NoCollapse = true,
      AutoSize = "Y"
    })
    EditorModal:Checkbox({
      Value = true,
      Label = "Editable",
      Callback = function(self, Value: boolean)
        EditableB = Value
        if EditableB then
          IDE.Editable = true
        else
          IDE.Editable = false
        end
      end
    })
    local fz = EditorModal:InputText({
      Label = "Font size",
      Value = '14',
      Placeholder = '14',
      Callback = function(self, Value: string)
        local size = tonumber(Value)
        if size and size > 0 then
          IDE.FontSize = size
        else
          warn("Invalid font size")
        end
      end
    })
    EditorModal:Separator()
    EditorModal:Button({
      Text = "Save Settings",
      Callback = function()
        EditorModal:ClosePopup()
      end,
    })
	end
})
List:Button({
	Text = "Clear",
	Callback = function()
    IDE:ClearText('')
	end
})


local Console = CreateTab("Console", ReGui.Icons.Server)
local ConsoleSection = CreateRegion(Console, "Console")
local c = ConsoleSection:Console({
  ReadOnly = true,
  AutoScroll = true,
  RichText = true,
  MaxLines = 50
})
coroutine.wrap(function()
  local TAG_COLOR = "rgb(0, 255, 0)"
  local DATA_COLOR = "rgb(192, 192, 192)"

  while true do task.wait()
    c:AppendText(
      '<font color="' .. TAG_COLOR .. '">[ Infinityx ] -</font>',
      '<font color="' .. DATA_COLOR .. '">' .. math.random() .. '</font>'
    )
  end
end)()
ConsoleSection:Separator()
local listC = ConsoleSection:List()
listC:Button({
	Text = "Execute script",
	Callback = function()
    local LoadFileModal = Window:PopupModal({
      Title = "Execute File Settings",
      NoMove = true,
      AutoSize = "Y"
    })
    function GetFiles()
      local files = {}
      if isfolder('InfinityX/Internal Ui/Saved Files') then
        for _, file in pairs(listfiles('InfinityX/Internal Ui/Saved Files')) do
          table.insert(files, file:match("([^/]+)$"))
        end
      end
      return files
    end
    LoadFileModal:Combo({
      Label = "Select file",
      Items = GetFiles(),
      Selected = '...',
      Callback = function(self, Value)
        selectedFile = Value
      end
    })
    LoadFileModal:Separator()
    local rowL = LoadFileModal:Row()
    rowL:Button({
      Text = "Execute",
      Callback = function()
        local sourceCode = readfile(selectedFile)
        loadstring(sourceCode)()
        wait(.5)
        LoadFileModal:ClosePopup()
      end,
    })
    rowL:Button({
      Text = "Delete file",
      Callback = function()
        delfile(selectedFile)
        wait(.5)
        LoadFileModal:ClosePopup()
      end,
    })
    for i = 1, 40 do
      rowL:Region()
    end
    rowL:Button({
      Text = "Close",
      Callback = function()
        LoadFileModal:ClosePopup()
      end,
    })
	end
})
listC:Button({
	Text = "Clear output",
	Callback = function()
		c:Clear()
	end
})


local Settings = CreateTab("Settings", ReGui.Icons.Settings)
local OptionsSection = CreateRegion(Settings, "Options")
local TeleportSection = CreateRegion(Settings, "Teleport Service")
local ScriptHubSection = CreateRegion(Settings, "Script Hub")
OptionsSection:Keybind({
	Label = "Show / Hide GUI",
	Value = Enum.KeyCode.Insert,
	Callback = function(_, NewKeybind)
		local IsVisible = Window.Visible
		Window:SetVisible(not IsVisible)
	end
})
OptionsSection:Checkbox({
	Value = true,
	Label = "Auto execute",
	Callback = function(self, Value: boolean)
    queueteleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
    AutoExecute = Value
    local TeleportCheck = false
    game.Players.LocalPlayer.OnTeleport:Connect(function(State)
      if AutoExecute (not TeleportCheck) and queueteleport then
        TeleportCheck = true
        queueteleport('loadstring(game:HttpGet("https://gitlab.com/Lmy77/menu/-/raw/main/infinityx"))()')
      end
    end)
	end
})
OptionsSection:Button({
	Text = "Unload Script",
	Callback = function()
		Window:Close()
	end
})
local pi = TeleportSection:InputText({
  Label = "Place id",
  Placeholder = '...',
})
TeleportSection:Button({
  Text = "Teleport to place",
  Callback = function()
    if pi:GetValue() ~= '' then
      local PlaceId = tonumber(pi:GetValue())
      if PlaceId then
        game:GetService("TeleportService"):Teleport(PlaceId, game.Players.LocalPlayer)
      else
        warn("Invalid Place Id")
      end
    else
      warn("Please enter a valid Place Id")
    end
  end
})
local gl = TeleportSection:Label({
  Text = "Game: nil",
  Bold = true
})
spawn(function()
  while true do task.wait()
    local placeI = pi:GetValue()
    local MarketplaceService = game:GetService("MarketplaceService")

    local success, result = pcall(function()
        return MarketplaceService:GetProductInfo(placeI, Enum.InfoType.Asset)
    end)

    if success and result then
      gl.Text = 'Game: ' .. result.Name
    else
      gl.Text = 'Game: nil'
    end
  end
end)
ScriptHubSection:Button({
	Text = "Dex Explorer",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/better-dex/refs/heads/main/dex.luau",true))()
	end
})
ScriptHubSection:Button({
	Text = "Infinite Yield",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})
ScriptHubSection:Button({
	Text = "Remote Spy",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))()
	end
})
ScriptHubSection:Button({
	Text = "Orca Hub",
	Callback = function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))()
  end
})
ScriptHubSection:Button({
	Text = "Sirius Hub",
	Callback = function()
    loadstring(game:HttpGet('https://sirius.menu/sirius'))()
	end
})
