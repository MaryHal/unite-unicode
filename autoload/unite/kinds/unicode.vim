let s:kind = {
            \ 'name': 'unicode',
            \ 'default_action': 'execute',
            \ 'action_table': {},
            \ 'parents': [],
            \ }

let s:kind.action_table.execute = {
            \ 'is_selectable': 1,
            \ }

function! s:kind.action_table.execute.func(candidates)
    for line in a:candidates
        let glyph = matchstr(line.word, ';\x\{4,5}')
        let writable = nr2char(str2nr(glyph[1:], 16))

        exe "norm i" . eval("\"" . writable . "\"")
        echo printf("%s %s", glyph, writable)
    endfor
endfunction

function! unite#kinds#unicode#define()
    return s:kind
endfunction

