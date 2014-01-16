
" Bundle Settings {{{
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Basic plugin"{{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'syui/wauto.vim'

NeoBundleLazy 'Shougo/vimshell', {
            \ 'autoload' : { 'filetypes' : ['vimshell'] }}
NeoBundleLazy 'Shougo/neocomplcache'
NeoBundleLazy 'Shougo/neosnippet.vim'
NeoBundleLazy 'Shougo/neosnippet-snippets'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundleLazy 'osyo-manga/vim-over'
NeoBundleLazy 'tpope/vim-surround'
NeoBundleLazy 'kien/ctrlp.vim'
NeoBundleLazy 'thinca/vim-ref', {
            \ 'autoload' : { 'commands' : ['Ref'] }}
"}}}

" For each filetype plugin"{{{
" markdown
NeoBundleLazy 'tpope/vim-markdown', {
            \ 'autoload' : { 'filetypes' : ['md'] }}
NeoBundleLazy 'suan/vim-instant-markdown', {
            \ 'autoload' : { 'filetypes' : ['md'] }}

" scala
NeoBundleLazy 'derekwyatt/vim-scala', {
            \ 'autoload' : { 'filetypes' : ['scala'] }}

" Haskell
NeoBundleLazy 'dag/vim2hs', {
            \ 'autoload' : { 'filetypes' : ['hs'] }}
NeoBundleLazy 'eagletmt/ghcmod-vim', {
            \ 'autoload' : { 'filetypes' : ['hs'] }}
NeoBundleLazy 'pbrisbin/html-template-syntax', {
            \ 'autoload' : { 'filetypes' : ['hs'] }}
NeoBundleLazy 'eagletmt/neco-ghc', {
            \ 'autoload' : { 'filetypes' : ['hs'] }}
NeoBundleLazy 'eagletmt/unite-haddock', {
            \ 'autoload' : { 'filetypes' : ['hs'] }}

" HTML 
NeoBundleLazy 'othree/html5.vim', {
            \ 'autoload' : { 'filetypes' : ['html'] }}
NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \ 'autoload' : { 'filetypes' : ['css'] }}
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload' : { 'filetypes' : ['html', 'css'] }}

"}}}

" Colorschemes"{{{
NeoBundleLazy 'fugalh/desert.vim'
NeoBundleLazy 'nanotech/jellybeans.vim'
NeoBundleLazy 'tomasr/molokai'
NeoBundleLazy 'altercation/vim-colors-solarized'
"}}}

filetype plugin indent on
" }}}

" Basic Settings {{{
"" Release keymappings for plug-in.
nnoremap ; <Nop>
xnoremap ; <Nop>
nnoremap m <Nop>
xnoremap m <Nop>
nnoremap , <Nop>
xnoremap , <Nop>
"" Editing .vimrc
nnoremap <Space>ev :tabnew $HOME/.vimrc<CR>
nnoremap <Space>rv :source $HOME/.vimrc<CR>
"" Keybind call help
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
"" No create swp file
set noswapfile
"" Share clipboard for other application
set clipboard=unnamed,autoselect
"" foldclose marker
nnoremap <Space>fc :<C-u>%foldclose<CR>
" }}}

" Move Settings {{{
:noremap k gk
:noremap j gj
:noremap gk k
:noremap gj j
:noremap <Down> gj
:noremap <Up> gk
:noremap <Space>h ^
:noremap <Space>l $
:noremap <Space>/ *
:noremap <Space>m %
:noremap ; :
:noremap : ;
" }}}

" Apperance Settings {{{
"" File format
:set number
:set cursorline
:set list
:set listchars=eol:$,tab:▸\ 

"" Colors
set background=dark
colorscheme desert
" }}}

" Edit Settings"{{{
" Smart insert tab setting.
set smarttab
" Excahnge tab to space.
set expandtab
" Round indent by shiftwidth.
set shiftwidth=4
set shiftround
"" Tab space
set tabstop=4
set scrolloff=20
"" Format keybind
nnoremap <Space>fm gg=G
"}}}

" Encode Settings {{{
"" File encoding
set encoding=utf-8
" }}}

" Window Settings {{{
"" Splitting a window will put the new window below the current one.
set splitbelow
"" Splitting a window will put the new window right the current one.
set splitright
"" Set minimal width for current window.
set winwidth=30
"" Set minimal height for current window.
"" set winheight=20
set winheight=1
"" Set maximam maximam command line window.
set cmdwinheight=5
"" No equal window size.
set noequalalways
"" Adjust window size of preview and help.
set previewheight=8
set helpheight=12
" }}}

" Search Settings {{{
"" Repace command shotcut
cnoreabb <expr>s getcmdtype()==':' && getcmdline()=~'^s' ? '%s/<C-r>=Eat_whitespace(''\s\\|;\\|:'')<CR>' : 's'

function! Eat_whitespace(pat) 
    let c = nr2char(getchar(0))
    if c=~a:pat
        return ''
    elseif c=~'\r'
        return ''
    end
    return c
endfunction
" }}}

" Plugin Settings:"{{{

" unite"{{{
" Settings
let g:unite_enable_start_insert=1
let g:unite_winheight = 20
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_split_rule = 'topleft'
" Keybind
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <Space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <Space>uy :<C-u>Unite history/yank<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"}}}

" unite-outline"{{{
" unite-outline Keybind
let g:unite_split_rule = 'botright'
nnoremap <silent> <Space>uo :Unite -vertical -no-quit -winwidth=40 outline<Return>
"}}}

" vimfiler"{{{
" Settings
let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
" Keybind
nnoremap <silent> <Space>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Space>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"}}}

" neocomplcashe"{{{
" Settings
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }

" Key-mappings
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"}}}

" neosnippet"{{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"}}}

" vim-quickrun{{{
" Key-mappings
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
            \ 'outputter':'browser'
            \ }
" }}}

" vim-instant-markdown{{{
let g:instant_markdown_autostart = 0
" }}}

" wauto{{{
" Settings
let g:auto_write = 0
" Key-mappings
nmap <Leader>s  <Plug>(AutoWriteStart)
nmap <Leader>ss <Plug>(AutoWriteStop)
" }}}

" scrround{{{
" }}}

" lightline{{{
set laststatus=2
set t_Co=256
" Settings
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode'
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}}

" vim-over{{{
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'
" lounch over
nnoremap <silent> <Space>m :OverCommandLine<CR>
" Word string replace
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" Yank string replace
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}

" emmet-vim {{{
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
            \ 'lang' : 'ja',
            \ 'html' : {
            \ 'filters' : 'html',
            \ },
            \ 'css' : {
            \ 'filters' : 'fc',
            \ },
            \ 'php' : {
            \ 'extends' : 'html',
            \ 'filters' : 'html',
            \ },
            \}
augroup EmmitVim
    autocmd!
    autocmd FileType * let g:user_emmet_settings.indentation = ' '[:&tabstop]
augroup END
" }}}

" open-browser"{{{
" URL open is under cousol
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" Search word to google
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"}}}

" }}}

" vim:set foldmethod=marker:
