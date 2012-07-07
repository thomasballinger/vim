runtime! syntax/tex.vim
unlet b:current_syntax

syntax include @nowebR syntax/r.vim
syntax region nowebChunk start="^<<.*>>=" end="^@" contains=@nowebR
syntax region Sexpr  start="\\Sexpr{"  end="}" keepend
hi Sexpr gui=bold guifg=chocolate2
echo hello

let b:current_syntax="noweb"  
