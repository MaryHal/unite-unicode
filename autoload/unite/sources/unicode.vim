
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
    " echo a:line
    " let v = printf("\\u%s", c)
    " normal! "=printf("%s", v)<C-M>p
endfunction

function! s:unite_source.gather_candidates(args, context)
    " [(name, path)]
    " e.g. [('adaryn', '/Users/ujihisa/.vimbundles/ColorSamplerPack/colors/adaryn.vim'), ...]
    " let colorlist = unite#util#sort_by(unite#util#uniq(
    "             \ map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'),
    "             \'[fnamemodify(v:val, ":t:r"), fnamemodify(v:val, ":p")]'), 'v:val[0]'),
    "             \'v:val[0]')

    " let list = readfile("/home/sanford/.vim/local/unite-unicode/data/unicode.txt")
    let unicode = readfile("/home/sanford/.vim/local/unite-unicode/data/unicode_small.txt")
    " let unicode = []
    " for line in list
    "     call add(unicode, line)
    " endfor

    " "action__type" is necessary to avoid being added into cmdline-history.
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

