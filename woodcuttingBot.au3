#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Authors:         roBOTically efficient

 Script Function:
	Woodcutting bot

#ce ----------------------------------------------------------------------------
; GUI STARTS HERE
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $botGUI = GUICreate("roBOTically efficient", 296, 117, -1, -1)
Global $woodCut = GUICtrlCreateButton("Woodcutting Bot", 104, 16, 99, 25)
Global $exitButton = GUICtrlCreateButton("EXIT", 120, 56, 59, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
HotKeySet("{ESC}", "Terminate")

While 1
	Global $nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Terminate()

		Case $nMsg = $woodCut
			chopLoop()

		Case $nMsg = $exitButton
			Terminate()

	EndSelect
WEnd
; GUI ENDS HERE


; TERMINATE() STARTS HERE
Func Terminate()
   Exit 1
EndFunc
; TERMINATE() ENDS HERE

; WOODCUTTING_BOT() STARTS HERE
Func chopLoop()
   MsgBox(0,"LET'S GO!","Press ESC to quit")

   Local $color
   $color = 0x292D16

   Local $interval
   $interval = "30000"

   Local $inventoryColor
   $inventoryColor = 0x3E3529


   While 1

	  ; oak tree by general
	  $point = PixelSearch(369, 387,1406, 676, $color)
	  ; $point = PixelSearch(470, 181,1227, 827, $color)

	  if IsArray($point) Then
		 MouseClick("left", $point[0], $point[1])
		 Sleep($interval)
	  EndIf

	  if PixelGetColor(1813,775) <> 0x3E3529 Then
		 MouseClick("right", 1813,775 )
		 MouseClick("left", 1813,820 )
	  EndIf

	  if PixelGetColor(1859,778) <> 0x3E3529 Then
		 MouseClick("right", 1860,776 )
		 MouseClick("left", 1860,820 )
	  EndIf
   WEnd
EndFunc
; WOODCUTTING_BOT() ENDS HERE