; Visual Char/Block/Line
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
e::
Send, !{x}
Vim.State.SetMode("Vim_Normal")
;, 0, 0, 0)
return

r::
Send, !{x}
Sleep, 1000
Send, !{Left}
Sleep, 500
Click 33, 160
Vim.State.SetMode("Vim_Normal")
;I can set ESC for delete
;, 0, 0, 0)
return


n::
Send, !{z}
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Return

