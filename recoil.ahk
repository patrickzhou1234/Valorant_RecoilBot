#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global delay:=400
global Lclickeron := false
#If WinActive("VALORANT")
f::
Lclickeron := !Lclickeron
Gui +AlwaysOnTop -Caption +Border
Gui, Color, 0x05a8ff
Gui, Font, S20
ifequal Lclickeron, 0, Gui, Add, Text,, recoil bot turned off
ifequal Lclickeron, 1, Gui, Add, Text,, recoil bot turned on
Gui, Show, x0 y0 NA
Sleep, 1000
Gui, Destroy
Return

*LButton::
if (Lclickeron) {
    While(GetKeyState("LButton","P"))
    {
        Click
        Sleep, %delay%
        delay+=50
    }
    delay:=400
} else {
    Click, Left
}
Return
#If