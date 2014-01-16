:syntax enable
:syntax on
:set nu
:set hlsearch

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set expandtab

"===[ Format visual selection for JavaScript HTML strings ]===
" Visually select the lines to format and then press ;q to execute
vmap <silent> ;q :s/^\(\s*\)\(.*\)\s*$/ \1 + '\2'/<CR>kk

highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen 
highlight DiffText cterm=none ctermfg=black ctermbg=LightRed

function! ConditionalLoad()
    if filereadable(".vimrc.local")
        so .vimrc.local
    endif
endfunction
autocmd VimEnter * call ConditionalLoad()
