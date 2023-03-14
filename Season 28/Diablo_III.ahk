#MaxThreadsPerHotkey 3
#SingleInstance
#Persistent

/*
 **********************************************************************************************************************
 * TODO
; Add "Only Activate macro when Right Click is pushed" option
 Display marker when macro is active
;  Finish Blacksmith macro
;  Finetune Urshi macro
; Prevent macro activation if the chat is open
;  fix strange prob preventing automatically reopening the chat after auto close
 See "Suspend"
 Add autodetection of cube page / backsmith / Urshi and put under same key press
 **********************************************************************************************************************
 */


/*
 **********************************************************************************************************************
 * CONFIG
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
KEY_POTION:="Numpad5"
KEY_SALVAGE:="+NumpadMult"
KEY_URSHI:="+NumpadDiv"
KEY_CUBE_2:="+F2"
KEY_CUBE_3:="+F3"
KEY_MAP:="Delete"
KEY_OPENCHAT:="Enter"
KEY_TELEPORTHOME:="NumpadDiv"

; The period at which the different skills will be repeated in milliseconds
PERIOD_SKILL_1 := 200
PERIOD_SKILL_2 := 200
PERIOD_SKILL_3 := 200
PERIOD_SKILL_4 := 7000
PERIOD_POTION := 7000
PERIOD_LEFT_CLICK := 7000

; Do you want the macro to be constantly runing when it is active or to require pressing the right mouse button ?
MACRO_REQUIRES_RMB := False

; Do you want the macro to be active from the start?
MACRO_START_ACTIVATED := False

; Do you want the macro to hold the right mouse button down?
MACRO_KEEPS_RCLICK_DOWN := True


/*
 **********************************************************************************************************************
 * GUI
 **********************************************************************************************************************
 */

; d = 10 ;Diameter

; Gui, 1:New, +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow +E0x20 +HwndDot
; WinSet, Transparent, 255
; Gui, 1:Color, Red ;Color
; Gui, 1:Show,% "w"d " h"d " x" (A_ScreenWidth-d)//2 " y" (A_ScreenHeight-d)//2 " NoActivate"
; WinSet, Region, 0-0 W%d% H%d% E ;turns the square into a circle
; WinHide, ahk_id %Dot%

; Return

/*
 **********************************************************************************************************************
 * LOGIC
 **********************************************************************************************************************
 */
global active := MACRO_START_ACTIVATED

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

  ; Interrupt loop when Escape key is pressed
  Hotkey, $Escape, LABEL_MACRO_ESCAPE

  ; Interrupt loop when opening map
  Hotkey, $%KEY_MAP%, LABEL_MACRO_MAP
  Hotkey, $+%KEY_MAP%, LABEL_MACRO_MAP_SHIFT

  ; Dance!
  Hotkey, $%KEY_DANCE%, LABEL_MACRO_DANCE

  ; Salvage made easier
  Hotkey, $%KEY_SALVAGE%, LABEL_MACRO_BLACKSMITH

  ; Yeah yeah, upgrade my gems and shut up
  Hotkey, $%KEY_URSHI%, LABEL_MACRO_URSHI

  ; Cubing made easier
  Hotkey, $%KEY_CUBE_2%, LABEL_MACRO_CUBE_2
  Hotkey, $%KEY_CUBE_3%, LABEL_MACRO_CUBE_3

  ; Relax fingers, and keyboard, and go braindead
  Hotkey, $%KEY_MACRO%, LABEL_MACRO

  ; Hotkey, k, LABEL_TEST

  ; Automatic disactivation of the macro when the Diablo III window looses focus
  Hotkey, if, (!WinActive("Diablo III"))
    active:=False
  Hotkey, if
Return

LABEL_TEST:
  ; tooltip Test started

  ; CUBE_HEADER_X1 := 181
  ; CUBE_HEADER_Y1 := 21
  ; CUBE_HEADER_X2 := 231
  ; CUBE_HEADER_Y2 := 147

  ; Cube_CheckIfOpen(0, 0, 1000, 1000)

  ; tooltip Test ended
Return

LABEL_MACRO_LOOTING:
  active:=false
  While GetKeyState(KEY_LOOT, "P"){
    Send, {LButton}
    Sleep 10
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

LABEL_MACRO_ESCAPE:
  active:=False

  Send, {Escape}
Return

LABEL_MACRO_MAP:
  active:=False

  Send, {%KEY_MAP%}
Return

LABEL_MACRO_MAP_SHIFT:
  active:=False

  Send, +{%KEY_MAP%}
Return

LABEL_MACRO_DANCE:
  active:=False

  Send, {%KEY_OPENCHAT%}
  Send {/}dance
  Send, {%KEY_OPENCHAT%}
Return

LABEL_MACRO_BLACKSMITH:
  active:=False

  ; Auto repair
    ; Check if "Repair" tab is present
    if Pixel_checkColor(508, 613, 0x577B94){
      ; Click on "Repair" tab
      Send {Click 508 613}

      ; Click on "All Items"
      if Pixel_checkColor(374, 597, 0x0A0D24){
        Send {Click 374 597}
      }
    }

  ; Auto Salvage
    ; Check if "Salvage" tab is present
    if Pixel_checkColor(502, 481, 0x109CE5){
      ; Click on "Salvage" tab
      Send {Click 502 481}

      ; Click on "Salvage all Grey"
      if Pixel_checkColor(252, 280, 0x343434){
        Send {Click 252 280}
        Send, {Enter}
      }

      ; Click on "Salvage all Blue"
      if Pixel_checkColor(320, 280, 0x3E1F0A){
        Send {Click 319 280}
        Send, {Enter}
      }

      ; Click on "Salvage all Yellow"
      if Pixel_checkColor(385, 280, 0x082D39){
        Send {Click 385 280}
        Send, {Enter}
      }

      ; Click on "Salvage" and move the mouse to the first item in the inventory
      Send {Click 166 292}
      MouseMove, 1427, 584
    }
Return

LABEL_MACRO_URSHI:
  upgradeTime := 1650

  Send {Click}

  while Pixel_checkColor(244, 184, 0xFFFFFF) {
    Send {Click 342 549}
    Sleep % upgradeTime
  }

  Send {Click 1115 1027}

  i := 3
  while i-- {
    Send {Click 340 547}
    Sleep % upgradeTime
  }
Return

LABEL_MACRO_CUBE_2:
  Send {Click 1425 580 Right}
  Send {Click 720 839}
  Send {Click 240 830}
  Send {Click 585 839}
  Send {Click 850 839}
  MouseMove, 1429, 581
Return

LABEL_MACRO_CUBE_3:
  slotsList := Inventory_getFilledSlotList()

  Loop, % slotsList.Length(){
    Send % "{Click " . slotsList[A_Index][1] . " " . slotsList[A_Index][2] . " Right}"
    Send {Click 720 839}
    Send {Click 240 830}
    Send {Click 585 839}
    Send {Click 850 839}
  }
Return

LABEL_MACRO:
  active:=!active

  if active {
    setTimer, autoMacrodisabler, 1, 0

    setTimer, LABEL_MACRO_SKILL_1, %PERIOD_SKILL_1%
    setTimer, LABEL_MACRO_SKILL_2, %PERIOD_SKILL_2%
    setTimer, LABEL_MACRO_SKILL_3, %PERIOD_SKILL_3%

    sleep 50
    setTimer, LABEL_MACRO_SKILL_4, 7000

    sleep 50
    setTimer, LABEL_MACRO_SKILL_POTION, 1000, 1

    sleep 50
    setTimer, LABEL_MACRO_SKILL_LEFT_CLICK, 2000, 10

    if MACRO_KEEPS_RCLICK_DOWN
      setTimer, LABEL_MACRO_SKILL_RIGHT_CLICK, 200
  }
Return

autoMacrodisabler() {
  if !active
    setTimer, , Off
  else{
    if Pixel_checkColor(46, 1015, 0x2662A1){
      active:=False
      ; Send, {Escape}
    }
  }
}

LABEL_MACRO_SKILL_1:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, {%KEY_SKILL1%}
Return

LABEL_MACRO_SKILL_2:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, {%KEY_SKILL2%}
Return

LABEL_MACRO_SKILL_3:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, {%KEY_SKILL3%}
Return

LABEL_MACRO_SKILL_4:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, {%KEY_SKILL4%}
Return

LABEL_MACRO_SKILL_LEFT_CLICK:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, +{LButton}
Return

LABEL_MACRO_SKILL_POTION:
  if !active
    setTimer, , Off
  else
    if !MACRO_REQUIRES_RMB or GetKeyState("RButton")
      Send, {%KEY_POTION%}
Return

LABEL_MACRO_SKILL_RIGHT_CLICK:
  if !active {
    Click, Right Up
    setTimer, , Off
  }
  else
    Click, Right Down
Return