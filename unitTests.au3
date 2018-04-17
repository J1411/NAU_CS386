#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $botGUI = GUICreate("roBOTically efficient", 296, 117, -1, -1)
Global $moveMouse = GUICtrlCreateButton("Move Mouse", 104, 16, 99, 25)
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

		Case $nMsg = $moveMouse
			Test_dropItem()

		Case $nMsg = $exitButton
			Terminate()

	EndSelect
WEnd
; GUI ENDS HERE

; Script Start - Add your code below here

;Test_findColorAndMoveMouse()
;Test_waitCycleTime()
;Test_mouseMoveToInventory()
;Test_dropItem()

Func Terminate()
   Exit 1
EndFunc

Func Test_findColorAndMoveMouse()
	Local $color
	$color = 0x292D16

	$point = PixelSearch(369, 387,1406, 676, $color)
	Sleep(5000)
	MouseMove($point[0], $point[1])

EndFunc


Func Test_waitCycleTime()
	Sleep (5000)
EndFunc


Func Test_mouseMoveToInventory()
	MouseMove(1813,775 )
EndFunc

Func Test_dropItem()
   Local $inventoryColor
   $inventoryColor = 0x3E3529

	if PixelGetColor(1813,775) <> $inventoryColor Then
		 MouseClick("right", 1813,775 )
		 MouseClick("left", 1813,820 )
	EndIf

	if PixelGetColor(1859,778) <> $inventoryColor Then
		MouseClick("right", 1860,776 )
		MouseClick("left", 1860,820 )
	EndIf
EndFunc


