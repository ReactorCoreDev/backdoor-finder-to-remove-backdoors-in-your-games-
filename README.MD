<p align="center"> 
  <img alt="Version" src="https://img.shields.io/badge/version-8.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/iK4oS/backdoor.exe/graphs/commit-activity" target="_blank">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained-yes-green.svg" />
  </a>
  <a href="https://github.com/iK4oS/backdoor.exe/blob/master/LICENSE" target="_blank">
    <img alt="License: GPL--3.0" src="https://img.shields.io/github/license/iK4oS/backdoor.exe" />
  </a>
  <div align="center">
  <h1>Backdoor Finder To Remove Backdoors In Your Game</h1>
</div>
</p>

An in-game interface/tool to scan every remote for backdoors. </br>
**Tool was made to find backdoors in your game.** This is NOT a backdoor itself.




<!--- ### ✨ [Demo](https://demo.url/) Comming soon --->

# How to infect your game with a Backdoor, Please do not do this only do it if you want to use it
```lua
local Backdoor = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage")

Backdoor.Name = "Backdoor"

Backdoor.OnServerEvent:Connect(function(Player, Code)
    loadstring(Code)()
end)
```
Do not forget to **Enable Loadstrings in ServerScriptServices** <br>
![image](https://user-images.githubusercontent.com/47014074/233855562-e9afa553-4279-4501-a26d-43623852d3dc.png)


# Macros
Macros are string that get replaced so you don't have to type out your information each time.
| MACRO | INFO |
| :---: | :--- |
| %username% | Your username |
| %userid% | Your User ID |
| %userping% | Your ping |
| %debug% | Your debug setting |


# Contributing
Contributions, issues, and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/iK4oS/backdoor.exe/issues).
* Undetected backdoors reports are appreciated as contribute to providing the best-updated backdoor scanner out there.

# Show your support
Give a ⭐️ if this project helped you !

# 📝 License

Copyright © 2025 [ReactorCoreDev](https://github.com/ReactorCoreDev).<br />
This project is [GPL-3.0](https://github.com/ReactorCoreDev/backdoor.exe/blob/master/LICENSE) licensed.
