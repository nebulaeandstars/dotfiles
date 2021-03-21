set tabstop=2
set softtabstop=2
set shiftwidth=2

set formatoptions+=t

let g:pdf_viewer = 'zathura'

let g:file = expand('%:p')
let g:pdf = expand('%:p:r') . ".pdf"
let g:out = expand('%:p:r')

function! LilypondPreview()
    " compile the pdf from this file, then start the pdf viewer "
    silent execute '!lilypond' '-o ' g:out g:file
    silent execute '!' g:pdf_viewer g:pdf '&>/dev/null &'
endfunction

" on exit, remove the pdf as it is no longer needed "
autocmd VimLeave *.ly execute '!rm' g:pdf

" when saving, also recompile the pdf.  This should update the viewer automatically "
autocmd BufWrite *.ly silent execute '!lilypond' '-o ' g:out g:file '&>/dev/null &'

nmap <C-p> :call LilypondPreview()<CR>
