set wrap
set linebreak
set nolist
set spell

let g:section_heading = '^== '
let g:section_heading_top_gap = 2
let g:section_heading_bottom_gap = 0
let g:subsection_heading = '^=== '

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
