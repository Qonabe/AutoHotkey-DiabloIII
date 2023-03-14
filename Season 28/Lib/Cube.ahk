Cube_CheckIfOpen(x1, y1, x2, y2){
  ; file := "img/Header_Cube.png"

	; ;Gui, New
	; Gui, -Caption -Border +LastFound +AlwaysOnTop +ToolWindow
	; Gui, Add, Picture,, %file%
  ; WinSet, TransColor, F0F0F0
	; Gui, Show, x181 y21

  CoordMode, Pixel
  ImageSearch, OutputX, OutputY, 0, 0, A_ScreenWidth, A_ScreenHeight, img/Header_Cube.png *250
  tooltip %OutputX%:%OutputY%

  return (OutputX or OutputY )
}