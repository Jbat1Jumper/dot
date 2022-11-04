set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
	Plug 'ambv/black'
    Plug 'chrisbra/Colorizer'
    Plug 'APZelos/blamer.nvim'
"    Plug 'ap/vim-css-color'
"    Plug 'mhinz/vim-startify'
"    Plug 'cosminadrianpopescu/vim-sql-workbench'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-scripts/SyntaxRange'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'mileszs/ack.vim'
    Plug 'lambdalisue/suda.vim'
"    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-scripts/highlight.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'pantharshit00/vim-prisma'
"    Plug 'tpope/vim-abolish'
call plug#end()

let basic_configuration = 1
let coc_configuration = 1
let black_configuration = 1
let nerdtree_configuration = 1
let gitgutter_configuration = 1
let ctrlp_configuration = 0
let fzf_configuration = 1
let php_refactoring_toolbox_configuration = 1
let php_hl_optimization = 1

let g:sw_config_dir = '~'
let g:sw_exe = '/Applications/SQLWorkbenchJ.app/Contents/Java/sqlwbconsole.sh'
" let g:sw_cache

let g:blamer_delay = 2000
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_relative_time = 1
highlight Blamer ctermfg=black

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

    highlight CocRustTypeHint ctermfg=black
    highlight CocRustChainingHint ctermfg=black

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

endif


if php_refactoring_toolbox_configuration
    let g:vim_php_refactoring_use_default_mapping = 0
    nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
    nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
    nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
    nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
    vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
    nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
    vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
    nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
    nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
    vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
    nnoremap <unique> <Leader>csg :call PhpCreateSettersAndGetters()<CR>
    nnoremap <unique> <Leader>cog :call PhpCreateGetters()<CR>
    nnoremap <unique> <Leader>da :call PhpDocAll()<CR>
endif



if ctrlp_configuration
    " use only files that are tracked by git
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

if fzf_configuration
    let g:fzf_layout = { 'down': '30%' }
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    let g:fzf_windows_jump = 1
    let g:fzf_marks_jump = 1
    let g:fzf_lines_jump = 1

    " map <Leader>p :call fzf#run()<CR>
    map <Leader>sp :FZF<CR>
    map <Leader>sf :Files<CR>
    map <Leader>sg :GFiles<CR>
    map <Leader>sb :Buffers<CR>
    map <Leader>sli :BLines<CR>
    map <Leader>sla :Lines<CR>
    map <Leader>sm :Marks<CR>
    map <Leader>sw :Windows<CR>
    map <Leader>sh :History<CR>
endif

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

if nerdtree_configuration
    let g:NERDTreeIgnore = ['^node_modules$']
    map <Leader>nn :NERDTreeFocus<CR>
    map <Leader>nf :NERDTreeFind<CR>
    map <Leader>nc :NERDTreeClose<CR>
endif


if black_configuration

    nnoremap <Leader>k :Black<CR>
    " Python code formatting
    let g:black_linelength = 79

endif


if php_hl_optimization

    let g:php_html_in_heredoc = 0
    let g:php_html_in_nowdoc = 0
    let g:php_html_load = 0
    let g:php_sql_query = 0
    let g:php_sql_heredoc = 0
    let g:php_sql_nowdoc = 0

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

    inoremap <silent><expr> <c-space> coc#refresh()

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes
    nmap <silent> gpw <Plug>(coc-diagnostic-prev)
    nmap <silent> gpe <Plug>(coc-diagnostic-prev)
    nmap <silent> gnw <Plug>(coc-diagnostic-next)
    nmap <silent> gne <Plug>(coc-diagnostic-next)

    " Format code
    nmap <Leader>ff <Plug>(coc-format)

    " Autocomplete using Enter
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

endif


