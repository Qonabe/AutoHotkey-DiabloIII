#MaxThreadsPerHotkey 2
#SingleInstance
#Persistent

/*
 **********************************************************************************************************************
 * HOTKEYS
 **********************************************************************************************************************
 */
KEY_MACRO:="XButton1"
KEY_LOOT:="XButton2"
KEY_DANCE:="^D"
KEY_SWITCHSET1:="<+F1"
KEY_SWITCHSET2:="<+F2"
KEY_SWITCHSET3:="<+F3"
KEY_SWITCHSET4:="<+F4"

KEY_SKILL1:="Numpad1"
KEY_SKILL2:="Numpad2"
KEY_SKILL3:="Numpad3"
KEY_SKILL4:="Numpad4"
KEY_MAP:="Delete"
KEY_OPENCHAT:="Enter"
KEY_TELEPORTHOME:="NumpadDiv"
KEY_MOVEGRABATTACK:="Click Left"

/*
 * Available sets
 * The Hotkey KEY_SWITCHSET1 will activate the first set in the list, and so on...
 * The first set is activated by default when the script starts
 * Possible sets are:
 *  - demonHunter: spam skills 1,2,3 and execute once skill 4 and Lshift+LClick
 *  - crusader: spam skill 4
 */
availableSets:=["demonHunter", "crusader", "", ""]

/*
 * Should the macro alert you when you're switching sets? Some may like, some may not, in any case you can change it here
 */
alertOnSetSwitch:=True

/*
 **********************************************************************************************************************
 * LOGIC
 **********************************************************************************************************************
 */
global active:=False
global activeSet:=availableSets[1]

#if (WinActive("Diablo III"))
#if (!WinActive("Diablo III"))
#if (WinActive("Diablo III")) && (activeSet="demonHunter")
#if (WinActive("Diablo III")) && (activeSet="crusader")

; Following hotkeys are only active if Diablo III window is in foreground
Hotkey, if, (WinActive("Diablo III"))
  ; Set-switching macros
  Hotkey, $%KEY_SWITCHSET1%, LABEL_SWITCH_SET1
  Hotkey, $%KEY_SWITCHSET2%, LABEL_SWITCH_SET2
  Hotkey, $%KEY_SWITCHSET3%, LABEL_SWITCH_SET3
  Hotkey, $%KEY_SWITCHSET4%, LABEL_SWITCH_SET4

  ; Looting macro, spam Left Click
  Hotkey, $%KEY_LOOT%, LABEL_MACRO_LOOTING

  ; Interrupt loop when "Open chat" key is pressed
  Hotkey, $%KEY_OPENCHAT%, LABEL_MACRO_CHAT

  ; Interrupt loop when "Return to town" key is pressed
  Hotkey, $%KEY_TELEPORTHOME%, LABEL_MACRO_TELEPORT

  ; Interrupt loop when opening map while maintaining shift key pressed
  Hotkey, $+%KEY_MAP%, LABEL_MACRO_MAP

  ; Dance!
  Hotkey, $%KEY_DANCE%, LABEL_MACRO_DANCE

; Following hotkeys are only active if Diablo III window is in foreground AND currently active set if demonHunter
Hotkey, if, (WinActive("Diablo III")) && (activeSet="demonHunter")
  ; DH Strafe+impale build
  Hotkey, $%KEY_MACRO%, LABEL_MACRO_DH

; Following hotkeys are only active if Diablo III window is in foreground AND currently active set if crusader
Hotkey, if, (WinActive("Diablo III")) && (activeSet="crusader")
  ; Crusader
  Hotkey, $%KEY_MACRO%, LABEL_MACRO_CR

; Automatic disactivation of the macro when the Diablo III window looses focus
Hotkey, if, (!WinActive("Diablo III"))
  active:=False
Hotkey, if

Return

LABEL_SWITCH_SET1:
  if availableSets[1] {
    active := False
    activeSet := availableSets[1]
    if alertOnSetSwitch
      MsgBox % "Switched to " activeSet " set"
  }
  else
    MsgBox % "No set registered at this hotkey"
Return

LABEL_SWITCH_SET2:
  if availableSets[2] {
    active := False
    activeSet := availableSets[2]
    if alertOnSetSwitch
      MsgBox % "Switched to " activeSet " set"
  }
  else
    MsgBox % "No set registered at this hotkey"
Return

LABEL_SWITCH_SET3:
  if availableSets[3] {
    active := False
    activeSet := availableSets[3]
    if alertOnSetSwitch
      MsgBox % "Switched to " activeSet " set"
  }
  else
    MsgBox % "No set registered at this hotkey"
Return

LABEL_SWITCH_SET4:
  if availableSets[4] {
    active := False
    activeSet := availableSets[4]
    if alertOnSetSwitch
      MsgBox % "Switched to " activeSet " set"
  }
  else
    MsgBox % "No set registered at this hotkey"
Return

LABEL_MACRO_DH:
  active:=!active

  /*
  * Execute first IMPALE and activate SHADOW POWER
  */
  If active {
    Send, +{%KEY_MOVEGRABATTACK%}
    Send, {%KEY_SKILL4%}
  }

  /*
  * Endlessly activate the first 3 skills
  */
  While active and WinActive("Diablo III"){
    if active {
      Send, {%KEY_SKILL1%}
    }
    if active {
      Send, {%KEY_SKILL2%}
    }
    if active {
      Send, {%KEY_SKILL3%}
    }
    Sleep 200
  }

  /*
    * Ensure 'active' parameter is set to false when exiting the loop
    * Use case is when exiting the loop due to alt-tabbing out of D3 window
    */
  active:=False
Return

LABEL_MACRO_CR:
  active:=!active

  /*
  * Endlessly activate the first 4th skill
  */
  While active and WinActive("Diablo III"){
    Send, {%KEY_SKILL4%}
    Sleep 200
  }

  /*
    * Ensure 'active' parameter is set to false when exiting the loop
    * Use case is when exiting the loop due to alt-tabbing out of D3 window
    */
  active:=False
Return

LABEL_MACRO_LOOTING:
  While GetKeyState(KEY_LOOT, "P"){
    Send, {%KEY_MOVEGRABATTACK%}
    Sleep 10  ;  milliseconds
  }
return

LABEL_MACRO_CHAT:
  active:=False

  Send, {%KEY_OPENCHAT%}
Return

LABEL_MACRO_TELEPORT:
  active:=False

  Send, {%KEY_TELEPORTHOME%}
Return

LABEL_MACRO_MAP:
  active:=False

  Send, +{%KEY_MAP%}
Return

LABEL_MACRO_DANCE:
  active:=False

  Send, {%KEY_OPENCHAT%}
  Send {/}dance
  Send, {%KEY_OPENCHAT%}
Return