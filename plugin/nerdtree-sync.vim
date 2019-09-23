function! NERDTreeIsOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1) && g:NERDTree.IsOpen()
endfunction

function! NERDTreeSync()
  if &modifiable && !&diff && NERDTreeIsOpen() && strlen(expand('%')) > 0 && bufname('%') !~# "^NERD_tree_"
    NERDTreeFind
    setlocal cursorline
    wincmd p
  endif
endfunction

" Auto sync
autocmd bufenter * call NERDTreeSync()

