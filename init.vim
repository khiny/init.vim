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
Plug 'arzg/vim-substrata'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim/'
"Plug 'bluz71/vim-moonfly-colors'
"Plug 'bluz71/vim-moonfly-statusline'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-MarkMarkup'
Plug 'inkarkat/vim-PatternsOnText'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"plug 'kristijanhusak/defx-icons'
"Plug 'kristijanhusak/defx-git
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ozelentok/deoplete-gtags'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'Lokaltog/vim-easymotion'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug('rbong/vim-crystalline')
Plug 'itchyny/lightline.vim'
"Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'jsfaint/gen_tags.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'majutsushi/tagbar'
"Plug 'hecal3/vim-leader-guide'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"Plug 'Yggdroot/indentLine'
"Plug 'andymass/vim-matchup'
Plug 'andymass/matchup.vim'
Plug 'chrisbra/Recover.vim'
Plug 'chrisbra/vim-diff-enhanced'
"Plug 'will133/vim-dirdiff'
" Use release branch (Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'TaDaa/vimade'
Plug 'junegunn/GV.vim'
"Plug 'itchyny/calendar.vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'uguu-org/vim-matrix-screensaver'
Plug 'liuchengxu/vim-clap'
"Plug 'yuttie/comfortable-motion.vim'
"Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'
Plug 'mhinz/vim-startify'
Plug 't9md/vim-choosewin'
"Plug 'weilbith/nerdtree_choosewin-plugin'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'cossonleo/dirdiff.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'neovim/nvim-lspconfig'
call plug#end()
"}}}

" my setting {{{
"let mapleader = ","

let g:mapleader = ','
let g:maplocalleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

inoremap jk <esc>
noremap ; :
"nmap <leader>v :edit $MYVIMRC<CR>
map <leader>z [{V]}zf
set nowrap
nnoremap <silent> <leader>p :set wrap! wrap?<CR>

"inoremap <Up>       <C-O>gk
"inoremap <Down>     <C-O>gj
noremap <Up>       gk
noremap <Down>     gj
inoremap <S-Up>     <C-O>vgk<C-G>
inoremap <S-Down>   <C-O>vgj<C-G>
snoremap <S-Up>     <C-O>gk
snoremap <S-Down>   <C-O>gj

set number              " show line numbers
autocmd BufEnter * if &diff | set nonu | else | set nu | endif
"set rnu
set showmatch           " highlight matching [{()}]
set ignorecase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set smartindent
set et
set nobackup
set nowritebackup
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
"colorscheme substrata
"colorscheme moonfly
"colorscheme palenight
"colorscheme onedark
"au Bufenter *.txt colorscheme PaperColor
"au Bufenter *.txt set background=light

"au GUIEnter * simalt ~x
"inoremap <A-Up> call GuiWindowFullScreen(1)
"inoremap <A-Down> call GuiWindowFullScreen(0)
set clipboard+=unnamedplus
inoremap <silent>  <S-Insert>  <C-R>+
set laststatus=2
set viminfo+=!
set list listchars=tab:»\ ,trail:·

"augroup XML
"  autocmd!
"  autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
"augroup END

"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guicursor=i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"set guifontwide=D2Coding:h12
"set guifontwide=NanumGothicCoding:h16
set noimd
set helplang=ko
set helpheight=99999

set mouse=a
set noshowmode
"set spr
"set updatetime=100
autocmd FileType qf 30wincmd_
autocmd FileType json syntax match Comment +\/\/.\+$+
set hidden  "for coc.nvim

if has('win32')
  let g:python3_host_prog = 'c:\Program Files\Python37\python'  " Python 3
  let g:python_host_prog = 'c:\Python27\python'  " Python 2
elseif has('mac')
  let g:python3_host_prog = '/usr/local/bin/python3'  " Python 3
  let g:python_host_prog = '/usr/bin/python2'  " Python 2
else
  let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'  " Python 3
  let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python2'  " Python 2
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
" http://qiita.com/wadako111/items/755e753677dd72d8036d
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

"  :nmap <leader><leader>s :Gtags -s <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
"  :nmap <leader><leader>g :Gtags <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
"  :nmap <leader><leader>c :Gtags -r <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
"  :nmap <leader><leader>t :Gtags -gi<space>
"  :nmap <leader><leader>e :Gtags -ge <C-R>=expand("<cword>")<CR><CR><C-W><C-W>
"  :nmap <leader><leader>f :Gtags -P <C-R>=expand("<cfile>")<CR><CR>:ccl<CR>
"  :nmap <leader><leader>i :scs find i <C-R>=expand("<cfile>")<CR><CR><C-W><C-W>
"  :nmap <leader><leader>d :Gtags -f %<CR><C-W><C-W>

  :nmap <leader><leader>s :Gtags -s <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><leader>g :Gtags <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><leader>c :Gtags -r <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><leader>t :Gtags -gi<space>
  :nmap <leader><leader>e :Gtags -ge <C-R>=expand("<cword>")<CR><CR>
  :nmap <leader><leader>f :Gtags -P <C-R>=expand("<cfile>")<CR><CR>:ccl<CR>
  :nmap <leader><leader>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
  :nmap <leader><leader>d :Gtags -f %<CR>

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

" Hex2dec Dec2hex {{{
" https://vim.fandom.com/wiki/Convert_between_hex_and_decimal
command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction
" }}}
" NERDTree {{{
"map <leader>q :VimFilerExplore<CR>
map <leader>q :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" }}}
"" vimfiler {{{
"map <leader>q :VimFilerExplore<CR>:VimFilerPrompt<CR>
"" }}}
" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
"map <SPACE> <Plug>(easymotion-s2)
"map <SPACE> <Plug>(easymotion-overwin-f2)
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
" tagbar {{{
noremap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 80
let g:tagbar_autoshowtag = 1
" }}}
" airline {{{
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
"let g:airline_theme = 'onedark'
let g:airline_left_sep=''
let g:airline_right_sep=''
"if !exists('g:airline_symbols')
  let g:airline_symbols = {}
"endif
"set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
" }}}
"" Plug('rbong/vim-crystalline') {{{
"function! StatusLine(current)
"  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CrystallineInactive#')
"        \ . ' %f%h%w%m%r '
"        \ . (a:current ? '%#CrystallineFill# %{fugitive#head()} ' : '')
"        \ . '%=' . (a:current ? '%#Crystalline# %{&paste?"PASTE ":""}%{&spell?"SPELL ":""}' . crystalline#mode_color() : '')
"        \ . ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
"endfunction
"let g:crystalline_statusline_fn = 'StatusLine'
"let g:crystalline_theme = 'default'
"" }}}
" mark {{{
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
" }}}
" denite {{{
" INTERFACE
call denite#custom#option('_', {
  \ 'auto_resume': 1,
  \ 'start_filter': 1,
  \ 'statusline': 1,
  \ 'smartcase': 1,
  \ 'vertical_preview': 1,
  \ 'direction': 'dynamicbottom',
  \ 'prompt': '❯',
  \ 'max_dynamic_update_candidates': 50000,
  \ 'winwidth': &columns,
  \ 'winheight': &lines / 3,
  \ 'wincol': 0,
  \ 'winrow': (&lines - 3) - (&lines / 3),
  \ })

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  setlocal signcolumn=no cursorline

  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> q    denite#do_map('quit')
  nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
  nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
if executable('ag')
  call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  " Ag command on grep source
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

"noremap <leader>bb :<C-u>Denite buffer<CR>
noremap <leader>bo :<C-u>Denite outline<CR>
" }}}
"" vim-leader-guide {{{
"" Define prefix dictionary
"let g:lmap =  {}
"
"" Second level dictionaries:
"" 'name' is a special field. It will define the name of the group.
"" leader-f is the "File Menu" group.
"" Unnamed groups will show a default string
"
"let g:lmap.f = { 'name' : 'File Menu' }
"  nmap <silent> <leader>fd :e $MYVIMRC<CR>
"  let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']
"  nmap <silent> <leader>fs :so %<CR>
"  let g:lmap.f.s = ['so %', 'Source file']
"  nmap <silent> <leader>fw :w<CR>
"  let g:lmap.f.w = ['w', 'Write file']
"
"let g:lmap.o = { 'name' : 'Open Stuff' }
"  nmap <silent> <leader>oo  :copen<CR>
"  let g:lmap.o.o = ['copen', 'Open quickfix']
"  nmap <silent> <leader>ol  :lopen<CR>
"  let g:lmap.o.l = ['lopen', 'Open locationlist']
"
"" Create new menus not based on existing mappings:
"let g:lmap.g = { 'name' : 'Git Menu',
"                \'s' : ['Gstatus', 'Git Status'],
"                \'p' : ['Gpull',   'Git Pull'],
"                \'u' : ['Gpush',   'Git Push'],
"                \'c' : ['Gcommit', 'Git Commit'],
"                \'w' : ['Gwrite',  'Git Write'],
"                \}
"
"let g:lmap.b = { 'name' : 'unite' }
"let g:lmap.g = { 'name' : 'gitgutter' }
"
"call leaderGuide#register_prefix_descriptions(",", "g:lmap")
"nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
"vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
" }}}
" liuchengxu/vim-which-key {{{
let g:which_key_map =  {}
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }
" }}}
"" indentLine {{{
"let g:indentLine_fileType = ['c', 'cpp', 'h']
"let g:indentLine_char = '┊'
"let g:indentLine_enabled=0
""if &diff
"    "autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * let g:indentLine_enabled=0
"    "let g:indentLine_enabled=0
"    "IndentLinesDisable
"    "let g:indentLine_newVersion = 1
"    "au bufenter * let g:indentLine_enabled = 0
""endif
""autocmd BufEnter * if &diff | IndentLinesDisable | else | IndentLinesEnable | endif
"" }}}
" fzf {{{         https://github.com/junegunn/dotfiles/blob/master/vimrc
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif


" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim')
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  function! FloatingFZF()
    " Size and position
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)



nnoremap <leader>bb :<C-u>Buffers<CR>
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
"" palenight {{{
"let g:palenight_terminal_italics=1
"hi MatchParen cterm=italic gui=italic
"" }}}
"" echodoc {{{
"let g:echodoc#enable_at_startup=1
"" }}}
"" gen_tags {{{
"let g:gen_tags#use_cache_dir=0
"let g:gen_tags#gtags_auto_gen=1
"let g:gen_tags#blacklist = ['$HOME']
""let g:gen_tags#verbose=1
"" }}}
"" EnhancedDiff {{{
"" started In Diff-Mode set diffexpr (plugin not loaded yet)
"if &diff
"    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
"endif
"" }}}
"" dirdiff {{{
"let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.git*"
"" }}}
"" wiki.vim {{{
"let g:wiki_root = '~/documents/wiki'
"" }}}
" ack.vim {{{
if executable('ag')
  let g:ackpg = 'ag --vimgrep'
endif
" }}}
"" octol/vim-cpp-enhanced-highlight{{{
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
"let g:cpp_concepts_highlight = 1
""}}}
""liuchengxu/vista.vim {{{
"function! NearestMethodOrFunction() abort
"  return get(b:, 'vista_nearest_method_or_function', '')
"endfunction
"set statusline+=%{NearestMethodOrFunction()}
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"
"" Width of vista sidebar.
"let g:vista_sidebar_width = 80
"" Time delay for showing detailed symbol info at current cursor.
"let g:vista_cursor_delay = 400
"" Blinking cursor 2 times with 100ms interval after jumping to the tag.
"let g:vista_blink = [2, 100]
"" To enable fzf's preview window set g:vista_fzf_preview.
"" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
"" For example:
"let g:vista_fzf_preview = ['right:50%']
"
""let g:vista_default_executive = 'ctags'
""nnoremap <leader>t :Vista finder ctags<CR>
""nnoremap <leader>t :Vista finder coc<CR>
"nnoremap <leader>t :Vista!!<CR>
""}}}
"" itchyny/calendar.vim {{{
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"" }}}
"" Plug 'iamcco/markdown-preview.nvim' {{{
"let g:mkdp_auto_start = 1
"" }}}
" Plug 'yuttie/comfortable-motion.vim' {{{
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
" }}}
"" Plug 'neoclide/coc.nvim' {{{
"" https://kimpers.com/vim-intelligent-autocompletion/
""let g:coc_global_extensions = [
""  'coc-emoji', 'coc-eslint', 'coc-prettier',
""  'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
""  'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml'
""]
"
"" Better display for messages
"set cmdheight=2
"" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"" always show signcolumns
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
""}}}
" Plug 'Shougo/deoplete.nvim' {{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option(
\'sources', {'cpp': ['tag']},
\'ignore_sources', {'_': ['around', 'buffer']},
\'smart_case', v:true,
\)
call deoplete#custom#source('buffer',
\ 'filetypes', ['c', 'cpp'])
set completeopt-=preview
"}}}
" Plug 't9md/vim-choosewin' {{{
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" }}}
" Plug 'itchyny/lightline.vim' {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
" }}}
"" Plug 'liuchengxu/eleline.vim' {{{
"let g:eleline_powerline_fonts = 1
"" }}}
" Plug 'liuchengxu/vim-clap' {{{
let g:clap_theme = 'material_design_dark'
" }}}
