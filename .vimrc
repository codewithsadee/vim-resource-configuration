set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif

    "set nocompatible              " be iMproved, required
    "filetype off                  " required
    set rtp+=~/.vim/bundle/vundle/

    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    "Add your bundles here

    if iCanHazVundle == 0
        echo "Installing Vundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif


    "must be last
    filetype plugin indent on " load filetype plugins/indent settings
    syntax on                      " enable syntax

    call vundle#end()
 
" Setting up Vundle - the vim plugin bundler end
call vundle#begin()
	Plugin 'scrooloose/nerdtree'
	Plugin 'bling/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'ap/vim-css-color'
	Plugin 'voldikss/vim-floaterm'
	"Plugin 'frazrepo/vim-rainbow'
	Plugin 'ryanoasis/vim-devicons'
	Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plugin 'pangloss/vim-javascript'
call vundle#end()



"NERDTree default settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" NERDTree syntax highlighting
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1



"AirlineTheme powerline symbol
let g:airline_powerline_fonts = 1


"FloatermToggle settings
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_kill = '<F11>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_title = 'codewithsadee@term $1/$2'
" Set floating window border line color to cyan, and background to orange
"hi FloatermBorder guibg=orange guifg=cyan
	hi Floaterm guibg=black



"Vim colorscheme set
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = '1'
let g:gruvbox_italicize_strings = '1'
let g:gruvbox_italicize_comments = '1'
colorscheme gruvbox
set background=dark
set termguicolors

"run command all time open vim
set number
set wrap!
set cursorline
set autoindent
set shiftwidth=4
set tabstop=4
set encoding=UTF-8


"javascript syntax highlight
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
