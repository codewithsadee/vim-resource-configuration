
" ThePrimeagen / plugin / sets.vim "==========================================

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=80

"set filetype=vim-javascript
"set syntax=vim-javascript

"set for NERDTree devicon
set encoding=UTF-8
"set guifont=FiraCode_Nerd_Font_Mono:h11

"=============================================================================





" ThePrimeagen / init.vim "===================================================

call plug#begin('~/.vim/plugged')

"colorscheme plugins
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

"prettier
Plug 'sbdchd/neoformat'


"stntax highlighting plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'isruslan/vim-es6'
Plug 'pangloss/vim-javascript'

"git plugins
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


Plug 'mbbill/undotree'

"NERD tree: a tree explorer plugin for vim.
    "> manual configuration in --> (160L)
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
    "> manual configuration in --> (190L)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

"Syntax checking plugins
Plug 'scrooloose/syntastic'

" Debugger Plugins
"Plug 'puremourning/vimspector'
"Plug 'szw/vim-maximizer'

"vim statusline plugin
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"terminal plugin
    "> manual configuration in --> (238L)
Plug 'voldikss/vim-floaterm'

"fzf plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
"vim css hexColor plugin
Plug 'ap/vim-css-color'
call plug#end()


"augroup highlight_yank
    "autocmd!
    "autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
"augroup END

"augroup THE_PRIMEAGEN
    "autocmd!
    "autocmd BufWritePre * %s/\s\+$//e
    "autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
"augroup END

filetype plugin indent on
if has("syntax")
    syntax on
endif



" ============================================================================





" ThePrimeagen / plugin / colors.vim "========================================

let g:theprimeagen_colorscheme = "ayu"
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:theprimeagen_colorscheme])
    else
        " TODO: What the way to use g:theprimeagen_colorscheme
        colorscheme ayu
    endif

    highlight ColorColumn ctermbg=0 guibg=#16222e
    " hi SignColumn guibg=none
    " hi CursorLineNR guibg=None
    " highlight Normal guibg=none
    "highlight LineNr guifg=#ff8659
    "highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacda
endfun
call ColorMyPencils()

" Vim with me
nnoremap <leader>cwm :call ColorMyPencils()<CR>
nnoremap <leader>vwb :let g:theprimeagen_colorscheme =

"=============================================================================





" ThePrimeagen / plugin / git.vim "===========================================

"nnoremap <leader>ga :Git fetch --all<CR>
"nnoremap <leader>grum :Git rebase upstream/master<CR>
"nnoremap <leader>grom :Git rebase origin/master<CR>

"nmap <leader>gh :diffget //3<CR>
"nmap <leader>gu :diffget //2<CR>
"nmap <leader>gs :G<CR>
"nmap <leader>gv :GV<CR>

"=============================================================================





" NERDTree all configuration "==============================================

"specific key shortcut for opening NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"change the default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ============================================================================





" *nerdtree Syntax Hightlighting configuration "==============================

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" ============================================================================





" Syntax chack plugin configuration "=========================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = [ 'eslint', 'jshint', 'gjslint' ]
let g:syntastic_css_checkers = [ 'csslint', 'stylelint' ]
let g:syntastic_sass_checkers = [ 'sass', 'sassc', 'stylelint' ]

" ============================================================================





" Folaterm configuration "====================================================

" keymap configuration
let g:floaterm_keymap_new = '<F7>'
let g:floaterm_keymap_prev = '<F8>'
let g:floaterm_keymap_next = '<F9>'
let g:floaterm_keymap_kill = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_title = 'codewithsadee@term ( $1|$2 )'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" ============================================================================
