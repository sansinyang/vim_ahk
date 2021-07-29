#If Vim.IsVimGroup()
^[::Vim.State.HandleCtrlBracket()
Esc::
Vim.State.HandleEsc()
IfWinActive, ahk_class TElWind
Vim.State.SetMode("Sm")


;#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") 
;Esc::
;Vim.State.HandleEsc()
;Vim.State.SetMode("Sm")
;return


#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and (Vim.State.Mode == "Vim_Normal")
z::
;ifWinActive, ahk_class TElWind
;ControlFocus, TBitBtn3
Send,{Esc}
Vim.State.SetMode("Sm")
Return

;#If Vim.IsVimGroup() and WinActive("ahk_group VimSm")
;ControlGetFocus, currentFocus, ahk_class TElWind, , , 
;if (currentFocus == "Internet Explorer_Server1")
;;if ((currentFocus == "Internet Explorer_Server2") || (currentFocus == "Internet Explorer_Server1"))
;{
;Send, {Esc}
;}


#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and Vim.State.IsCurrentVimMode( "Sm")
{
r::
WinActivate, ahk_class TElWind
Send,{Tab}
;ControlFocus, Internet Explorer_Server1
;Click 33, 160
;Click , Internet Explorer_Server1
Vim.State.SetMode("Vim_Normal")
Return

y::
;Send ,{Esc}
Send , {Del}
Sleep, 500 ; wait for popup
IfWinActive, ahk_class TMsgDialog
Send, {Enter}
Sleep, 500 ; wait for popup
Vim.State.SetMode("Vim_Normal")
Return

;Space::
;Send , {Space}
;Sleep, 500 ; wait for popup
;Vim.State.SetMode("Sm")
;Sleep, 500 ; wait for popup
;If Vim.State.IsCurrentVimMode( "Insert")
;Vim.State.SetMode("Vim_Normal")
;Return
h::
    Send, !p
	Sleep, 100
    Send,  70
	Sleep, 100
    Send, {Enter}
return
n::
    Send, !p
	Sleep, 100
    Send,  60
	Sleep, 100
    Send, {Enter}
return
b::
    Send, !p
	Sleep, 100
    Send,  10
	Sleep, 100
    Send, {Enter}
return
v::
    Send, !p
	Sleep, 100
    Send,  20
	Sleep, 100
    Send, {Enter}
return
c::
    Send, !p
	Sleep, 100
    Send,  30
	Sleep, 100
    Send, {Enter}
return
x::
    Send, !p
	Sleep, 100
    Send,  40
	Sleep, 100
    Send, {Enter}
return
w::
    Send, !p
	Sleep, 100
    Send,  50
	Sleep, 100
    Send, {Enter}
return

g::
    Send, {1}
    Sleep, 40
    Send, {Space} ; next item
return
f::
    Send, {2}
    Sleep, 40
    Send, {Space} ; next item
return
d::
    Send, {3}
    Sleep, 40
    Send, {Space} ; next item
return
s::
    Send, {4}
    Sleep, 40
    Send, {Space} ; next item
return
a::
    Send, {5}
    Sleep, 40
    Send, {Space} ; next item
return
}


#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode( "Insert")) and (Vim.Conf["VimJJ"]["val"] == 1)
~j up:: ; jj: go to Normal mode.
  Input, jout, I T0.1 V L1, j
  if(ErrorLevel == "EndKey:J"){
    SendInput, {BackSpace 2}
    Vim.State.SetNormal()
  }
Return
