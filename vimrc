" pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

set foldlevel=99
let g:pymode_options_max_line_length = 0
let g:pymode_lint_ignore = "E501"

syntax on
set hlsearch
set number

highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen 
highlight DiffText cterm=none ctermfg=black ctermbg=LightRed

function! ConditionalLoad()
    if filereadable(".vimrc.local")
        so .vimrc.local
    endif
endfunction
autocmd VimEnter * call ConditionalLoad()

set tabstop=4
