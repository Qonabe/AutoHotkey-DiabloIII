# Diablo III Macro

This macro is aimed to automate some basic things in Diablo III
Keep in mind the Blizzard has never officially stated wether they authorize or not macros in this game. Use this macro at your own risks

[Download Macro](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/BabbleBot/AutoHotkey-DiabloIII/blob/master/Diablo_III.ahk)

## Basic use

### Configuration

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
Hotkeys you want to use to switch between different sets of hotkeys

```MACRO_REQUIRES_RMB := True```
Set to __False__ if you want the script to spam the skills when it's active, regardless of weither or not the right mouse button is pressed, otherwise set to __True__ and the skill will spam the skills ONLY when it's active AND  you are pressing the right mouse button


### The script also needs to know some of the keys you use ingame to be able to work correctly

```KEY_SKILL1:="Numpad1"```
```KEY_SKILL2:="Numpad2"```
```KEY_SKILL3:="Numpad3"```
```KEY_SKILL4:="Numpad4"```<br/>
Keys used to activate your skills 1, 2, 3, and 4 (respectively)

```KEY_POTION:="Numpad5"```<br/>
Key used to consume your potion

```KEY_MAP:="Delete"```<br/>
Key used to open your map

```KEY_OPENCHAT:="Enter"```<br/>
Key used to open your chat

```KEY_TELEPORTHOME:="NumpadDiv"```<br/>
Key used to teleport home


### The script includes a way to switch between up to 4 different sets of hotkeys on the go

```availableSets:=["demonHunter", "crusader", "", ""]```<br/>
Enter in this list the sets you wanna be able to switch between
The first set on this list is activated by default when the script starts

```alertOnSetSwitch:=True```<br/>
By default, the script alerts you when you're switching sets. To turn this off simply set alertOnSetSwitch to False


## TODO
~~Add "Only Activate macro when Right Click is pushed" option~~
Add Gui:
  - Display marker when macro is active
  - Display the name of the currently active set
~~  Finish Blacksmith macro ~~
~~Finetune Urshi macro~~
~~Prevent macro activation if the chat is open~~
~~Fix strange prob preventing automatically reopening the chat after auto close~~
Add autodetection of cube page / backsmith / Urshi and put their resoective macro under the same key press
Add customization for shift or non-shift mouse key macros
Add different sets and a way to switch between them