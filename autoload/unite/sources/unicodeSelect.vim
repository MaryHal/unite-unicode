
let s:unite_source = {
            \ 'name': 'unicodeSelect',
            \ 'hooks': {},
            \ 'action_table': {'*': {}},
            \ }

function! s:unite_source.gather_candidates(args, context)
    let codeset = a:context.codeset
    echom codeset
    let unicode = readfile("/home/sanford/.vim/local/unite-unicode/data/" . codeset . ".txt")
    return map(unicode, '{
                \ "word": printf("%s", v:val),
                \ "source": "unicodeSelect",
                \ "kind": "unicodeSelect",
                \ }')
endfunction

function! unite#sources#unicodeSelect#define()
    return s:unite_source
endfunction

