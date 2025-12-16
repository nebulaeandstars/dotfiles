set columns=86
autocmd VimResized * if (&columns > 86) | set columns=86 | endif

set wrap
set linebreak
set nolist
set spell
set showbreak=
set colorcolumn=0

nmap j gj
nmap k gk
vmap j gj
vmap k gk

inoremap ** **<Left>
inoremap __ __<Left>

hi link VimwikiLink Url
hi link VimwikiPre SpecialComment

hi link yamlComment SpecialComment

hi link yamlKeyValueDelimiter Delimiter
hi link yamlFlowIndicator Delimiter
hi link yamlFlowCollection Delimiter

hi link yamlBlockCollectionItemStart Operator
hi link yamlBlockMappingKey Type
