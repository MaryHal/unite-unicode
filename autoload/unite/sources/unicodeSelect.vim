
let s:unite_source = {
            \ 'name': 'unicodeSelect',
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
    let codeset = a:context.codeset
    echom codeset
    let unicode = readfile("/home/sanford/.vim/local/unite-unicode/data/" . codeset . ".txt")
    return map(unicode, '{
                \ "word": printf("%s", v:val),
                \ "source": "unicodeSelect",
                \ "kind": "unicodeSelect",
                \ "action__command": s:printCharacter(v:val[0]),
                \ "action__type": ": ",
                \ }')
endfunction

function! unite#sources#unicodeSelect#define()
    return s:unite_source
endfunction

