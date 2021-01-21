let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
set nofoldenable
"LEADER
let mapleader=";"
"be focus
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
"高亮
syntax enable
syntax on
"fold
set foldmethod=indent
set foldmethod=syntax
"compatible
set nocompatible
"distinguish file
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"mouse
"set mouse=a
set encoding=utf-8
"显示行号
set number
"显示相对行号
"set relativenumber
"自动换行
set wrap
"在合适的位置换行
set linebreak
"tab菜单栏提示
set wildmenu
"cursor提醒
set cursorline
set cursorcolumn
"show status
set laststatus=2
set ruler
"高亮搜索
set hlsearch
"搜索完成后取消高亮
exec "nohlsearch"
"增强搜索
set incsearch
"ignore case
set ignorecase
"indent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
"show chars
set list
set listchars=tab:»■,trail:■
"dir
set autochdir
"colorscheme
colorscheme solarized
set background=dark
set scrolloff=5
"open with latest cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"--------Common--------------------
map q :q<CR>
map <LEADER>e :e 
map <LEADER>s :w<CR>
map <LEADER>r <C-r>
map <LEADER>v <C-v>
map go G
map gh 0
map gl $
noremap <silent>- :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent>= :call smooth_scroll#up(&scroll, 0, 2)<CR>

""signature
nnoremap \[ ]`
nnoremap \] [`
"fold
map zz za
map zm zM
map zr zR
"ycm
nnoremap gt :YcmCompleter GoTo
"Repalce-Function(local file replace)
function! Replace(string,replace)
    let flag = 'gec'
    let search = escape(a:string, '/\.*$^~[')
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
nnoremap ? :call Replace(input('Repalce: '),input('with: '))<CR>

"--------SplitScreen---------------
map s<right> :set splitright<CR>:vsplit<CR>
map s<left> :vsplit<CR>
map s<down> :set splitbelow<CR>:split<CR>
map s<up> :split<CR>
map sj <C-w>j
map sk <C-w>k
map sh <C-w>h
map sl <C-w>l
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
"--------New Tab-------------------
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
"--------Cpp-enhanced-highlight---
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let g:cpp_concepts_highlight=1
"--------Tagbar&Ctags-------------
" autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_position='leftabove'
let g:tagbar_height=15
let g:tagbar_compact=1
let g:tagbar_sort=0
let g:tagbar_map_togglesort =''

let g:tagbar_type_c = {
    \ 'kinds' : [
        \ 'h:header files:1:0',
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 's:structs',
        \ 'u:unions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'f:functions',
        \ 'l:local_variables:0:0',
        \ 'x:external_and_forward_variable_declarations:0:0',
        \ '?:unknown',
    \ ],
\ }

let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'h:header files:1:0',
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'l:local_variables:0:0',
        \ 'x:external_and_forward_variable_declarations:0:0',
        \ '?:unknown',
    \ ],
\ }
"--------NERDTree-----------------
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=3
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeWinPos="left"
let NERDTreeWinSize=24
let NERDTreeMapChangRoot="c"
" let g:nerdtree_tabs_open_on_console_startup=1

" autocmd VimEnter * if argc() == 1 && !exists('s:std_in') | NERDTree | wincmd p |endif

" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"--------You complete me----------
set completeopt-=preview
let g:ycm_complete_in_comments=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_use_clangd=1
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path=exepath("clangd")
let g:ycm_clangd_args=['-std=c++11','-stdlib=libc++']
"--------win-layout---------------
function! Win_Layout()
    execute 'NERDTreeToggle'
    execute 'TagbarToggle'
    execute "norm \<C-w>l"
endfunction
nnoremap <F5> :call Win_Layout()<CR>
"--------lightline----------------
let g:lightline = {
    \'colorscheme' : 'powerline'
    \}
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }
"--------buffet-------------------
nnoremap bn :enew<CR>
nnoremap bd :bdelete<CR>
nnoremap bj :bn<CR>
nnoremap bk :bp<CR>
nnoremap b1 :b1<CR>
nnoremap b2 :b2<CR>
nnoremap b3 :b3<CR>
nnoremap b4 :b4<CR>
nnoremap b5 :b5<CR>
nnoremap b6 :b6<CR>
nnoremap b7 :b7<CR>
nnoremap b8 :b8<CR>
nnoremap b9 :b9<CR>
nnoremap b0 :b0<CR>
let g:buffet_show_index=1
let g:buffet_use_devicons=1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

"--------Plugs--------------------
call plug#begin('~/.vim/plugged')
Plug 'altercation/solarized'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ycm-core/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kshenoy/vim-signature'
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'bagrat/vim-buffet'
call plug#end()

