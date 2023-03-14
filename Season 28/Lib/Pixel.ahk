Pixel_getColor(x, y){
  PixelGetColor, colorCheck, x, y

  return colorCheck
}

Pixel_ColorPicker(x, y){
  color := Pixel_GetColor(x, y)
  MouseMove, x, y
  tooltip % color
}

Pixel_checkColor(x, y, colorHex){
  return colorHex = Pixel_getColor(x, y)
}

Pixel_getColorVariationAt(x, y, colorToCompareTo){
  PixelGetColor, colorAtPos, x, y

  r := abs(((colorAtPos&0xFF0000)>>16) - ((colorToCompareTo&0xFF0000)>>16))
  g := abs(((colorAtPos&0xFF00)>>8) - ((colorToCompareTo&0xFF00)>>8))
  b := abs((colorAtPos&0xFF) - (colorToCompareTo&0xFF))

  return [r, g, b]
}

Pixel_checkColorVariationAt(x, y, colorHex, variation:=0){
  PixelSearch, xPos, yPos, x, y, x, y, colorHex, variation

  return (xPos or yPos )
}