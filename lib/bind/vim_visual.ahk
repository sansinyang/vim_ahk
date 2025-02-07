﻿; Visual Char/Block/Line
#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Vim_Normal"))
v::Vim.State.SetMode("Vim_VisualChar")
^v::
  Send, ^b
  Vim.State.SetMode("Vim_VisualChar")
Return

+v::
  Vim.State.SetMode("Vim_VisualLineFirst")
  Send, {Home}+{Down}
Return

#If Vim.IsVimGroup() and (Vim.State.StrIsInCurrentVimMode( "Visual"))
v::Vim.State.SetMode("Vim_Normal")

; ydc
y::
  Clipboard :=
  Send, ^c
  Send, {Right}
  if WinActive("ahk_group VimCursorSameAfterSelect"){
    Send, {Left}
  }
  ClipWait, 1
  if(Vim.State.StrIsInCurrentVimMode( "Line")){
    Vim.State.SetMode("Vim_Normal", 0, 0, 1)
  }else{
    Vim.State.SetMode("Vim_Normal", 0, 0, 0)
  }
Return

d::
  Clipboard :=
  Send, ^x
  ClipWait, 1
  if(Vim.State.StrIsInCurrentVimMode("Line")){
    Vim.State.SetMode("Vim_Normal", 0, 0, 1)
  }else{
    Vim.State.SetMode("Vim_Normal", 0, 0, 0)
  }
Return

x::
  Clipboard :=
  Send, ^x
  ClipWait, 1
  if(Vim.State.StrIsInCurrentVimMode( "Line")){
    Vim.State.SetMode("Vim_Normal", 0, 0, 1)
  }else{
    Vim.State.SetMode("Vim_Normal", 0, 0, 0)
  }
Return

c::
  Clipboard :=
  Send, ^x
  ClipWait, 1
  if(Vim.State.StrIsInCurrentVimMode( "Line")){
    Vim.State.SetMode("Insert", 0, 0, 1)
  }else{
    Vim.State.SetMode("Insert", 0, 0, 0)
  }
Return
s::
  Clipboard :=
  Send, ^x
  ClipWait, 1
  if(Vim.State.StrIsInCurrentVimMode( "Line")){
    Vim.State.SetMode("Insert", 0, 0, 1)
  }else{
    Vim.State.SetMode("Insert", 0, 0, 0)
  }
Return

*::
  bak := ClipboardAll
  Clipboard :=
  Send, ^c
  ClipWait, 1
  Send, ^f
  Send, ^v!f
  clipboard := bak
  Vim.State.SetMode("Vim_Normal")
Return
; }}} Vim visual mode
#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and Vim.State.StrIsInCurrentVimMode( "Visual")
;extract text
e::
Send, !{x}
Sleep, 500
Vim.State.SetMode("Vim_Normal")
;, 0, 0, 0)
return

;extract and process
r::
Send, !{x}
Sleep, 1000
Send, !{Left}
Sleep, 500
Send, {Tab}
Vim.State.SetMode("Vim_Normal")
;Click 33, 160
;I can set ESC for delete
;, 0, 0, 0)
return

;cloze
n::
Send, !{z}
Vim.State.SetMode("Vim_Normal")
;Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Return

;remove format
f::
Send, ^{Enter}
Sleep, 100
Send, Remove formatting: S
Sleep, 100
Send, {Enter}
Vim.State.SetMode("Vim_Normal")
return

;set Cloze 
a::
;Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send, <span class=""Cloze"">[...]</span>
Send +^{Left 8}
Sleep, 30
Send ^+{1}
Sleep, 30
;Send, {Tab}
Vim.State.SetMode("Vim_Normal")
return
