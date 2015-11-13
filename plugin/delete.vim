" vim-delete
" Author: Greg White
" Version: 0.1

function! s:getline()
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

function! s:getnumlines(input)
  let match = matchstr(a:input, '^\d\+')
  echo 'match = ' . match
  if match == ''
    return 0
  else
    return match
  endif
endfunction

function! s:getdirection(input)
  return a:input[len(a:input) - 1:]
endfunction

function! s:deletetargetline()
  let input = s:getline()
  let numlines = s:getnumlines(input)
  let dir = s:getdirection(input)
  if dir == 'j' || dir == 'k'
    call s:executedelete(numlines, dir)
    ''
  endif
endfunction

function! s:executedelete(numlines, dir)
  let sign = a:dir == 'j' ? 1 : -1
  let targetline = (sign * a:numlines) + line('.')
  let reg = s:getregister()
  execute ':' . targetline . 'd ' . reg
endfunction


" Returns the register to put the contents of the deleted line into
function! s:getregister()
  if exists('g:delete_no_register') && g:delete_no_register == 1
    return '_'
  elseif !exists('g:delete_default_register')
    return ''
  else
    return g:delete_default_register
  endif
endfunction

" Create the mappings
nnoremap <silent> <Plug>DeleteLine :<C-U>call <SID>deletetargetline()<CR>
if !exists("g:delete_no_mappings") || !g:delete_no_mappings
  nmap gd <Plug>DeleteLine
endif
