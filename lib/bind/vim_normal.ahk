﻿#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Vim_Normal"))
; Undo/Redo
u::Send,^z
^r::Send,^y
z::Send,^{F7}
;Combine lines
+j:: Send, {End}{Space}{Delete}

; Change case
~::
  bak := ClipboardAll
  Clipboard =
  Send, +{Right}^x
  ClipWait, 1
  if(Clipboard is lower){
    StringUpper, Clipboard, Clipboard
  }else if(Clipboard is upper){
    StringLower, Clipboard, Clipboard
  }
  Send, ^v
  Clipboard := bak
Return

+z::Vim.State.SetMode("Z")
#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Z"))
+z::
  Send, ^s
  Send, !{F4}
  Vim.State.SetMode("Vim_Normal")
Return

+q::
  Send, !{F4}
  Vim.State.SetMode("Vim_Normal")
Return

;#If Vim.IsVimGroup()and WinActive("ahk_group VimSm")
;; and (Vim.State.IsCurrentVimMode("Vim_Normal"))
;s::
;Vim.State.SetMode("Vim_Normal")
;ControlClick, TBitBtn3
;Sleep, 1000 ; wait for popup
;VIm.State.SetNormal()
;;Send, {Tab}
;return

.::Send, +^{Right}{BS}^v

;Sm->SM
;#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and (Vim.State.Mode == "Sm")
;;dismiss
;t::
;Send, ^d
;Sleep, 500 ; wait for popup
;IfWinActive, ahk_class TMsgDialog
;{
;Send, {Enter}
;}
;Sleep, 200 ; wait for popup
;IfWinActive, ahk_class TMsgDialog
;{
;Send, {Enter}
;return
;}
;;ControlFocus, TBitBtn3
;;Vim.State.SetMode("Sm")
;;Send, {Esc}
;return

;Sm->Normal
#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and (Vim.State.Mode == "Vim_Normal")
;force next and return
f::
ControlClick, TBitBtn3
Sleep, 500 ; wait for popup
Vim.State.SetMode("Sm")
;VIm.State.SetSm()
;Send, {Tab}
return


;Sm->Sm or Normal
#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and ((Vim.State.Mode == "Sm") or(Vim.State.Mode == "Vim_Normal"))
;Copy new 
^g::
send ,^n
Click 33, 160
Vim.State.SetMode("Vim_Normal")
Return

;go to the parent
q::
Send, ^{Up}
Sleep, 500
Send, {Tab}
Sleep, 200
Vim.State.SetMode("Vim_Normal")
Return

;go to previous element
!q::
Send, !{PgUp}
Vim.State.SetMode("Vim_Normal")
Return

;go to next element
!e::
Send, !{PgDn}
Sleep, 500
Click 33, 160
Vim.State.SetMode("Vim_Normal")
Return

;go to previous visited element
e::
Send,!{Left}
Sleep, 500
Send, {Tab}
;Click 33, 160
Vim.State.SetMode("Vim_Normal")
;Sleep, 200 ; wait for popup
;Send, {Esc}
;Vim.State.SetMode("Sm")
Return

;backtrack revist element
z::
Send,!{Right}
Sleep, 500
Send, {Tab}
Vim.State.SetMode("Vim_Normal")
Return

;Dissmiss
t::
Send, ^d
Sleep, 500 ; wait for popup
ifwinactive, ahk_class TMsgDialog
{
Send, {Enter}
}
Sleep, 200 ; wait for popup
IfWinActive, ahk_class TMsgDialog
{
Send, {Enter}
}
Sleep, 200
;Send, {Tab}
;Vim.State.SetMode("Vim_Normal")
;ControlFocus, TBitBtn3
Send, {Esc}
Vim.State.SetMode("Sm")
return
;#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and ((Vim.State.Mode == "Vim_Normal"))




; Q-dir
#If Vim.IsVimGroup() and WinActive("ahk_group VimQdir") and (Vim.State.Mode == "Vim_Normal")
; For Q-dir, ^X mapping does not work, use !X instead.
; ^X does not work to be sent, too, use Down/Up
; switch to left top (1), right top (2), left bottom (3), right bottom (4)
!u::Send, {LControl Down}{1 Down}{1 Up}{LControl Up}
!i::Send, {LControl Down}{2 Down}{2 Up}{LControl Up}
!j::Send, {LControl Down}{3 Down}{3 Up}{LControl Up}
!k::Send, {LControl Down}{4 Down}{4 Up}{LControl Up}
; Ctrl+q, menu Quick-links
'::Send, {LControl Down}{q Down}{q Up}{LControl Up}
; Keep the e key in Normal mode, use the right button and then press the refresh (e) function, do nothing, return to the e key directly
~e::
Return
