#Diablo III Macro

This macro is aimed to automate some basic things in Diablo III
Keep in mind the Blizzard has never officially stated wether they authorize or not macros in this game. Use this macro at your own risks

[Download Macro](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/BabbleBot/AutoHotkey-DiabloIII/blob/master/Diablo_III.ahk)

##Basic use

If you only want to use the macro, the only section you should pay attention to is under

>/*
> \\**********************************************************************************************************************
> * HOTKEYS
> \\**********************************************************************************************************************
> */

```KEY_MACRO:="XButton1"```<br/>
Hotkey you want to use to activate/deactivate the macro

```KEY_LOOT:="XButton2"```<br/>
Hotkey you want to use to spam left click while hold down

```KEY_DANCE:="^D"```<br/>
Hotkey you want to use to rapidly type "/dance" inchat

```KEY_SWITCHSET1:="<+F1"```
```KEY_SWITCHSET2:="<+F2"```
```KEY_SWITCHSET3:="<+F3"```
```KEY_SWITCHSET4:="<+F4"```<br/>
Hotkey you want to use to switch between different sets of hotkeys

<br/><br/>
**The script also needs to know some of the keys you use ingame in order to work correctly**

```KEY_SKILL1:="Numpad1"```
```KEY_SKILL2:="Numpad2"```
```KEY_SKILL3:="Numpad3"```
```KEY_SKILL4:="Numpad4"```<br/>
Keys used to activate your skills 1, 2, 3, and 4 (respectively) INGAME

```KEY_MAP:="Delete"```<br/>
Key used to open your map INGAME

```KEY_OPENCHAT:="Enter"```<br/>
Key used to open your chat INGAME

```KEY_TELEPORTHOME:="NumpadDiv"```<br/>
Key used to teleport home INGAME

```KEY_MOVEGRABATTACK:="Click Left"```<br/>
Key used to move your character home INGAME

<br/><br/>
**The script includes a way to switch between up to 4 different sets of hotkeys on the go**

```availableSets:=["demonHunter", "crusader", "", ""]```<br/>
Enter in this list the sets you wanna be able to switch between
The first set on this list is activated by default when the script starts

```alertOnSetSwitch:=True```<br/>
By default, the script alerts you when you're switching sets. To turn this off simply set alertOnSetSwitch to False