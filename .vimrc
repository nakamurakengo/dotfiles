set nobackup
" set noswapfile
set autoindent
set shiftwidth=2
set softtabstop=2
set smartindent
set tabstop=2
set expandtab
set mouse=a
set number
set nowrap
set ruler
set incsearch
set laststatus=2
set textwidth=80
set colorcolumn=+1
set list listchars=tab:»·,trail:·,nbsp:·

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" fzf
" brew install fzf
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" ag
" brew install the_silver_searcher
" https://github.com/ggreer/the_silver_searcher
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
if executable('ag') && executable('fzf')
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-run-interactive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'docunext/closetag.vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'Quramy/tsuquyomi'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim.
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/tComment'
Plug 'vim-syntastic/syntastic' " Syntax checking hacks for vim
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'yggdroot/indentline'

" Initialize plugin system
call plug#end()

let mapleader = ','
nnoremap <leader>ri :RunInInteractiveShell<space>

" auto-pairs
" let g:AutoPairsShortcutToggle = '<C-x>'
let g:AutoPairsShortcutFastWrap = '<C-x>'

" Indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" vim-fzf
nmap <silent> ; :Buffers<CR>
nmap <silent> t :Files<CR>
nmap <silent> r :Tags<CR>

" vim-tests
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <F2> :TestNearest<CR>
nmap <silent> <F3> :TestLast<CR>

" vim-test
if exists('$TMUX')
  let test#ruby#rspec#executable = 'bundle exec spring rspec'
  let test#strategy = 'vimux'
endif

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" vim-better-whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave

" vim-colorschemes
colorscheme molokai

" syntax enable
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized

" load project specific settings
silent! so .vimlocal

