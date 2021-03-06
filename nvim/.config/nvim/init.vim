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
" # PATH # PATH # PATH # PATH # PATH # PATH # PATH # PATH # PATH # PATH # #### "
" ############################################################################ "

if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

if empty($XDG_CACHE_HOME)  | let $XDG_CACHE_HOME  = $HOME.'/.cache'       | endif
if empty($XDG_CONFIG_HOME) | let $XDG_CONFIG_HOME = $HOME.'/.config'      | endif
if empty($XDG_DATA_HOME)   | let $XDG_DATA_HOME   = $HOME.'/.local/share' | endif

set runtimepath^=$XDG_CONFIG_HOME/nvim
set runtimepath+=$XDG_DATA_HOME/nvim
set runtimepath+=$XDG_CONFIG_HOME/nvim/after

set packpath^=$XDG_DATA_HOME/nvim,$XDG_CONFIG_HOME/nvim
set packpath+=$XDG_CONFIG_HOME/nvim/after,$XDG_DATA_HOME/nvim/after

let g:netrw_home = $XDG_DATA_HOME.'/nvim'
call mkdir($XDG_DATA_HOME.'/nvim/spell', 'p', 0700)
set viewdir=$XDG_DATA_HOME/nvim/view | call mkdir(&viewdir, 'p', 0700)

set backupdir=$XDG_CACHE_HOME/nvim/backup | call mkdir(&backupdir, 'p', 0700)
set directory=$XDG_CACHE_HOME/nvim/swap   | call mkdir(&directory, 'p', 0700)
set undodir=$XDG_CACHE_HOME/nvim/undo     | call mkdir(&undodir,   'p', 0700)

if !has('nvim') " Neonvim has its own special location
    set viminfofile=$XDG_CACHE_HOME/nvim/nviminfo
endif

set viewdir=$XDG_DATA_HOME/nvim/view | call mkdir(&viewdir, 'p', 0700)




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
runtime statusline.vim

let mapleader = ','

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set listchars=tab:\|\ ,precedes:\<,extends:\>
set list

set autoindent
set textwidth=80
set colorcolumn=+1

set wrap
set linebreak
set breakindent
set showbreak=>\  " do not remove this comment

" set autoformat options
set formatoptions+=crnv1jql
set formatoptions-=o
set formatoptions-=w
set formatoptions-=t

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
" # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS ###### "
" ############################################################################ "

" --- Install Plug --- "

" Install python support if it isn't installed already
if has('nvim')
    if !has('python3')
        exec '!python -m pip install --user pynvim'
        q
    endif
endif

" Install vim-plug if it isn't installed already "
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    PlugInstall --sync | source $MYVIMRC
    q
endif

call plug#begin('~/.config/nvim/plugged')


" --- ui tweaks --- "
Plug 'airblade/vim-gitgutter'
Plug 'vifm/vifm.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf'


" --- usability --- "

" completion engine
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" LSP client and linter
Plug 'dense-analysis/ale'

" smarter tabs
" Plug 'nebulaeandstars/vim-stabs'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" other
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'


" --- operators --- "
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-commentary'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'


" --- language support --- "
Plug 'ARM9/arm-syntax-vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'nebulaeandstars/vim-chapel'


" --- other --- "
Plug 'vimwiki/vimwiki'
Plug 'LukeSmithxyz/vimling'

call plug#end()




" ############################################################################ "
" # PLUGIN CONFIG # PLUGIN CONFIG # PLUGIN CONFIG # PLUGIN CONFIG ############ "
" ############################################################################ "

" --- gitgutter config --- "
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^-'
let g:gitgutter_sign_removed_above_and_below = '{-'
let g:gitgutter_sign_modified_removed = '~-'


" --- vifm.vim config --- "
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = 'Vifm'
let g:vifm_embed_term = 1
let g:vifm_embed_split = 1


" --- deoplete config --- "

" use yarp if using regular vim
if !has('nvim')
    call deoplete#custom#option({'yarp': v:true})
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = '$CARGO_HOME/bin/racer'
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <a-n> <c-n>
inoremap <a-n> <c-n>

call deoplete#custom#option({
            \ 'auto_complete_delay': 0,
            \ 'min_pattern_length': 1,
            \ })

call deoplete#custom#option('sources', {
            \ '_': [
            \ 'ultisnips',
            \ 'ale',
            \ 'omni',
            \ 'file',
            \ 'around',
            \ 'buffer',
            \ ]})

" source tags
call deoplete#custom#var('around', {
            \   'range_above': 20,
            \   'range_below': 20,
            \   'mark_above': '[↑]',
            \   'mark_below': '[↓]',
            \   'mark_changes': '[~]',
            \})
call deoplete#custom#source('ale', 'mark', '[A]')
call deoplete#custom#source('ultisnips', 'mark', '[S]')
call deoplete#custom#source('omni', 'mark', '[O]')
call deoplete#custom#source('file', 'mark', '[F]')
call deoplete#custom#source('buffer', 'mark', '[B]')

" source priorities
call deoplete#custom#source('buffer', 'rank', 0)
call deoplete#custom#source('around', 'rank', 1)
call deoplete#custom#source('file', 'rank', 2)
call deoplete#custom#source('omni', 'rank', 3)
call deoplete#custom#source('ale', 'rank', 4)
call deoplete#custom#source('ultisnips', 'rank', 5)


" --- ultisnips config --- "
let g:UltiSnipsExpandTrigger='<A-Enter>'
let g:UltiSnipsJumpForwardTrigger='<A-Space>'
let g:UltiSnipsJumpBackwardTrigger='<C-Space>'


" --- ALE config --- "
let g:ale_linters = {
            \ 'rust': ['rls'],
            \ 'c': ['ccls'],
            \ 'cpp': ['ccls'],
            \ 'go': ['$GOBIN/gopls'],
            \ 'python': ['pyls'],
            \ 'bash': ['bash-language-server', 'start'],
            \ 'sh': ['bash-language-server', 'start'],
            \ 'tex': ['texlab'],
            \ 'latex': ['texlab'],
            \ }

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%%code%](%linter%) %s'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'


" --- vim-rooter config --- "
let g:rooter_patterns = ['.git', 'Makefile', 'makefile', '.clang-format', 'Cargo.toml']
let g:rooter_change_directory_for_non_project_files = 'current'


" --- vimwiki config --- "

" use markdown syntax
" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{
            \'path': '~/.local/share/vimwiki/default',
            \'path_html': '~/.local/share/vimwiki/default/html',
            \'syntax': 'markdown',
            \'ext': '.md',
            \},{
            \'path': '~/.local/share/vimwiki/yypel',
            \'path_html': '~/.local/share/vimwiki/yypel/html',
            \}]

" only do vimwiki stuff in a vimwiki
let g:vimwiki_global_ext = 0




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

set undofile
set nobackup

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
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Handle pressing enter inside {} or <><>
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) ==? '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) ==? '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction


" --- Goyo --- "
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
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
    return v:folddashes . '| ' . l:line_text . repeat(' ', l:fillcharcount) . ' (' . l:folded_line_num . ' L)' . repeat(' ', 200)
endfunction


" ---- Custom text objects --- "
function! s:IndTxtObj(inner)
    let curline = line('.')
    let lastline = line('$')
    let i = indent(line('.')) - &shiftwidth * (v:count1 - 1)
    let i = i < 0 ? 0 : i
    if getline('.') =~? "^\\s*$"
        return
    endif
    let p = line('.') - 1
    let nextblank = getline(p) =~? "^\\s*$"
    while p > 0 && (nextblank || indent(p) >= i )
        -
        let p = line('.') - 1
        let nextblank = getline(p) =~? "^\\s*$"
    endwhile
    if (!a:inner)
        -
    endif
    normal! 0V
    call cursor(curline, 0)
    let p = line('.') + 1
    let nextblank = getline(p) =~? "^\\s*$"
    while p <= lastline && (nextblank || indent(p) >= i )
        +
        let p = line('.') + 1
        let nextblank = getline(p) =~? "^\\s*$"
    endwhile
    if (!a:inner)
        +
    endif
    normal! $
endfunction




" ############################################################################ "
" # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS # MAPPINGS ########## "
" ############################################################################ "

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
nnoremap <leader>ts :set spell!<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>tr :RainbowToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>o :Vifm<CR>
nnoremap <leader>tg :GitGutterToggle<CR>
nnoremap <leader>zg :GitGutterFold<CR>
nnoremap <leader>th :HardTimeToggle<CR>
nnoremap <leader>f :Goyo<CR>

" ALE
nnoremap <leader>a :ALEToggleBuffer<CR>
nnoremap <leader>d :ALEDetail<CR>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gh :ALEHover<CR>
nnoremap <leader>gr :ALERename<CR>

" vimling
nnoremap <leader>tl :call ToggleIPA() \| call ToggleDeadKeys()<CR>

" show/hide
nnoremap <leader>sf :set foldcolumn+=2<CR>
nnoremap <leader>hf :set foldcolumn-=2<CR>

nnoremap <leader>sg :GitGutterEnable<CR>
nnoremap <leader>hg :GitGutterDisable<CR>

nnoremap <leader>sc :set colorcolumn=+1<CR>
nnoremap <leader>hc :set colorcolumn=<CR>

" refresh
nnoremap <leader>g :GitGutter<CR>

" save/load
nnoremap <leader>vs :mkview!<CR>
nnoremap <leader>vl :loadview<CR>
nnoremap <leader>e :e<CR>gg
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>

" split navigation
nnoremap <A-S-h> <C-w>h
nnoremap <A-S-j> <C-w>j
nnoremap <A-S-k> <C-w>k
nnoremap <A-S-l> <C-w>l

" split resizing
nnoremap <silent> <A-C-h> :vertical resize +1<CR>
nnoremap <silent> <A-C-j> :resize -1<CR>
nnoremap <silent> <A-C-k> :resize +1<CR>
nnoremap <silent> <A-C-l> :vertical resize -1<CR>

" split opening
nnoremap <leader>tt :vnew term://zsh<CR>
nnoremap <leader>th <C-w>t<C-w>K
nnoremap <leader>tv <C-w>t<C-w>H

" other
nnoremap S :%s//g<Left><Left>
nnoremap <silent> <Space>, :noh<CR>
nnoremap == gg=G``
nnoremap Y y$
nnoremap Q gq

" compile and preview
nnoremap <leader>c :w \| !compile %:p &>/dev/null &<CR><CR>
nnoremap <leader>p :!preview %<CR>

" edit next \<++> tag (not including tags preceeded by a \
nnoremap <silent> g<Space> /\%(\\.*\)\@<!<++><CR>:noh<CR>zv"_c4l

" show the highlighting groups for the current word
nnoremap <C-S-L> :call <SID>SynStack()<CR>


" --- Visual Mode --- "

vnoremap . :normal .<CR>
vnoremap S :s//g<Left><Left>


" --- Insert Mode --- "
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap (( (
inoremap [[ [
inoremap {{ {
inoremap << <
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
augroup filetypedetect
    autocmd BufRead,BufNewFile *vifm set filetype=vim
    autocmd BufRead,BufNewFile *.S set filetype=arm

    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

    au! BufRead,BufNewFile */vimwiki/* set filetype=vimwiki
augroup END

" solve 'tabs vs spaces' debate by retabbing before reading and writing.
" requires a 'smart tabs' plugin
" augroup autoretab
" 	autocmd BufRead * silent execute 'RetabIndent'
" 	autocmd BufWritePre * silent execute 'set expandtab | RetabIndent'
" 	autocmd BufWritePost * silent execute 'set noexpandtab | RetabIndent'
" augroup END

" automatically delete trailing whitespace
augroup delete_whitespace
    autocmd BufWritePre * %s/\s\+$//e   " trailing spaces
    autocmd BufWritePre * %s/\n\+\%$//e " trailing newlines
    autocmd BufWritePre * %s/\%^\n\+//e " newlines at beginning
augroup END

" refresh the gitgutter when saving
augroup gitgutter
    autocmd BufWritePre * GitGutter
augroup END

" run xrdb whenever .Xresources is updated
augroup xrdb
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
augroup END

augroup autoformat
    " automatically format .rs, .c, and .cpp files
    autocmd BufWritePost *.rs silent execute "!rustfmt %" | edit
    " autocmd BufWritePost *.c,*.cpp silent execute "!clang-format -i --style=\"{IndentWidth: 4, TabWidth: 4, UseTab: Always}\" %" | edit
    autocmd BufWritePost *.c,*.cpp silent execute "!clang-format -i --style=\"{IndentWidth: 4}\" %" | edit
augroup END

" " toggle relative numbers when switching in and out of insert mode
" augroup numbertoggle
"     autocmd!
"     autocmd InsertLeave * set relativenumber
"     autocmd InsertEnter * set norelativenumber
" augroup END

augroup watchvimrc
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" toggle some settings when entering and leaving Goyo
augroup goyo_extras
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" use Goyo by default in mutt
augroup mutt
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
    autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
    autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo \| x!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo \| q!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* map <leader>wq :Goyo \| x!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* map <leader>q :Goyo \| q!<CR>
augroup END
