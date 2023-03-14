  file := "img/Header_Cube.png"

	;Gui, New
	Gui, -Caption -Border +LastFound +AlwaysOnTop +ToolWindow
	Gui, Add, Picture,, %file%
  WinSet, TransColor, F0F0F0
	Gui, Show, x100 y100