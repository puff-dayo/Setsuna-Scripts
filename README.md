# Setsuna-Scripts
A personal collection of scripts for automation tasks.

<br><br>

**> BatteryModeAutoShutdown.ps1**

Monitors the power status of the system and automatically shuts it down if it remains on battery power for a specified duration, also provides options for logging events to a file or displaying them on-screen, and can execute user-defined scripts when mode switched and before shutdown.

<br>

**> BatteryBeepAndTTSWarning.ps1**

Plays beeps and uses Windows built-in TTS to warn that the power mode has switched to battery.

<br>

**> ImportFlypy.ps1**

Import Flypy Shuangpin into Microsoft Input Method.

<br><br>

## Tested Environment

```
PS C:\Windows\system32> $PSVersionTable.PSVersion                                                                       
Major  Minor  Build  Revision
-----  -----  -----  --------
5      1      22000  2003

PS C:\Windows\system32> Get-ComputerInfo | Select-Object OsName, OsVersion, OsArchitecture

OsName          OsVersion  OsArchitecture
------          ---------  --------------
Windows 11 Home 10.0.22000 64-bit
```
