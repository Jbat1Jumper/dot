call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
	Plug 'ambv/black'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-scripts/SyntaxRange'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-scripts/highlight.vim'
call plug#end()

let basic_configuration = 1
let coc_configuration = 1
let black_configuration = 1
let nerdtree_configuration = 1
let gitgutter_configuration = 1

if gitgutter_configuration 

    hi GitGutterAddLineNr           ctermfg=lightgreen
    hi GitGutterChangeLineNr        ctermfg=blue
    hi GitGutterDeleteLineNr        ctermfg=red
    hi GitGutterChangeDeleteLineNr  ctermfg=magenta

    highlight GitGutterAdd    ctermfg=lightgreen
    highlight GitGutterChange ctermfg=yellow
    highlight GitGutterDelete ctermfg=yellow

    let g:gitgutter_signs = 1
    let g:gitgutter_highlight_linenrs = 0
    let g:gitgutter_preview_win_floating = 0
    let g:gitgutter_use_location_list = 1

    nmap <silent> gph  <Plug>(GitGutterPrevHunk)
    nmap <silent> gnh  <Plug>(GitGutterNextHunk)
    nmap <silent> ghp <Plug>(GitGutterPreviewHunk) :wincmd P<CR>
    nmap <silent> <Leader>hs <Plug>(GitGutterStageHunk)
    nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)

endif

if basic_configuration

    set number relativenumber
    set nowrap

    " silent! set winheight=2
    " silent! set winminheight=2
    " silent! set winheight=90
    " set winheight=3
    " set winminheight=3
    " set winheight=10

    set winwidth=12
    silent! set winminwidth=12
    set winwidth=87

    " Alternativa
    " set winwidth=80
    " set winminwidth=80
    " autocmd WinEnter * wincmd |
     
    silent! set winheight=1
    silent! set winminheight=1
    autocmd WinEnter * wincmd _
    
    highlight Pmenu ctermbg=darkgray guibg=darkgray ctermfg=white guifg=white
    highlight CocErrorSign ctermfg=lightred ctermbg=darkgray
    highlight CocInfoSign ctermfg=blue
    highlight CocWarningSign ctermfg=yellow

    " Space as leader
    let mapleader = " "
    set showcmd

    set mouse=a

    " Tabs and spaces handling
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

    " Highlight current line
    set cursorline
    hi CursorLine cterm=NONE ctermbg=darkgray

    " Make folds differ from current line color
    highlight Folded ctermfg=darkgray ctermbg=black

    " Save as sudo
    ca w!! w !sudo tee "%"

    " Some shortcuts
    map <Leader>e :e ~/.config/nvim/init.vim<CR>
    map <Leader>E :source ~/.config/nvim/init.vim<CR>
    map <Leader>P :call SyntaxRange#Include('\\begin{pycode}', '\\end{pycode}', 'python', 'Comment')

endif


if nerdtree_configuration

    map <Leader>n :NERDTreeFocus<CR>
    map <Leader>N :NERDTreeClose<CR>

endif


if black_configuration

    nnoremap <Leader>k :Black<CR>
    " Python code formatting
    let g:black_linelength = 79

endif


if coc_configuration

    " Rename
    nmap <Leader>rn <Plug>(coc-rename)

    " Show documentation in preview window.
    nnoremap <Leader>d :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes
    nmap <silent> gpw <Plug>(coc-diagnostic-prev)
    nmap <silent> gpe <Plug>(coc-diagnostic-prev)
    nmap <silent> gnw <Plug>(coc-diagnostic-next)
    nmap <silent> gne <Plug>(coc-diagnostic-next)


    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

endif


