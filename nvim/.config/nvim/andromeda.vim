" andromeda - A clean airline theme!
" vim: tw=80 et sw=2 ts=2

" Colors {{{
let s:black       = ['#2d2d2d', 236]
let s:brightblack     = ['#616161', 238]
let s:gray     = ['#3e3e3e', 237]
let s:brightgray      = ['#999990', 249]
let s:brightred     = ['#ff9999', 217]
let s:brightyellow = ['#eeeeaa', 222]
let s:red       = ['#ff9999', 203]
let s:brightcyan         = ['#aaeeee', 116]
let s:yellow      = ['#eeee55', 179]
"}}}

" Init {{{
" Translate color defs to airline format
fun! s:gen_def(fg, bg)
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfun
let s:bar_main = s:gen_def(s:brightgray, s:gray) + ['']
let g:airline#themes#andromeda#palette = {}
"}}}

" Normal mode {{{
let s:airline_a_normal = s:gen_def(s:black, s:brightred)
let s:airline_c_normal = s:gen_def(s:brightred, s:brightblack)
let g:airline#themes#andromeda#palette.normal =
      \ airline#themes#generate_color_map(s:airline_a_normal
      \ , s:bar_main, s:airline_c_normal)
"}}}

" Insert mode {{{
let s:airline_a_insert = s:gen_def(s:black, s:brightyellow)
let s:airline_c_insert = s:gen_def(s:brightyellow, s:brightblack)
let g:airline#themes#andromeda#palette.insert =
      \ airline#themes#generate_color_map(s:airline_a_insert
      \ , s:bar_main, s:airline_c_insert)
"}}}

" Visual mode {{{
let s:airline_a_visual = s:gen_def(s:black, s:brightcyan)
let s:airline_c_visual = s:gen_def(s:brightcyan, s:brightblack)
let g:airline#themes#andromeda#palette.visual =
      \ airline#themes#generate_color_map(s:airline_a_visual
      \ , s:bar_main, s:airline_c_visual)
"}}}

" Replace mode {{{
let s:airline_a_replace = s:gen_def(s:black, s:red)
let s:airline_c_replace = s:gen_def(s:red, s:brightblack)
let g:airline#themes#andromeda#palette.replace =
      \ airline#themes#generate_color_map(s:airline_a_replace
      \ , s:bar_main, s:airline_c_replace)
"}}}

" Inactive color {{{
let s:airline_inactive = s:gen_def(s:brightgray, s:brightblack)
let g:airline#themes#andromeda#palette.inactive =
      \ airline#themes#generate_color_map(s:airline_inactive
      \ , s:airline_inactive, s:airline_inactive)
"}}}

" Global colors {{{
let s:tmp = {'normal_modified': {}, 'insert_modified': {}
      \, 'visual_modified': {}, 'replace_modified': {}}

for mode in keys(s:tmp)
  let s:tmp[mode]['airline_c'] = s:airline_c_insert
endfor
call extend(g:airline#themes#andromeda#palette, s:tmp)

let s:warning = s:gen_def(s:black, s:yellow)
for mode in keys(g:airline#themes#andromeda#palette)
  if mode == 'accents'
    continue
  endif
  let g:airline#themes#andromeda#palette[mode]['airline_warning'] = s:warning
endfor
"}}}
