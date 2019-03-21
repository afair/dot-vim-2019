"===============================================================================
" VIM Configuration v3 - .vimrc file
" See https://gist.github.com/afair/8df4ddd5645fd4adc536fb3947561a15
" Invoke alternate configuration via these alias' in your .bashrc/.zshrc
"     alias v2='vim -u ~/.vim2/vimrc'
"     alias mv2='mvim -u ~/.vim2/vimrc -U ~/.vim2/gvimrc'
"-------------------------------------------------------------------------------
" Use the following line only when using an alternate repo!
"let &rtp = substitute(&rtp, '\.vim\>', '.vim2', 'g')
"-------------------------------------------------------------------------------
" 🌺 junegunn/vim-plug Plugin Manager
" :PlugInstall [name...]
" :PlugUpdate  [name...]
" :PlugClean[!]
" :PlugUpgrade
" Plug 'githubuser/repo' | 'https://...',
"      {'on': 'Command', 'for':['Language',...]}
call plug#begin('~/.vim/plugged')
" -------------------------------------------------------- Colorschemes
"Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/vibrantink' ", { 'as': 'vibrantink' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'romainl/Apprentice'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'qualiabyte/vim-colorstepper'
" -------------------------------------------------------- Plugins
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', {'on': 'CtrlP' }
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'bronson/vim-trailing-whitespace'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'godlygeek/tabular'
"Plug '/Align'
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
" -------------------------------------------------------- RUBY/RAILS
Plug 'tpope/vim-rails' ", {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby' ", {'for': 'ruby'}
Plug 'thoughtbot/vim-rspec' ", {'for': 'ruby'}
Plug 'tpope/vim-haml', {'for':'haml'}
"Plug '/bundler.vim', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'seattlerb/minitest', {'for': 'ruby'}
"Plug 'kchmck/vim-coffee-script'
" -------------------------------------------------------- JAVASCRIPT
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
"Plug '/vim-javascript-syntax', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
"Plug 'isruslan/vim-es6', {'for': 'javascript'}
Plug 'elmcast/elm-vim', {'for': 'elm'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'elzr/vim-json',   {'for': 'json'}
" -------------------------------------------------------- HTML/MARKDOWN/TEMPLATE
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" -------------------------------------------------------- PHP
"Plug '/php'
" -------------------------------------------------------- GO/RUST/ELIXIR/NEW
Plug 'rhysd/vim-crystal', {'for': 'crystal'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'vim-scripts/c.vim', {'for': 'c'}
call plug#end()
"===============================================================================

set nocompatible
syntax on
filetype plugin indent on
colorscheme vibrantink
"colorscheme dracula
"colorscheme apprentice
set number
set textwidth=0
set formatoptions-=t            " Turn off auto-wrap text
set nolist                      " Turn off trailing whitespace indicators
set noerrorbells                " no beep
set mouse=a                     " Mouse: n=normal v=visuali=insert c=cmdline a=all
set nowrap
set hlsearch
set complete-=i                 " Without included files
setglobal complete-=i           " Without included files
set autoindent                  " Auto: autoindent, noautoindent
set smartindent                 " For C-style languages: nosmartindent

" Search Controls
set hlsearch                    " Highlights search terms: hls, nohls
set ignorecase                  " Ignore Case on search: ignorecase, noignorecase
set smartcase                   " When searching with uppercase, turns off ignorecase
set incsearch                   " Incremental search while you are typing
noremap <CR> :nohlsearch<CR>j^

" Abbreviations: common typing error corrections
ab teh the
ab cofirm confirm
ab subscibe subscribe
ab subsciber subscriber
ab subsc subscriber
ab privl privlege_level
ab yeild yield
ab inless unless

" Basics Keys: \m mouseOff, \M mouseOn, \N tabnew, \p paste, \w wrap, \W killTrailingSpace, jk ESC, \p reflow-para
noremap <Leader>m :set mouse=<CR>
noremap <Leader>M :set mouse=a<CR>
noremap <Leader>W :%s/\s\+$//<CR>
noremap <Leader>w :set invwrap<CR>
noremap <Leader>N :tabnew
noremap <Leader>p :set invpaste<CR>
noremap <Leader>G :GitGutterToggle<CR>
inoremap jk <Esc>
inoremap <Leader>p gqap
inoremap {<CR> {}<Left><CR><CR><Up><Tab>
noremap <Leader>\ :wincmd w<CR>
noremap c_ ct_
noremap _ f_<Right>
nnoremap <leader># 80i#<Esc>

" More: \V reloadVimrc, \gw grepWord, \cf nextConflict, \a AckWord, \" Dup
"nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>V :source ~/.vimrc<CR>
nnoremap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nnoremap <leader>a *<C-O>:AckFromSearch!<CR>
" Duplicate: line/vblock
noremap <Leader>" Yp
vnoremap <Leader>" yPgv
noremap "" Yp
vnoremap "" yPgv
vnoremap <Leader>= :Tabularize /=<CR>
noremap <Leader>= :Tabularize /=<CR>
" surrounds current word with quotes
map <Leader>' ysiw'
map <Leader>" ysiw"

" Reselect visual block after shift, Duplicate Line/Block
vnoremap < <gv
vnoremap > >gv

" Saving: \s Save, \S SaveAll, Q Quit,
nnoremap Q :q<CR>
nnoremap W :w<CR>
nnoremap <leader>s :w<CR>
"inoremap <leader>s <Esc>:w<CR>
nnoremap <leader>S :wall<CR>
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
inoremap <silent> <C-S> <Esc>:if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

" Window/Tab Navigation: Ctrl-<hjkl>, \' NextWindow, \[ PrevTab, \] NextTab,
noremap <Leader>[ :tabprev<CR>
noremap <Leader>] :tabnext<CR>

" https://gist.github.com/afair/bb9d76aeb15b0524075a373ca37c5994
" vimdiff: ]c => NextDiff, [c =>PrevDiff, do => DiffObtain, dp => DiffPut
"          \1 => getLOCAL  \2=> getBASE \3 => getREMOTE
if &diff
  map <silent> <leader>= :diffget LOCAL<CR>]c
  map <silent> <leader>= :diffget LOCAL<CR>/^<<<<<<< HEAD<CR>
  map <silent> <leader>1 :diffget LOCAL<CR>
  map <silent> <leader>2 :diffget BASE<CR>
  map <silent> <leader>3 :diffget REMOTE<CR>
  map <silent> <leader>u :diffupdate<CR>
  map <silent> <leader>wq :wqall<CR>
  map ] ]c
  map [ [c
  map <leader>' ]c
  map <leader>; [c
  map <leader>u :diffupdate<CR>
  map <leader>h /^<<<<<<< HEAD<CR>
endif


" Command line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Tabstops
au BufRead,BufNewFile *.tpl set filetype=html
au BufNewFile,BufRead .*.muttrc set filetype=muttrc
set tabstop=2
set ai sw=2 sts=2 et smartindent
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.tpl setf html
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,rhtml,erb,haml set ai sw=2 sts=2 et
  autocmd FileType php,tpl,html set tabstop=2
  autocmd FileType perl,php set ai sw=2 sts=2 et smartindent
  autocmd FileType ruby,eruby,yaml,erb,rhtml set tabstop=2 smartindent
  autocmd FileType tpl,html set ai sw=2 sts=2 et smartindent tabstop=2
  autocmd FileType css set smartindent tabstop=2
  autocmd FileType c,h set smartindent tabstop=8
  " Tabs only
  autocmd FileType conf set noet ci pi sts=0 sw=8 ts=8
  " Poor Man's Macros: def<cr> expands to full Ruby method definition
  " "autocmd FileType ruby iab def def<cr>end<esc>-A
augroup END

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG
"autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

""  "===============================================================================
""  " Plugins & Configurations
""  "===============================================================================
""
""  " FZF - Fuzzy Finder -- \o{ftsvn}
""  "set rtp+=/usr/local/opt/fzf
""  "noremap <Leader>of <Esc>:FZF<CR>
""  "noremap <Leader>ot <Esc>:tabnew<CR>:FZF<CR>
""  "noremap <Leader>os <Esc>:split<CR><C-W>j:FZF<CR>
""  "noremap <Leader>oS <Esc>:split<CR><C-W>k:FZF<CR>
""  "noremap <Leader>ov <Esc>:vsplit<CR><C-W>l:FZF<CR>
""  "noremap <Leader>oV <Esc>:vsplit<CR><C-W>h:FZF<CR>
""  "noremap <Leader>on <Esc>:tabnew<CR>
""  " From https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
""  " command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
""
""
""  " fugitive
""  " nerdtree
noremap <Leader>f :NERDTreeToggle<CR>
noremap <Leader>F :NERDTreeFind<CR>
" syntastic
noremap <Leader>x <Esc>:SyntasticToggleMode<CR>
let g:syntastic_perl_checkers=['perl']
let g:syntastic_php_checkers=['php']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_javascript_checkers = ['eslint'] " https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
" let g:syntastic_javascript_checkers = ['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ctrlp
noremap <Leader>o :CtrlP<CR>
noremap <Leader>r :tabnew<CR>:CtrlP<CR>
noremap <Leader>i :split<CR><C-w>j:CtrlP<CR>
noremap <Leader>v :vsplit<CR><C-w>l:CtrlP<CR>
noremap <Leader>t <Esc>:tabnew<CR>:CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
""
""  " vim-airline - Statusbar
""  "let g:airline_powerline_fonts = 1
" nerdcommenter
noremap <D-/> <plug>NERDCommenterToggle<CR>
""  " Ack - for silver searcher
""  if executable('ag')
""    let g:ackprg = 'ag --vimgrep'
""  endif
""  " buffergator
""  let g:buffergator_suppress_keymaps=1
""  noremap <Leader>b :BuffergatorTabsToggle<CR>
""  "noremap <Leader>T :BuffergatorTabsToggle<CR>

" Rails: \rm Model, \rc Controller, \rv View, \rr Related, \ra Alternative
autocmd FileType ruby noremap <Leader>rm :Rmodel<CR>
autocmd FileType ruby noremap <Leader>rc :Rcontroller<CR>
autocmd FileType ruby noremap <Leader>rv :Rview<CR>
autocmd FileType ruby noremap <Leader>rr :R<CR>
autocmd FileType ruby noremap <Leader>ra :A<CR>
""  " vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "!bin/rspec {spec}"
noremap <Leader>s :call RunCurrentSpecFile()<CR>
" vim-markdown
let g:vim_markdown_folding_disabled = 1

"===============================================================================
" My Functions
"===============================================================================

" Disable/Enable the Arrow Keys...
noremap <Leader><Right> :call DisableArrows()<CR>
function EnableArrows()
	noremap <Up> <Up>
	noremap <Down> <Down>
	noremap <Left> <Left>
	noremap <Right> <Right>
	noremap <Leader><Right> :call DisableArrows()<CR>
endfunction
function DisableArrows()
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>
	noremap <Leader><Right> :call EnableArrows()<CR>
endfunction

" RotateNumber: \n LineNumber-RelativeNumber-Off
function RotateNumber()
	if &l:relativenumber
		let &l:number=0
		let &l:relativenumber=0
		echom "No Line Numbers"
	elseif &l:number
		let &l:number=1
		let &l:relativenumber=1
		echom "Relative Line Numbers"
	else
		let &l:relativenumber=0
		let &l:number=1
		echom "Line Numbers"
	endif
endfunction
noremap <Leader>n :call RotateNumber()<CR>

"===============================================================================
" Epilogue: Source .vimrc.local if exists
"===============================================================================

" This function hack runs AFTER load, so we can correct mappings by plugins, etc.
autocmd VimEnter * call RunAfterLoad()
function RunAfterLoad()
  inoremap <Leader>t <Esc>:tabnew<CR>:CtrlP<CR>
endfunction

if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
