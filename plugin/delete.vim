" vim-delete
" Author: Greg White
" Version: 0.1

function! s:getinput()
  let c = s:getchar()
  while c =~ '^\d\+$'
    let c .= s:getchar()
  endwhile
  return c
endfunction

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! s:deletetargetline()
  let input = s:getinput()
  let numlines = input[0:(len(input) - 2)]
  let dir = input[len(input) - 1:]
  execute ':' . (line('.') + ((dir == 'k' ? -1 : 1) * numlines)) . 'd'
  ''
endfunction

" Create the mappings
nnoremap <silent> <Plug>DeleteLine :<C-U>call <SID>deletetargetline()<CR>
if !exists("g:delete_no_mappings") || !g:delete_no_mappings
  nmap gd <Plug>DeleteLine
endif
