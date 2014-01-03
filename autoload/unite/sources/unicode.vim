let g:unite_unicode_loaded = 0
let g:unicodeData = readfile("/home/sanford/.vim/local/unite-unicode/data/unicode_trimmed.txt")

let s:unite_source = {
            \ 'name': 'unicode',
            \ 'hooks': {},
            \ 'action_table': {'*': {}},
            \ }

function! s:unite_source.hooks.on_init(args, context)
    " let s:beforecolor = get(g:, 'colors_name', 'default')
endfunction

function! s:unite_source.hooks.on_close(args, context)
    " if s:beforecolor == g:colors_name
    "     return
    " endif
    " execute s:colorscheme(s:beforecolor)
endfunction

function! s:printCharacter(line)
endfunction

function! s:unite_source.gather_candidates(args, context)
    let unicode = copy(g:unicodeData)
    return map(unicode, '{
                \ "word": printf("%s", v:val),
                \ "source": "unicode",
                \ "kind": "unicode",
                \ "action__command": s:printCharacter(v:val[0]),
                \ "action__type": ": ",
                \ }')
endfunction

function! unite#sources#unicode#define()
    return s:unite_source
endfunction

