#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Team OPDingo

 Script Function:
	The Entire bot

#ce ----------------------------------------------------------------------------
; Start GUI
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $roBOTically_efficient = GUICreate("roBOTically efficient", 282, 111, -1, -1)
Global $duckHunter = GUICtrlCreateButton("Duck Hunter", 40, 16, 99, 25)
Global $woodCuttingBot = GUICtrlCreateButton("Woodcutting Bot", 144, 16, 99, 25)
Global $Exit = GUICtrlCreateButton("Exit", 96, 64, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
HotKeySet("{ESC}", "Terminate")

While 1
	Global $nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Terminate()

		Case $nMsg = $woodCuttingBot
			chopLoop()

		Case $nMsg = $duckHunter
			duckHunter()

		Case $nMsg = $Exit
			Terminate()
	EndSelect
WEnd
; End GUI

; TERMINATE() STARTS HERE
Func Terminate()
   Exit 1
EndFunc
; TERMINATE() ENDS HERE

; WOODCUTTING_BOT() STARTS HERE
Func chopLoop()
   MsgBox(0,"LET'S GO!","Press ESC to quit")

   reSizeScreen()
   Sleep(1000)
   clickNorth()

   Local $color
   $color = 0x292D16

   Local $interval
   $interval = "15000"

   Local $inventoryColor
   $inventoryColor = 0x3E3529


   While 1
	  $point = PixelSearch(762,104,1136, 743, $color)
	  Sleep(300)
	  if IsArray($point) Then
		 MouseClick("left", $point[0], $point[1])
		 Sleep($interval)
	  EndIf

	  Sleep(500)

	  dropItem()
   WEnd
EndFunc
; WOODCUTTING_BOT() ENDS HERE

; duckHunter() bot STARTS HERE
Func duckHunter()
   MsgBox(0,"LET'S GO!","Press ESC to quit")

   reSizeScreen()

   Local $interval
   $interval = "10000"

   Sleep(1000)

   clickNorth()

   Local $duckHunter
   $duckHunter = 0x7D7663

   Sleep(3000)

   While 1
	   $point = PixelSearch(466,388,784,1041, $duckHunter)
	   if IsArray($point) Then
		 MouseClick("left", $point[0], $point[1],1)
		 Sleep($interval)
	   EndIf
   WEnd

EndFunc
; duckHunter() bot ENDS HERE

Func reSizeScreen()

    Local $iconColor
    $iconColor = 0xD3D5E4
	$point = PixelSearch(8,37,1913,1043,$iconColor)

	if IsArray($point) Then
	   MouseClick("left",$point[0]+100, $point[1])
	   Sleep(100)
	   MouseClick("left",$point[0]+100, $point[1])
	EndIf

EndFunc

; clickNorth() STARTS HERE, clicks on the compass rose to re-orientate the screen
Func clickNorth()

   Local $northColor
   $northColor = 0x303EAC

   $point = PixelSearch(0,1,1913,1043,$northColor)

   MouseClick("left",$point[0], $point[1])

EndFunc
; clickNorth() ENDS HERE

; dropItem() STARTS HERE, drops 7 items of inventory slots if stuff is in inv
Func dropItem()
	Local $inventoryColor
    $inventoryColor = 0x3E3529

	Local $x = 1776
	Local $y = 775
	Local $changeInY = 820
	Local $counter = 0

	Do
		if PixelGetColor($x,$y) <> $inventoryColor Then
			MouseClick("right", $x,$y )
			MouseClick("left", $x,$changeInY )
		EndIf
		$x = $x + 40
		$counter = $counter + 1
		Sleep(500)
	Until $counter == 3

	Local $x = 1736
	Local $y = 810
	Local $changeInY = 855
	Local $counter = 0

		Do
		if PixelGetColor($x,$y) <> $inventoryColor Then
			MouseClick("right", $x,$y )
			MouseClick("left", $x,$changeInY )
		EndIf
		$x = $x + 40
		$counter = $counter + 1
		Sleep(500)
	Until $counter == 4

EndFunc
; dropItem() ENDS HERE
