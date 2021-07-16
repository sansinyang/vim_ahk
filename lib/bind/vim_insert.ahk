#If Vim.IsVimGroup() and (Vim.State.IsCurrentVimMode("Insert"))
^h::Vim.Move.Repeat("h")
^j::Vim.Move.Repeat("j")
^k::Vim.Move.Repeat("k")
!j::Vim.Move.Repeat("j")
!k::Vim.Move.Repeat("k")
^l::Vim.Move.Repeat("l")
^a::Vim.Move.Move("0") ; Emacs like
^e::Vim.Move.Move("$") ; Emacs like
^::Vim.Move.Move("^")
; Words
!l::Vim.Move.Repeat("w")
!h::Vim.Move.Repeat("b")
^w::Send, ^{BS}
