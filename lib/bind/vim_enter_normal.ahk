#If Vim.IsVimGroup()
^[::Vim.State.HandleCtrlBracket()

Esc::
Vim.State.HandleEsc()
IfWinActive, ahk_class TElWind
Vim.State.SetMode("Sm")


;#If im.IsVimGroup() and WinActive("ahk_group VimSm") 
;Esc::
;Vim.State.HandleEsc()
;Vim.State.SetMode("Sm")
;return

;like
#If Vim.IsVimGroup() and WinActive("ahk_group VimSm")
; and (Vim.State.Mode == "Vim_Normal")
;back Sm
;ifWinActive, ahk_class TElWind
;ControlFocus, TBitBtn3

;but I think is duoyu
;z::
;Send,{Esc}
;Vim.State.SetMode("Sm")
;Return

;#If Vim.IsVimGroup() and WinActive("ahk_group VimSm")
;ControlGetFocus, currentFocus, ahk_class TElWind, , , 
;if (currentFocus == "Internet Explorer_Server1")
;;if ((currentFocus == "Internet Explorer_Server2") || (currentFocus == "Internet Explorer_Server1"))
;{
;Send, {Esc}
;}




#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode( "Insert")) and (Vim.Conf["VimJJ"]["val"] == 1)
~j up:: ; jj: go to Normal mode.
  Input, jout, I T0.1 V L1, j
  if(ErrorLevel == "EndKey:J"){
    SendInput, {BackSpace 2}
    Vim.State.SetNormal()
  }
Return
