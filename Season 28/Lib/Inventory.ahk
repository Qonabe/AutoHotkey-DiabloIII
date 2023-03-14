Inventory_ExecuteToEach() {
  ; invMatrix := [[1429,581], [1479,581], [1529,581], [1579,581], [1629,581], [1679,581], [1729,581], 1779[,581], [1829,581], [1879,581], [1429,632], [1479,632], [1529,632], [1579,632], [1629,632], [1679,632], [1729,632], 1779[,632], [1829,632], [1879,632],  [1429,682], [1479,682], [1529,682], [1579,682], [1629,682], [1679,682], [1729,682], 1779[,682], [1829,682], [1879,682],  [1429,732], [1479,732], [1529,732], [1579,732], [1629,732], [1679,732], [1729,732], 1779[,732], [1829,732], [1879,732],  [1429,782], [1479,782], [1529,782], [1579,782], [1629,782], [1679,782], [1729,782], 1779[,782], [1829,782], [1879,782],  [1429,832], [1479,832], [1529,832], [1579,832], [1629,832], [1679,832], [1729,832], 1779[,832], [1829,832], [1879,832]]
  ; _enum := invMatrix._NewEnum()

  ; callback.Call(titi)
  ; while _enum.Next(index, coords)
  ;   callback.Call(toto)
  ;   ; callback.Call(%coords%)


  While row < 6 {
    yCoord := 581+Floor(row*50.5)
    While column < 10 {
      xCoord := 1429+Floor(column*50)
      if !Pixel_checkColor(xCoord, yCoord, 0x080E10) and !Pixel_checkColor(xCoord, yCoord, 0x080D10) and !Pixel_checkColor(xCoord, yCoord, 0x080F10)
        MsgBox % xCoord . ", " . yCoord . " = " . Pixel_getColor(xCoord, yCoord)

      column++
    }
    column:=0
    row++
  }
}

Inventory_getSlotsList(){
  slotsList := []

  row := 0
  column := 0

  While row < 6 {
    While column < 10 {
      ; foo := [1429+column*50, 581+Floor(row*50)]
      foo := [1412+column*50, 569+Floor(row*50)]
      slotsList.push(foo)
      column++
    }
    column := 0
    row++
  }

  return slotsList
}

Inventory_ExcludeEmptySlotsFromList(slotsList){
  FilteredArray := []

  Loop, % slotsList.Length(){
    xCoord := slotsList[A_Index][1]
    yCoord := slotsList[A_Index][2]

    ; MouseMove, xCoord, yCoord

    if !Pixel_checkColorVariationAt(xCoord, yCoord, 0x080E10, 8){
      coords := [xCoord, yCoord]
      FilteredArray.push(coords)
      ; variation := Pixel_getColorVariationAt(xCoord, yCoord, 0x080E10)
      ; MsgBox % Object_Explore(coords) . " = ITEM DETECTED | Hex diff = r" . variation[1] . " g" . variation[2] . " b" . variation[3]
    }
  }

  return FilteredArray
}

Inventory_getFilledSlotList(){
  return Inventory_ExcludeEmptySlotsFromList(Inventory_getSlotsList())
}