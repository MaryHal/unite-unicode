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

function! s:select(line)
endfunction

function! s:unite_source.gather_candidates(args, context)
    let filelist = unite#util#sort_by(unite#util#uniq(
                 \ map(split(globpath("/home/sanford/.vim/local/unite-unicode/data/", '*.txt'), '\n'),
                 \'[fnamemodify(v:val, ":t:r"), fnamemodify(v:val, ":p")]'), 'v:val[0]'),
                 \'v:val[0]')

    return map(filelist, '{
                \ "word": v:val[0],
                \ "source": "unicode",
                \ "kind": "unicode",
                \ "action__command": s:select(v:val[0]),
                \ "action__type": ": ",
                \ "action__path": v:val[1],
                \ "action__directory": fnamemodify(v:val[1], ":h"),
                \ }')
endfunction

function! unite#sources#unicode#define()
    return s:unite_source
endfunction

