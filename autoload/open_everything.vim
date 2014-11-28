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

function! s:xdg_open(path) " {{{
  call system('xdg-open ' . shellescape(a:path) . ' >/dev/null 2>&1 &')
endfunction " }}}

function! s:file_exists(path) " {{{
  return filereadable(a:path) || isdirectory(a:path)
endfunction " }}}

" Opens a file either in vim or using 'xdg-open', depending on whether its
" a text file or not.
function! s:open_file(path) " {{{
  if system('file -sb --mime-type ' . shellescape(a:path)) =~ '^text\/.*$'
    if &modified
      echo 'refusing to leave current file: it has unwritten changes.'
      return
    endif

    execute 'edit ' . escape(a:path, '\ ')
  else
    call s:xdg_open(a:path)
  endif
endfunction " }}}

" Opens the file or URL under the cursor.
function! open_everything#open() " {{{
  let l:path_name = substitute(expand('<cfile>'), '^\~', $HOME, '')
  if empty(l:path_name)
    return
  endif

  if l:path_name =~ '\v^\/.*$' && s:file_exists(l:path_name)
    " Open a full file path.
    call s:open_file(l:path_name)
  elseif s:file_exists(expand('%:p:h') . '/' . l:path_name)
    " Open a file path relative to the pwd of the current file.
    call s:open_file(expand('%:p:h') . '/' . l:path_name)
  elseif l:path_name =~ '\v^\w+:\/\/(\w+\.)+(\w|[\.\-\/\?\%\=\#])+$'
    " Open a URL starting with a scheme, e.g http://github.com.
    call s:xdg_open(l:path_name)
  elseif l:path_name =~ '\v^www\.(\w+\.)+(\w|[\.\-\/\?\%\=\#])+$'
    " Open a URL starting with www.
    call s:xdg_open('http://' . l:path_name)
  elseif l:path_name =~ '\v^(\w|\-)+(\.(\w|\-)+)*\@(\w|\-)+(\.(\w|\-)+)+$'
    " Open an email address.
    call s:xdg_open('mailto:' . l:path_name)
  elseif l:path_name =~ '\v\c^.*\.h(c|pp|xx)?$'
    " Open a header file.
    normal! gf
  elseif !empty(taglist(l:path_name))
    " Open a Tag.
    execute 'tag ' . taglist(l:path_name)[0].name
  elseif l:path_name =~ '\v^(\w+\.)+(\w|[\.\-\/\?\%\=\#])+$'
    " Treat filepath as a URL.
    call s:xdg_open('http://' . l:path_name)
  else
    echo "unable to open '" . l:path_name . "'"
  endif
endfunction " }}}
