; Launch Settings
#If
^!+v::
  Vim.Setting.ShowGui()
Return

^!r::Reload
; Check Mode
#If Vim.IsVimGroup()
^!+c::
  Vim.State.CheckMode(4, Vim.State.Mode)
Return
