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
" # SETTINGS # SETTINGS # SETTINGS # SETTINGS # SETTINGS # SETTINGS ########## "
" ############################################################################ "

" add language files here
filetype off
set runtimepath+=/usr/share/vim/vimfiles/ftplugin/lilypond.vim

" re-enable filetype
filetype indent plugin on
syntax on

set encoding=utf-8

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

" show line numbers
set number relativenumber

" no delay after pressing escape
set timeoutlen=1000 ttimeoutlen=0

" enable the mouse "
set mouse=a

" set cursor styles "
set guicursor=n:hor10,i-ci:ver10,r-cr:hor10,v:block

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

" reduce the delay after typing before the swapfile is written
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" highlight the current line and column
set cursorline
set cursorcolumn

augroup toggle_cursorline
    autocmd!
    autocmd InsertEnter * set nocursorline nocursorcolumn
    autocmd InsertLeave * set cursorline cursorcolumn
augroup END

" always display the status line, even if only one window is displayed
set laststatus=2

" set the command window height to 2 lines "
set cmdheight=1

" use the visual bell instead of beeping when doing something wrong
set visualbell

" disable the bell
set t_vb=


" ############################################################################ "
" # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS # PLUGINS ###### "
" ############################################################################ "

" --- Install Plug --- "

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
Plug 'mbbill/undotree'
Plug 'junegunn/fzf'

if has('nvim')
    Plug 'ap/vim-css-color'
endif

" --- usability --- "

" LSP client and linter
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" other
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

" --- operators --- "
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-sort-motion'
Plug 'inkarkat/vim-ReplaceWithRegister'

" --- language support --- "
Plug 'ARM9/arm-syntax-vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cespare/vim-toml'
Plug 'nebulaeandstars/vim-chapel'
Plug 'chr4/nginx.vim'
Plug 'gentoo/gentoo-syntax'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'elixir-editors/vim-elixir'
Plug 'justinmk/vim-syntax-extra'

" --- other --- "
" Plug 'vimwiki/vimwiki'
Plug 'LukeSmithxyz/vimling'
Plug 'Chiel92/vim-autoformat'

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

" --- ultisnips config --- "
let g:UltiSnipsExpandTrigger='<A-Enter>'
let g:UltiSnipsJumpForwardTrigger='<A-Space>'
let g:UltiSnipsJumpBackwardTrigger='<C-Space>'

" --- coc.nvim config --- "
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><A-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
command! CocToggle :call CocToggle()

let g:coc_snippet_next = '<a-space>'
let g:coc_snippet_prev = '<c-space>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" scroll inline floating documentation
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#scroll(1)
  nnoremap <silent><nowait><expr> <C-k> coc#float#scroll(0)
  inoremap <silent><nowait><expr> <C-j> "\<c-r>=coc#float#scroll(1, 2)\<cr>"
  inoremap <silent><nowait><expr> <C-k> "\<c-r>=coc#float#scroll(0, 2)\<cr>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#scroll(1)
  vnoremap <silent><nowait><expr> <C-k> coc#float#scroll(0)
endif

" --- vim-rooter config --- "
let g:rooter_patterns = ['.git', 'Makefile', 'makefile', '.clang-format', 'Cargo.toml', 'stack.yaml']
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

" --- goyo & limelight config --- "

let g:goyo_width = 81
let g:goyo_height = 85
let g:goyo_linenr = 0

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

let g:limelight_paragraph_span = 0

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

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

command! CheckHighlightUnderCursor echo {l,c,n ->
        \   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
        \  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
        \  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
        \ }(line("."), col("."), "name")

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

" get around Goyo not quitting properly
cabbrev wq :w<cr>:call Quit()<cr>
cabbrev q :call Quit()<cr>
function! Quit()
    if exists('#goyo')
        Goyo
    endif
    quit
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

" use space to enter command mode
nnoremap <Space> :

" toggle
nnoremap <leader>ts :set spell!<CR>
nnoremap <leader>tr :RainbowToggle<CR>
nnoremap <leader>u  :UndotreeToggle<CR>
nnoremap <leader>o  :Vifm<CR>
nnoremap <leader>tg :GitGutterToggle<CR>
nnoremap <leader>zg :GitGutterFold<CR>

" show/hide
nnoremap <leader>sf :set foldcolumn+=2<CR>
nnoremap <leader>hf :set foldcolumn-=2<CR>

nnoremap <leader>sg :GitGutterEnable<CR>
nnoremap <leader>hg :GitGutterDisable<CR>

nnoremap <leader>sc :set colorcolumn=+1<CR>
nnoremap <leader>hc :set colorcolumn=<CR>

nnoremap <leader>ss :set spell<CR>
nnoremap <leader>hs :set nospell<CR>

" coc.nvim
nnoremap <leader>a :call CocToggle()<CR>
nmap <leader>d  <plug>(coc-diagnostic-info)
nmap <leader>n  <plug>(coc-diagnostic-next)
nmap <leader>gd <plug>(coc-definition)
nmap <leader>gi <plug>(coc-implementation)
nmap <leader>rn <plug>(coc-rename)
nmap <leader>gr <plug>(coc-refactor)
nmap <leader>gc <plug>(coc-refactor)
nmap <leader>gf <plug>(coc-fix-current)

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Alignment
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vimling
nnoremap <leader>tl :call ToggleIPA() \| call ToggleDeadKeys()<CR>

" save/load
nnoremap <leader>vs :mkview!<CR>
nnoremap <leader>vl :loadview<CR>
nnoremap <leader>e  :e<CR>gg
nnoremap <leader>w  :w<CR>
nnoremap <leader>q  :call Quit()<CR>

" split opening
nnoremap <leader>tt :vnew term://zsh<CR>
nnoremap <leader>so :split<CR>
nnoremap <leader>sh :new %<CR>
nnoremap <leader>sv :vnew %<CR>

" split manipulation
nnoremap <leader>sgh <C-w>t<C-w>K
nnoremap <leader>sgv <C-w>t<C-w>H

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

" tab opening
nnoremap <leader>to :TabVifm<CR>

" tab navigation
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

" other
nnoremap S :%s//g<Left><Left>
nnoremap <silent> <leader><Space> :noh<CR>
nnoremap == gg=G``
nnoremap Y y$
nnoremap Q gq

" compile and preview
nnoremap <leader>c :w \| !compile %:p &>/dev/null &<CR><CR>
nnoremap <leader>pp :w \| !preview %<CR><CR>
nnoremap <leader>pr :w \| vnew term://preview %<CR>
nnoremap <leader>pt :w \| vnew term://preview-test % <CR>

" edit next \<++> tag (not including tags preceeded by a \)
nnoremap <silent> g<Space> /\%(\\.*\)\@<!<++><CR>:noh<CR>zv"_c4l

" show the highlighting groups for the current word
" nnoremap <C-S-L> :call <SID>SynStack()<CR>
nnoremap <C-S-L> :CheckHighlightUnderCursor<CR>

" --- Visual Mode --- "

vnoremap . :normal .<CR>
vnoremap S :s//g<Left><Left>

" --- Insert Mode --- "
inoremap () ()<C-g>U<Left>
inoremap {} {}<C-g>U<Left>
inoremap [] []<C-g>U<Left>
inoremap <> <><C-g>U<Left>
inoremap ()) ()
inoremap {}} {}
inoremap []] []
inoremap <>> <>

inoremap ;; ();<C-g>U<Left><C-g>U<Left>

inoremap "" ""<C-g>U<Left>
inoremap '' ''<C-g>U<Left>
inoremap `` ``<C-g>U<Left>

" --- Command Mode --- "

" save as sudo with w!! "
cnoremap w!!<CR> execute 'silent! write !sudo tee % >/dev/null' <bar> edit!<CR>
cnoremap run vnew term://


" ############################################################################ "
" # AUTOMATIC COMMANDS # AUTOMATIC COMMANDS # AUTOMATIC COMMANDS ############# "
" ############################################################################ "

" custom file-typing
augroup filetype_detect
    autocmd!
    autocmd BufRead,BufNewFile *vifm set filetype=vim
    autocmd BufRead,BufNewFile *.S set filetype=arm
    autocmd BufRead,BufNewFile *.asm set filetype=nasm

    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

    au! BufRead,BufNewFile */vimwiki/* set filetype=vimwiki
augroup END

" automatically delete trailing whitespace
augroup delete_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e   " trailing spaces
    autocmd BufWritePre * %s/\n\+\%$//e " trailing newlines
    autocmd BufWritePre * %s/\%^\n\+//e " newlines at beginning
augroup END

" refresh the gitgutter when saving
augroup gitgutter_refresh
    autocmd!
    autocmd BufEnter,BufWritePre * GitGutter
augroup END

augroup goyo_limelight
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

if expand('%:p:h:h:t') !=# 'suckless'
    augroup autoform:tat
        autocmd!
        autocmd BufWrite *.rs,*.c,*.h,*.cpp,*.cs,*.py,*.go :Autoformat
    augroup END
endif

augroup autoreload
    autocmd!
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
    autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END
