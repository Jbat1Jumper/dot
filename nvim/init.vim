call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'ambv/black'
    Plug 'chrisbra/Colorizer'
"    Plug 'ap/vim-css-color'
"    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-scripts/SyntaxRange'
    Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let basic_configuration = 1
let coc_configuration = 1
let black_configuration = 1
let nerdtree_configuration = 1


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
    set winwidth=85

    " Alternativa
    " set winwidth=80
    " set winminwidth=80
    " autocmd WinEnter * wincmd |
     
    set winheight=1
    set winminheight=1
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
    nmap <silent> gp <Plug>(coc-diagnostic-prev)
    nmap <silent> gn <Plug>(coc-diagnostic-next)

    " Format code
    nmap <Leader>ff <Plug>(coc-format)


    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

endif


