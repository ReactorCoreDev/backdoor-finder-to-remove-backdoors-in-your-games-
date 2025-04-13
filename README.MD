<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Backdoor.exe</title>
</head>
<body>
  <h2 align="center">
    <a href="https://github.com/ReactorCoreDev/backdoor.exe">
      <img src="logo_outlined.png" width="700" alt="logo">
    </a>
  </h2>

  <p align="center">
    <img alt="Version" src="https://img.shields.io/badge/version-8.0.0-blue.svg?cacheSeconds=2592000" />
    <a href="https://github.com/ReactorCoreDev/backdoor.exe/graphs/commit-activity" target="_blank">
      <img alt="Maintenance" src="https://img.shields.io/badge/Maintained-yes-green.svg" />
    </a>
    <a href="https://github.com/ReactorCoreDev/backdoor.exe/blob/master/LICENSE" target="_blank">
      <img alt="License: GPL-3.0" src="https://img.shields.io/github/license/ReactorCoreDev/backdoor.exe" />
    </a>
  </p>

  <p align="center">
    An in-game interface/tool to scan every remote for backdoors. <br>
    <strong>Tool was made to find backdoors in your game. This is NOT a backdoor itself.</strong>
  </p>

  <h3>Macros</h3>
  <p>Macros are strings that get replaced so you don't have to type out your information each time.</p>

  <table border="1" align="center">
    <tr>
      <th>MACRO</th>
      <th>INFO</th>
    </tr>
    <tr>
      <td>%username%</td>
      <td>Your username</td>
    </tr>
    <tr>
      <td>%userid%</td>
      <td>Your User ID</td>
    </tr>
    <tr>
      <td>%userping%</td>
      <td>Your ping</td>
    </tr>
    <tr>
      <td>%debug%</td>
      <td>Your debug setting</td>
    </tr>
  </table>

  <h3>Contributing</h3>
  <p>Contributions, issues, and feature requests are welcome!<br>
  Feel free to check the <a href="https://github.com/ReactorCoreDev/backdoor.exe/issues">issues page</a>.<br>
  * Undetected backdoor reports are appreciated, as they help keep the scanner up-to-date.</p>

  <h3>Show your support</h3>
  <p>Give a ⭐️ if this project helped you!</p>

  <h3>📝 License</h3>
  <p>Copyright © 2025 <a href="https://github.com/ReactorCoreDev">ReactorCoreDev</a>.<br>
  This project is <a href="https://github.com/ReactorCoreDev/backdoor.exe/blob/master/LICENSE">GPL-3.0</a> licensed.</p>

</body>
</html>
  <h4>Example macro usage</h4>

  ```lua
    print(%username%)
  ```

  <h3>How to run the script</h3>
  <p>To use the backdoor scanner, run the following code:</p>
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ReactorCoreDev/backdoor.exe/refs/heads/v8/src/main.lua"))()
  ```
