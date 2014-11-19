" Copyright (c) 2014 Alexander Heinrich <alxhnr@nudelpost.de> {{{
"
" This software is provided 'as-is', without any express or implied
" warranty. In no event will the authors be held liable for any damages
" arising from the use of this software.
"
" Permission is granted to anyone to use this software for any purpose,
" including commercial applications, and to alter it and redistribute it
" freely, subject to the following restrictions:
"
"    1. The origin of this software must not be misrepresented; you must
"       not claim that you wrote the original software. If you use this
"       software in a product, an acknowledgment in the product
"       documentation would be appreciated but is not required.
"
"    2. Altered source versions must be plainly marked as such, and must
"       not be misrepresented as being the original software.
"
"    3. This notice may not be removed or altered from any source
"       distribution.
" }}}

if exists('g:loaded_open_everything')
  finish
endif
let g:loaded_open_everything = 1

if !executable('xdg-open')
  echomsg "open_everything.vim: failed to find the program 'xdg-open'."
  finish
endif

if !executable('file')
  echomsg "open_everything.vim: failed to find the program 'file'."
  finish
endif

let s:ignore_filetypes =
  \ {
  \   'qf' : 1,
  \ }

if !exists('g:open_everything#key')
  let g:open_everything#key = '<CR>'
endif

function! s:setup_mappings() " {{{
  if &buftype == 'nofile'
    return
  elseif has_key(s:ignore_filetypes, &filetype)
    return
  elseif exists('g:open_everything#ignore_filetypes')
    \ && has_key(g:open_everything#ignore_filetypes, &filetype)
    return
  endif

  execute 'nnoremap <silent><buffer> ' . g:open_everything#key
    \ . ' :call open_everything#open()<CR>'
  setlocal isfname+=?,@-@

  if &filetype == 'help'
    setlocal isfname+=:,'
  endif
endfunction " }}}

augroup open_everything
  autocmd!
  autocmd BufNewFile,BufRead * call s:setup_mappings()
augroup END
