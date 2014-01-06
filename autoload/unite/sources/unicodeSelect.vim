
let s:unite_source = {
            \ 'name': 'unicodeSelect',
            \ 'hooks': {},
            \ 'action_table': {'*': {}},
            \ }

function! s:unite_source.gather_candidates(args, context)
    let codeset = a:context.codeset

    let thispath = expand('<sfile>:p:h')
    let filepath = thispath . "/../../../data/" . codeset . ".txt"

    let unicode = readfile(filepath)

    return map(unicode, '{
                \ "word": printf("%s", v:val),
                \ "source": "unicodeSelect",
                \ "kind": "unicodeSelect",
                \ }')
endfunction

function! unite#sources#unicodeSelect#define()
    return s:unite_source
endfunction

