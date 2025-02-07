;Sm->sm state
#If Vim.IsVimGroup() and WinActive("ahk_group VimSm") and Vim.State.IsCurrentVimMode( "Sm")
{
i::
	Send,{Tab}
	Vim.State.SetMode("Insert")
Return
;concept make
m::
Sleep, 200
Send, ^{Enter}
Sleep, 200
Vim.State.SetMode("Insert")
Send, concept: m
Sleep, 200
Send, {Enter}
Vim.State.SetMode("Sm")
return

;link elements between
k::
Send, ^{Enter}
Sleep, 200
Vim.State.SetMode("Insert")
Send, l
Sleep, 200
Send, {Enter}
Vim.State.SetMode("Sm")
return

;link element to concept
j::
Send, ^{Enter}
Sleep, 200
Vim.State.SetMode("Insert")
Send, concept: l
Sleep, 200
Send, {Enter}
Vim.State.SetMode("Sm")
return
;sm2normal
r::
;IfWinActivate, ahk_class TElWind
Send,{Tab}
;ControlFocus, Internet Explorer_Server1
;Click 33, 160
;Click , Internet Explorer_Server1
Vim.State.SetMode("Vim_Normal")
Return

;delete element
y::
Send , {Del}
Sleep, 500 ; wait for popup
IfWinActive, ahk_class TMsgDialog
Send, {Enter}
Sleep, 500 ; wait for popup
;Vim.State.SetMode("Vim_Normal")
Return

;Space::
;Send , {Space}
;Sleep, 500 ; wait for popup
;Vim.State.SetMode("Sm")
;Sleep, 500 ; wait for popup
;If Vim.State.IsCurrentVimMode( "Insert")
;Vim.State.SetMode("Vim_Normal")
;Return

;priority set in sm
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

;score in sm
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
