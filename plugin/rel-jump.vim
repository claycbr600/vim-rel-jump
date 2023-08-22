" rel-jumps.vim - Turn range up and down movements into jump motions
" Maintainer:  Bastian Winkler <buz@netbuz.org>
" Version:     1.1
" License:     The same as vim itself

if exists('g:loaded_rel_jump')
    finish
endif
let g:loaded_rel_jump = 1

if !exists('g:rel_jump_min_distance')
    let g:rel_jump_min_distance = 2
endif

if !exists('g:rel_jump_first_char')
    let g:rel_jump_first_char = 0
endif

function! RelJump(key)
    let distance = v:count1
    if distance >= g:rel_jump_min_distance
	exec "normal! m'"
    endif
    exec "normal! ".distance.a:key
    if g:rel_jump_first_char && distance >= g:rel_jump_min_distance
	exec "normal! ^"
    endif
endfunction

nnoremap <expr> <silent> j v:count == 0 ? 'gj' : ":<C-U>call RelJump('j')<CR>"
nnoremap <expr> <silent> k v:count == 0 ? 'gk' : ":<C-U>call RelJump('k')<CR>"
