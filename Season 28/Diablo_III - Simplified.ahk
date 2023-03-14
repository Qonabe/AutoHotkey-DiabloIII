#MaxThreadsPerHotkey 3
#SingleInstance
#Persistent

/*
 **********************************************************************************************************************
 * TODO
 Only Activate macro when Right Click is pushed
 Display marker when macro is active
 Finish Blacksmith macro
 Finetune Urshi macro
 Prevent macro activation if the chat is open
  fix strange prob preventing automatically reopening the chat after auto close
 **********************************************************************************************************************
 */


/*
 **********************************************************************************************************************
 * HOTKEYS
 **********************************************************************************************************************
 */
KEY_MACRO:="XButton1"
KEY_LOOT:="XButton2"
KEY_DANCE:="^D"

KEY_SKILL1:="Numpad1"
KEY_SKILL2:="Numpad2"
KEY_SKILL3:="Numpad3"
KEY_SKILL4:="Numpad4"
KEY_POTION:="Numpad5"
KEY_MAP:="Delete"
KEY_OPENCHAT:="Enter"
KEY_TELEPORTHOME:="NumpadDiv"


/*
 **********************************************************************************************************************
 * LIB
 **********************************************************************************************************************
 */

checkPixelColor(x, y, colorHex, display:=False){
  PixelGetColor, colorCheck, x, y

  if display
    tooltip %colorCheck%

  return colorCheck = colorHex
}

/*
 **********************************************************************************************************************
 * LOGIC
 **********************************************************************************************************************
 */
global active:=False
global holdRClick:=False

#if (WinActive("Diablo III"))
#if (!WinActive("Diablo III"))

; Following hotkeys are only active if Diablo III window is in foreground
Hotkey, if, (WinActive("Diablo III"))
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

  ; Relax fingers, and keyboard, and go braindead
  Hotkey, $%KEY_MACRO%, LABEL_MACRO_DH

  ; Automatic disactivation of the macro when the Diablo III window looses focus
  Hotkey, if, (!WinActive("Diablo III"))
    active:=False
  Hotkey, if
Return

LABEL_MACRO_RIGHT_CLICK:
    Send, {RButton}
  While GetKeyState(RButton, "P"){
    if active
      Send, {LButton}
  }
Return

LABEL_MACRO_LOOTING:
  active:=false
  While GetKeyState(KEY_LOOT, "P"){
    Send, {LButton}
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

LABEL_MACRO_DH:
  active:=!active

  if active {
    setTimer, autoMacrodisabler, 200, 0

    setTimer, LABEL_MACRO_SKILL_1, 200, 0
    setTimer, LABEL_MACRO_SKILL_2, 200, 0
    setTimer, LABEL_MACRO_SKILL_3, 200, 0
    setTimer, LABEL_MACRO_SKILL_4, 1500, 0
    setTimer, LABEL_MACRO_SKILL_LEFT_CLICK, 2000, 10
    setTimer, LABEL_MACRO_SKILL_RIGHT_CLICK, Off, 0
    setTimer, LABEL_MACRO_SKILL_POTION, 1000, 1
  }
Return

autoMacrodisabler() {
  if !active
    setTimer, , Off
  else{
    if checkPixelColor(46, 1015, 0x2662A1){
      active:=False
      Send, {Escape}
    }
  }
}

LABEL_MACRO_SKILL_1:
  if !active
    setTimer, , Off
  else
    Send, {%KEY_SKILL1%}
Return

LABEL_MACRO_SKILL_2:
  if !active
    setTimer, , Off
  else
    Send, {%KEY_SKILL2%}
Return

LABEL_MACRO_SKILL_3:
  if !active
    setTimer, , Off
  else
    Send, {%KEY_SKILL3%}
Return

LABEL_MACRO_SKILL_4:
  if !active
    setTimer, , Off
  else
    Send, {%KEY_SKILL4%}
Return

LABEL_MACRO_SKILL_LEFT_CLICK:
  if !active
    setTimer, , Off
  else
    Send, +{LButton}
Return

LABEL_MACRO_SKILL_RIGHT_CLICK:
  if !active
    setTimer, , Off
  else
    Send, {RButton}
Return

LABEL_MACRO_SKILL_POTION:
  if !active
    setTimer, , Off
  else
    Send, {%KEY_POTION%}
Return