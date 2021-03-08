" --------------------------------- "
"             _                     "
"  _ ____   _(_)_ __ ___  _ __ ___  "
" | '_ \ \ / / | '_ ` _ \| '__/ __| "
" | | | \ V /| | | | | | | | | (__  "
" |_| |_|\_/ |_|_| |_| |_|_|  \___| "
"                                   "
" --------------------------------- "
" by nebulaeandstars@gmail.com


" ############################################################################ "
" # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL ###### "
" ############################################################################ "

" add language files here
filetype off
set runtimepath+=/usr/share/vim/vimfiles/ftplugin/lilypond.vim

" re-enable filetype
filetype indent plugin on
syntax on

colorscheme andromeda

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set textwidth=0

" used for folding
" override these as needed
let g:section_heading = '\%(!.*\)\@<!# .* # .* #'
let g:section_heading_top_gap = 3
let g:section_heading_bottom_gap = 2
let g:subsection_heading = '\%(!.*\)\@<!--- .* ---'
let g:subsection_heading_top_gap = 0
let g:subsection_heading_bottom_gap = 0
let g:empty_line = '^\s*$'




" ############################################################################ "
" # SETTINGS # SETTINGS # SETTINGS # SETTINGS # SETTINGS # SETTINGS ########## "
" ############################################################################ "

" show line numbers
set number relativenumber

" no delay after pressing escape
set timeoutlen=1000 ttimeoutlen=0

" enable the mouse "
set mouse=a

" use the system clipboard as the default register "
set clipboard+=unnamedplus

" search as characters are entered, and highlight the results "
set incsearch
set hlsearch

" Use case insensitive search, except when using capital letters "
set ignorecase
set smartcase

" enable autocompletion
set wildmenu
set wildmode=longest,list,full

" set folding params
set foldmethod=expr
set foldexpr=VimFolds(v:lnum)
set foldtext=VimFoldText()

" show partial commands in the last line
set showcmd

" more intuitive backspace in insert mode "
set backspace=indent,eol,start

" make ~ behave like g~
set tildeop

" set directories for persistent undo, backup, and swap files
set undodir=~/.local/share/nvim/undo//
" set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undofile
" set backup

" follow imports for autocomplete
" use the dictionary for autocomplete when spellchecking is enabled
set complete+=i,kspell

set omnifunc=syntaxcomplete#Complete

" asks 'do you want to save?' save when trying to quit with unsaved changes "
set confirm

" split toward the bottom rather than the top
set splitbelow splitright

" display the cursor position in the status line
set ruler

" always display the status line, even if only one window is displayed
set laststatus=2

" set the command window height to 2 lines "
set cmdheight=1

" use the visual bell instead of beeping when doing something wrong
set visualbell

" disable the bell
set t_vb=




" ############################################################################ "
" # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS #### "
" ############################################################################ "

" --- Utilities --- "
" Show highlighting groups for current word "
function! s:SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" --- Goyo --- "
function! s:goyo_enter()
    set nonumber norelativenumber
    set noshowmode
    set noshowcmd
    set cmdheight=1
endfunction

function! s:goyo_leave()
    set number relativenumber
    set showmode
    set showcmd
    set cmdheight=2
endfunction


" --- Folding --- "
function! VimFolds(lnum)
    l:comment='^'.split(&commentstring, '%s')[0]

    " fold using predefined section headings
    if getline(a:lnum-g:section_heading_bottom_gap) =~# g:section_heading
        return '>1'
    elseif getline(a:lnum+g:section_heading_top_gap) =~# g:section_heading
        return '<1'

        " fold using predefined subsection headings
    elseif getline(a:lnum-g:subsection_heading_bottom_gap) =~# g:subsection_heading
        return '>2'
    elseif getline(a:lnum+g:subsection_heading_top_gap) =~# g:subsection_heading
        return '<2'

    else
        return '='
    endif
endfunction

function! VimFoldText()
    let l:folded_line_num = v:foldend - v:foldstart
    let l:line_text = substitute(getline(v:foldstart), '', '', 'g')
    let l:fillcharcount = &textwidth - len(l:line_text) - len(l:folded_line_num) - 10
    return v:folddashes . "| " . l:line_text . repeat(' ', l:fillcharcount) . ' (' . l:folded_line_num . ' L)' . repeat(' ', 200)
endfunction


" ---- Custom text objects --- "
function! s:IndTxtObj(inner)
    let curline = line(".")
    let lastline = line("$")
    let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
    let i = i < 0 ? 0 : i
    if getline(".") =~ "^\\s*$"
        return
    endif
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && (nextblank || indent(p) >= i )
        -
        let p = line(".") - 1
        let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    if (!a:inner)
        -
    endif
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && (nextblank || indent(p) >= i )
        +
        let p = line(".") + 1
        let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    if (!a:inner)
        +
    endif
    normal! $
endfunction




" ############################################################################ "
" # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS ########## "
" ############################################################################ "
let mapleader = ","

" --- Multiple Modes --- "

" scroll with J and K
noremap K <C-y><C-y>
noremap J <C-e><C-e>

" don't yank when using c
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C

" move selection up or down by a line
nnoremap <C-k> :<c-u>move-2<cr>==
nnoremap <C-j> :<C-u>move+<CR>==
xnoremap <C-k> :move-2<CR>='[gv
xnoremap <C-j> :move'>+<CR>='[gv


" --- Custom Text Objects --- "

" current indent
onoremap <silent> ai :<C-U>cal <SID>IndTxtObj(0)<CR>
vnoremap <silent> ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
onoremap <silent> ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent> ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

" current line
xnoremap <silent> al :<C-U>normal! g_v0<CR>
onoremap <silent> al :<C-U>normal! g_v0<CR>
xnoremap <silent> il :<C-U>normal! g_v^<CR>
onoremap <silent> il :<C-U>normal! g_v^<CR>

" whole document
xnoremap <silent> id :<C-U>normal! G$Vgg0<CR>
onoremap <silent> id :<C-U>normal! GVgg<CR>


" --- Normal Mode --- "

" toggle
nnoremap <leader>f :Goyo<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>r :RainbowToggle<CR>
nnoremap <leader>a :ALEToggleBuffer<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>o :Vifm<CR>
nnoremap <leader>G :GitGutterToggle<CR>
nnoremap <leader>zg :GitGutterFold<CR>

" show/hide
nnoremap <leader>sf :set foldcolumn+=2<CR>
nnoremap <leader>hf :set foldcolumn-=2<CR>

nnoremap <leader>sg :GitGutterEnable<CR>
nnoremap <leader>hg :GitGutterDisable<CR>

nnoremap <leader>sc :set colorcolumn=81<CR>
nnoremap <leader>hc :set colorcolumn=<CR>

" refresh
nnoremap <leader>g :GitGutter<CR>
nnoremap <leader>fm :set foldmethod=expr<CR>

" save/load
nnoremap <leader>vs :mkview!<CR>
nnoremap <leader>vl :loadview<CR>
nnoremap <leader>e :e<CR>gg
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

" window commands
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" other
nnoremap S :%s//g<Left><Left>
nnoremap <silent> <Space> :noh<CR>
nnoremap == gg=G``
nnoremap Y y$

" edit next \<++> tag (not including tags preceeded by a \
nnoremap <silent> <leader><Space> /\%(\\.*\)\@<!<++><CR>:noh<CR>zvc4l

" show the highlighting groups for the current word
nnoremap <C-S-L> :call <SID>SynStack()<CR>


" --- Insert Mode --- "
inoremap OO <CR><CR><Up>

inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

inoremap ;; ();<Left><Left>


" --- Command Mode --- "

" save as sudo with w!! "
cnoremap w!!<CR> execute 'silent! write !sudo tee % >/dev/null' <bar> edit!<CR>




" ############################################################################ "
" # AUTOMATIC COMMANDS # AUTOMATIC COMMANDS # AUTOMATIC COMMANDS ############# "
" ############################################################################ "

" custom file-typing
autocmd BufRead,BufNewFile *vifm set filetype=vim
autocmd BufRead,BufNewFile *.S set filetype=arm

" automatically delete trailing whitespace
autocmd BufWritePre * %s/\s\+$//e   " trailing spaces
autocmd BufWritePre * %s/\n\+\%$//e " trailing newlines
autocmd BufWritePre * %s/\%^\n\+//e " newlines at beginning

" refresh the gitgutter when saving
autocmd BufWritePre * GitGutter

" run xrdb whenever .Xresources is updated
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
" recompile dwmblocks whenever it is changed

" disable automatic commenting on new line
autocmd FileType * setlocal formatoptions-=cro

" toggle relative numbers when switching in and out of insert mode
augroup numbertoggle
    autocmd!
    autocmd InsertLeave * set relativenumber
    autocmd InsertEnter * set norelativenumber
augroup END

" toggle some settings when entering and leaving Goyo
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" use Goyo by default in mutt
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
"autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
"autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo \| x!<CR>
"autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo \| q!<CR>




" ############################################################################ "
" # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS ###### "
" ############################################################################ "

if has('nvim')
    " Install python support if it isn't installed already
    if !has("python3")
        exec "!python -m pip install --user pynvim"
    endif

    " Install vim-plug if it isn't installed already "
    if empty(glob("~/.config/nvim/autoload/plug.vim"))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.config/nvim/plugged')

else
    " Install vim-plug if it isn't installed already "
    if empty(glob("~/.vim/autoload/plug.vim"))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')

endif


" --- ui tweaks --- "
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree'
Plug 'vifm/vifm.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'ryanoasis/vim-devicons'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" --- usability --- "
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
" Plug 'vimwiki/vimwiki'

" --- operators --- "
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-commentary'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" --- syntax --- "
" Plug 'vim-syntastic/syntastic'
Plug 'frazrepo/vim-rainbow'
Plug 'dense-analysis/ale'

" --- language support --- "
Plug 'lervag/vimtex'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'ARM9/arm-syntax-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'kovetskiy/sxhkd-vim'
" Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'sophacles/vim-processing'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" --- markup previewers --- "
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()




" ############################################################################ "
" # PLUGIN CONFIG # PLUGIN CONFIG # PLUGIN CONFIG # PLUGIN CONFIG ############ "
" ############################################################################ "

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" gitgutter config
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^-'
let g:gitgutter_sign_removed_above_and_below = '{-'
let g:gitgutter_sign_modified_removed = '~-'

" vim-rainbow config
let g:rainbow_ctermfgs = ['cyan', 'blue', 'green', 'lightgreen', 'lightyellow', 'lightred', 'red', 'magenta', 'lightmagenta']

" vifm.vim config
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = "Vifm"
let g:vifm_embed_term = 1
let g:vifm_embed_split = 1

" deoplete config
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option({
            " \ })
