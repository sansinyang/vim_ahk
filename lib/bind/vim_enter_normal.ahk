#If Vim.IsVimGroup()
^[::Vim.State.HandleCtrlBracket()
Esc::Vim.State.HandleEsc()

Vim.State.SetMode("Vim_Normal")

#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and (Vim.State.Mode == "Vim_Normal")
f::
;ifWinActive, ahk_class TElWind
Send,{Esc}
Vim.State.SetMode("Sm")
Return


#If Vim.IsVimGroup() and Vim.State.IsCurrentVimMode( "Sm")
{
r::
;WinActivate, ahk_class TElWind
Click 33, 160
Vim.State.SetMode("Vim_Normal")
Return
y::
Send , {Del}
Sleep, 500 ; wait for popup
IfWinActive, ahk_class TMsgDialog
Send, {Enter}
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
