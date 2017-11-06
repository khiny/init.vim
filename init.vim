" plug {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/chazy/cscope_maps.git'
"Plug 'Shougo/vimfiler.vim'
"Plug 'romgrk/vimfiler-prompt'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
"Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/denite.nvim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
  Plug 'zchee/libclang-python3'
  Plug 'Shougo/neoinclude.vim'
else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'majutsushi/tagbar'
Plug 'hecal3/vim-leader-guide'
Plug 'Yggdroot/indentLine'
call plug#end()
"}}}

" my setting {{{
let mapleader = ","
inoremap jk <esc>
noremap ; :
"nmap <leader>v :edit $MYVIMRC<CR>
map <leader>z [{V]}zf
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

inoremap <Up>       <C-O>gk
inoremap <Down>     <C-O>gj
inoremap <S-Up>     <C-O>vgk<C-G>
inoremap <S-Down>   <C-O>vgj<C-G>
snoremap <S-Up>     <C-O>gk
snoremap <S-Down>   <C-O>gj

set number              " show line numbers
set rnu
set showmatch           " highlight matching [{()}]
set ignorecase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set smartindent
au Bufenter *.\(c\|cpp\|h\) set et
set nobackup
set fenc=utf-8
"set fencs=utf-8,cp949,euc-kr
"set fencs=utf-8
"set encoding=utf-8
set cursorline          " highlight current line
""set wildmenu            " visual autocomplete for command menu
set nohlsearch
set backspace=indent,eol,start

if filereadable("./cscope.out")
  cs add ./cscope.out
elseif filereadable("./GTAGS")
  set csprg=gtags-cscope
  cs add ./GTAGS
endif

set foldmethod=marker
set foldlevel=0
set modelines=1

"packadd vimball
set rtp+=~/.fzf

"set background=dark
colorscheme PaperColor

au GUIEnter * simalt ~x
set clipboard=unnamed
set laststatus=2
set viminfo+=!
set list listchars=tab:»\ ,trail:·

augroup XML
  autocmd!
  autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

set mouse=a
"}}}
" tab {{{
"" http://qiita.com/wadako111/items/755e753677dd72d8036d
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " ?Ȫ˫??֫髤????????

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 ??1?????Ϋ??֡?t2 ??1??��??2???ͪΫ??֪˫???????

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc ?檷?????֪??????Ӫ??ª?
map <silent> [Tag]x :tabclose<CR>
" tx ???֪??ͪ???
map <silent> [Tag]n :tabnext<CR>
" tn ???Ϋ???
map <silent> [Tag]p :tabprevious<CR>
" tp ???Ϋ???
"}}}

" NERDTree {{{
"map <leader>q :VimFilerExplore<CR>
map <leader>q :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
" }}}
" vimfiler {{{
"map <leader>q :VimFilerExplore<CR>:VimFilerPrompt<CR>
" }}}
" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
map <SPACE> <Plug>(easymotion-s2)
"n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" }}}
" gitgutter {{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
" Tagbar {{{
nnoremap <leader>t :TagbarToggle<CR>
" }}}
" airline {{{
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
let g:airline_left_sep=''
let g:airline_right_sep=''
"if !exists('g:airline_symbols')
  let g:airline_symbols = {}
"endif
"set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
" }}}
" mark {{{
let g:mwDefaultHighlightingPalette = 'maximum'
" }}}
" unite {{{
nnoremap <silent> <leader>bf :<C-u>Unite file file_rec/async:vendor/qcom/proprietary/camx/ file_rec/async:vendor/qcom/proprietary/camx-lib/ file_rec/async:vendor/qcom/proprietary/chi-cdk/<CR>
"nnoremap <leader>f :<C-u>Unite file file_rec/async:vendor/qcom/proprietary/mm-3a-core/ file_rec/async:vendor/qcom/proprietary/mm-camerasdk/ file_rec/async:vendor/qcom/proprietary/mm-camera/mm-camera2/ file_rec/async:vendor/qcom/proprietary/mm-camera-core file_rec/async:hardware/qcom/camera file_rec/async:kernel/msm-3.18/drivers/media/platform/msm/camera_v2 file_rec/async:kernel/msm-3.18/include/media<CR>
nnoremap <silent> <leader>bb :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> <leader>bo :<C-u>Unite outline<CR><C-w><S-_>
nnoremap <silent> <leader><Space> :Unite grep:.<CR>
"let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']
let g:unite_source_rec_async_command = ['rg']
let g:unite_source_grep_command='rg'
"let g:unite_source_grep_default_opts='-i --no-heading --no-color -k -H'
let g:unite_source_grep_default_opts='--nogroup --nocolor'
let g:unite_source_grep_recursive_opt=''
let g:unite_source_grep_encoding = 'utf-8'
" }}}
" denite {{{
"nnoremap <leader>f :<C-u>denite file file_rec/async:vendor/qcom/proprietary/mm-3a-core/ file_rec/async:vendor/qcom/proprietary/mm-camerasdk/ file_rec/async:vendor/qcom/proprietary/mm-camera/mm-camera2/ file_rec:vendor/qcom/proprietary/mm-camera-core file_rec:hardware/qcom/camera file_rec:kernel/drivers/media/platform/msm/camera_v2 file_rec:kernel/include/media<CR>
"nnoremap <leader>b :<C-u>denite buffer bookmark<CR>
"nnoremap <leader>o :<C-u>denite outline<CR><C-w><S-_>
"nnoremap <leader><Space> :denite grep:.<CR>
" }}}
" vim-leader-guide {{{
" Define prefix dictionary
let g:lmap =  {}

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group.
" leader-f is the "File Menu" group.
" Unnamed groups will show a default string

let g:lmap.f = { 'name' : 'File Menu' }
  nmap <silent> <leader>fd :e $MYVIMRC<CR>
  let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']
  nmap <silent> <leader>fs :so %<CR>
  let g:lmap.f.s = ['so %', 'Source file']
  nmap <silent> <leader>fw :w<CR>
  let g:lmap.f.w = ['w', 'Write file']

let g:lmap.o = { 'name' : 'Open Stuff' }
  nmap <silent> <leader>oo  :copen<CR>
  let g:lmap.o.o = ['copen', 'Open quickfix']
  nmap <silent> <leader>ol  :lopen<CR>
  let g:lmap.o.l = ['lopen', 'Open locationlist']

" Create new menus not based on existing mappings:
let g:lmap.g = { 'name' : 'Git Menu',
                \'s' : ['Gstatus', 'Git Status'],
                \'p' : ['Gpull',   'Git Pull'],
                \'u' : ['Gpush',   'Git Push'],
                \'c' : ['Gcommit', 'Git Commit'],
                \'w' : ['Gwrite',  'Git Write'],
                \}

let g:lmap.b = { 'name' : 'unite' }
let g:lmap.g = { 'name' : 'gitgutter' }

call leaderGuide#register_prefix_descriptions(",", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
" }}}
" deoplete {{{
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
let g:deoplete#sources#clang#std#cpp = 'c++14'
let g:deoplete#enable_at_startup = 1
" }}}