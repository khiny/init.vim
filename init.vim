" home setting {{{
if has('win32') "if $HOME == 'U:\'
    let $HOME = 'C:\0-work\0-bin\Neovim\a-hoilkHome'
endif
"}}}

" plug {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim/'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-moonfly-statusline'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"plug 'kristijanhusak/defx-icons'
"Plug 'kristijanhusak/defx-git
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/denite.nvim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'jsfaint/gen_tags.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'majutsushi/tagbar'
Plug 'hecal3/vim-leader-guide'
Plug 'Yggdroot/indentLine'
"Plug 'andymass/vim-matchup'
Plug 'andymass/matchup.vim'
Plug 'chrisbra/Recover.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'will133/vim-dirdiff'
if has('win32')
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'powershell -executionpolicy bypass -File install.ps1' }
else
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
Plug 'liuchengxu/vista.vim'
endif
Plug 'rking/ag.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'TaDaa/vimade'
Plug 'junegunn/GV.vim'
Plug 'itchyny/calendar.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'yuttie/comfortable-motion.vim'
call plug#end()
"}}}

" my setting {{{
let mapleader = ","
inoremap jk <esc>
noremap ; :
"nmap <leader>v :edit $MYVIMRC<CR>
map <leader>z [{V]}zf
set nowrap
nnoremap <silent> <leader>p :set wrap! wrap?<CR>

inoremap <Up>       <C-O>gk
inoremap <Down>     <C-O>gj
inoremap <S-Up>     <C-O>vgk<C-G>
inoremap <S-Down>   <C-O>vgj<C-G>
snoremap <S-Up>     <C-O>gk
snoremap <S-Down>   <C-O>gj

set number              " show line numbers
autocmd BufEnter * if &diff | set nonu | else | set nu | endif
"set rnu
set showmatch           " highlight matching [{()}]
set ignorecase
au Bufenter *.c set tabstop=2
au Bufenter *.c set shiftwidth=2
au Bufenter *.c set softtabstop=2
au Bufenter *.cpp set tabstop=4
au Bufenter *.cpp set shiftwidth=4
au Bufenter *.cpp set softtabstop=4
au Bufenter *.h set tabstop=2
au Bufenter *.h set shiftwidth=2
au Bufenter *.h set softtabstop=2
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
set wildoptions=pum
set nohlsearch
set backspace=indent,eol,start

if filereadable("./cscope.out")
  cs add ./cscope.out
elseif filereadable("./GTAGS")
  if has('win32')
    set csprg='$HOME\.local\share\glo663wb\bin\gtags-cscope.exe'
  else
    set csprg=gtags-cscope
  endif
  silent cs add ./GTAGS
endif

set foldmethod=marker
set foldlevel=0
set modelines=1

"packadd vimball
set rtp+=~/.fzf

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
"set background=dark
set background=light
colorscheme PaperColor
"colorscheme moonfly
"colorscheme palenight

"au GUIEnter * simalt ~x
"inoremap <A-Up> call GuiWindowFullScreen(1)
"inoremap <A-Down> call GuiWindowFullScreen(0)
set clipboard+=unnamedplus
inoremap <silent>  <S-Insert>  <C-R>+
set laststatus=2
set viminfo+=!
set list listchars=tab:»\ ,trail:·

augroup XML
  autocmd!
  autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

set mouse=a
set noshowmode
"set spr
set updatetime=100
autocmd FileType qf 30wincmd_

if has('win32')
  let g:python3_host_prog = 'c:\Program Files\Python37\python'  " Python 3
  let g:python_host_prog = 'c:\Python27\python'  " Python 2
endif
"}}}
" AdjustWindowHeight {{{
" https://gist.github.com/juanpabloaj/5845848
"au FileType qf call AdjustWindowHeight(3,40)
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
"}}}
" AdjustFontSize {{{
" https://stackoverflow.com/questions/35285300/how-to-change-neovim-font/51424640#51424640
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  ":execute "GuiFont! Consolas:h" . s:fontsize
  :execute "GuiFont! NanumGothicCoding:h" . s:fontsize
endfunction
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
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
" Gtags cscope {{{
if filereadable("./cscope.out")
  :nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  :nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
elseif filereadable("./GTAGS")
  " The following key mappings are derived from 'cscope_maps.vim'.
  " (The 'd' command is not implemented in gtags-cscope.)
  "
  " normal command
  :nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  :nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  :nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
  ":nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  :nmap <leader><leader>s :Gtags -s <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
  :nmap <leader><leader>g :Gtags <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
  :nmap <leader><leader>c :Gtags -r <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
  :nmap <leader><leader>t :Gtags -gi<space>
  :nmap <leader><leader>e :Gtags -ge <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
  :nmap <leader><leader>f :Gtags -P <C-R>=expand("<cfile>")<CR><CR>:ccl<CR>
  :nmap <leader><leader>i :scs find i <C-R>=expand("<cfile>")<CR><CR><C-W><C-W>
  :nmap <leader><leader>d :Gtags -f %<CR><C-W><C-W>

  :nmap <leader><Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  :nmap <leader><Space>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
  ":nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

  :nmap <C-n> :cn<CR>
  :nmap <C-p> :cp<CR>
  :nmap <C-\><C-]> :GtagsCursor<CR>
endif
" }}}

" NERDTree {{{
"map <leader>q :VimFilerExplore<CR>
map <leader>q :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" }}}
" vimfiler {{{
"map <leader>q :VimFilerExplore<CR>:VimFilerPrompt<CR>
" }}}
" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
"map <SPACE> <Plug>(easymotion-s2)
map <SPACE> <Plug>(easymotion-overwin-f2)
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
"nnoremap <leader>t :TagbarToggle<CR>
" }}}
" airline {{{
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'papercolor'
let g:airline_theme = 'onedark'
let g:airline_left_sep=''
let g:airline_right_sep=''
"if !exists('g:airline_symbols')
  let g:airline_symbols = {}
"endif
"set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
" }}}
" mark {{{
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
" }}}
" unite {{{
"nnoremap <silent> <leader>bf :<C-u>Unite file file_rec/async:vendor/qcom/proprietary/camx/ file_rec/async:vendor/qcom/proprietary/camx-lib/ file_rec/async:vendor/qcom/proprietary/chi-cdk/<CR>
"nnoremap <leader>f :<C-u>Unite file file_rec/async:vendor/qcom/proprietary/mm-3a-core/ file_rec/async:vendor/qcom/proprietary/mm-camerasdk/ file_rec/async:vendor/qcom/proprietary/mm-camera/mm-camera2/ file_rec/async:vendor/qcom/proprietary/mm-camera-core file_rec/async:hardware/qcom/camera file_rec/async:kernel/msm-3.18/drivers/media/platform/msm/camera_v2 file_rec/async:kernel/msm-3.18/include/media<CR>
"nnoremap <silent> <leader>bb :<C-u>Unite buffer bookmark<CR>
"nnoremap <silent> <leader>bo :<C-u>Unite outline<CR><C-w><S-_>
"nnoremap <silent> <leader><Space> :Unite grep:.<CR>
"let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']
"let g:unite_source_rec_async_command = ['rg']
"let g:unite_source_grep_command='rg'
"let g:unite_source_grep_default_opts='-i --no-heading --no-color -k -H'
"let g:unite_source_grep_default_opts='--nogroup --nocolor'
"let g:unite_source_grep_recursive_opt=''
"let g:unite_source_grep_encoding = 'utf-8'
" }}}
" denite {{{
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"
"call denite#custom#var('grep', 'command', ['ag'])
"call denite#custom#var('grep', 'default_opts',
" \ ['-i', '--vimgrep'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', [])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert','<Down>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<Up>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('insert','<DEL>','<denite:do_action:delete>','noremap nowait')
call denite#custom#map('normal','<Down>','<denite:move_to_next_line>','noremap')
call denite#custom#map('normal','<Up>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('normal','<DEL>','<denite:do_action:delete>','noremap nowait')
"nnoremap <leader>bf :<C-u>Denite file_rec:vendor/qcom/proprietary/mm-3a-core file_rec:vendor/qcom/proprietary/mm-camerasdk file_rec:vendor/qcom/proprietary/mm-camera/mm-camera2 file_rec:vendor/qcom/proprietary/mm-camera-core file_rec:hardware/qcom/camera file_rec:kernel/drivers/media/platform/msm/camera_v2 file_rec:kernel/include/media<CR>
"noremap <leader>bf :<C-u>Denite file_rec:vendor/qcom/proprietary/camx file_rec:vendor/qcom/proprietary/camx-lib file_rec:vendor/qcom/proprietary/chi-cdk file_rec:vendor/qcom/proprietary/camx-lib-stats -highlight-mode-insert=IncSearch<CR>
noremap <leader>bb :<C-u>Denite buffer -highlight-mode-insert=IncSearch<CR>
noremap <leader>bo :<C-u>Denite outline -highlight-mode-insert=IncSearch<CR>
"noremap <leader>b<Space> :Denite grep<CR>
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
if has('win32')
let g:deoplete#sources#clang#libclang_path = 'C:\Program Files\LLVM\bin\libclang.dll'
let g:deoplete#sources#clang#clang_header = 'C:\Program Files\LLVM\lib\clang'
else
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libLLVM.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
endif
let g:deoplete#sources#clang#std#cpp = 'c++14'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#sort_algo = 'priority'

if !exists('g:deoplete#sources')
  let g:deoplete#sources = {}
endif
let g:deoplete#sources.cpp = ['clang']

"call deoplete#custom#var('clangx', 'clang_binary', 'c:\Program Files\LLVM\bin\clang.exe')
"call deoplete#custom#var('clangx', 'default_c_options', '')
"call deoplete#custom#var('clangx', 'default_cpp_options', '')
" }}}
" indentLine {{{
let g:indentLine_fileType = ['c', 'cpp', 'h']
let g:indentLine_char = '┊'
let g:indentLine_enabled=0
"if &diff
    "autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * let g:indentLine_enabled=0
    "let g:indentLine_enabled=0
    "IndentLinesDisable
    "let g:indentLine_newVersion = 1
    "au bufenter * let g:indentLine_enabled = 0
"endif
"autocmd BufEnter * if &diff | IndentLinesDisable | else | IndentLinesEnable | endif
" }}}
" fzf {{{
"nnoremap <leader>bb :<C-u>Buffers<CR>
"nnoremap <leader>bf :<C-u>Files<CR>
nnoremap <leader>bf :<C-u>FZFMulti<CR>
nnoremap <leader>bg :<C-u>GFiles<CR>
nnoremap <leader>bl :<C-u>BLines<CR>
nnoremap <leader>bt :<C-u>BTags<CR>
nnoremap <leader>bc :<C-u>BCommits<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
command! FZFMulti call fzf#run(fzf#wrap({
            \'source': 'ag -l',
            \'options': ['--multi'],
            \}))

if has('win32')
else
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
endif
" }}}
" palenight {{{
let g:palenight_terminal_italics=1
hi MatchParen cterm=italic gui=italic
" }}}
" echodoc {{{
let g:echodoc#enable_at_startup=1
" }}}
" gen_tags {{{
let g:gen_tags#use_cache_dir=0
let g:gen_tags#gtags_auto_gen=1
let g:gen_tags#blacklist = ['$HOME']
"let g:gen_tags#verbose=1
" }}}
" EnhancedDiff {{{
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" }}}
" dirdiff {{{
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.git*"
" }}}
" autozimu/LanguageClient-neovim {{{
set hidden
let g:LanguageClient_autoStart = 1  
"let g:LanguageClient_settingsPath = '/home/joao/.config/nvim/settings.json'
"let g:LanguageClient_loadSettings = 1
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

let g:LanguageClient_serverCommands = {
\ 'cpp': ['cquery', '--language-server'],
\ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }}}
" wiki.vim {{{
let g:wiki_root = '~/documents/wiki'
" }}}
" ack.vim {{{
if executable('ag')
  let g:ackpg = 'ag --vimgrep'
endif
" }}}
" octol/vim-cpp-enhanced-highlight{{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"}}}
"liuchengxu/vista.vim {{{
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}

" Width of vista sidebar.
let g:vista_sidebar_width = 40
" Time delay for showing detailed symbol info at current cursor.
let g:vista_cursor_delay = 400
" Blinking cursor 2 times with 100ms interval after jumping to the tag.
let g:vista_blink = [2, 100]
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

nnoremap <leader>t :Vista finder ctags<CR>
"}}}
" itchyny/calendar.vim {{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" }}}
" Plug 'iamcco/markdown-preview.nvim' {{{
let g:mkdp_auto_start = 1
" }}}
" Plug 'yuttie/comfortable-motion.vim' {{{
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
" }}}
