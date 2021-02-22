" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Autosave when changing buffers (the warnings get annoying)
set autowriteall
" Enable persistent undo
if isdirectory($HOME.'/.vim/tmp/undo') == 0
  call system('mkdir -p '.$HOME.'/.vim/tmp/undo')
endif
set undofile
set undodir=$HOME/.vim/tmp/undo

" Highlight 81st and 101st column to discourage long lines.
set colorcolumn=81

" Ignore case for fast-typed commands.
command Q q
command W w
command WQ wq
command Wq wq

" Use motion commands to leave insert mode
" http://weblog.jamisbuck.org/2008/10/10/coming-home-to-vim
imap jk <esc>
imap jj <esc>j
imap kk <esc>k

" Colors
syntax enable
set background=dark
colorscheme gruvbox
set linespace=1
set cursorline

" Font
set guifont=Inconsolata-dz:h12

" Show line numbers
set number

" Remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Ignore the following
set wildignore+=.git,*.jpg,*.png,*.zip,*.tar.gz,.DS_Store,tmp/**

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" put new vsplit buff on on the right
set splitright

" 0 goes to beginning of line where text begins
map 0 ^

" Hide scrollbars
set guioptions-=L
set guioptions-=r

" Case insensitive filename completion
set wildignorecase

" Set Leader
" \ is too far away!
let mapleader = "'"

" Tabs and indentation
" Default to 2 spaces (ruby FTW)
set backspace=start,indent,eol
set tabstop=2
set softtabstop=2
set shiftwidth=2
retab
set expandtab

" 4 spaces for iOS indentation
autocmd BufRead *.swift set ts=4 et sw=4 sts=4
autocmd BufRead *.h set ts=4 et sw=4 sts=4
autocmd BufRead *.m set ts=4 et sw=4 sts=4
autocmd BufRead *.cpp set ts=4 et sw=4 sts=4
autocmd BufRead *.c set ts=4 et sw=4 sts=4

" FileTypes
filetype on
filetype indent on
filetype plugin on
" Makefiles need literal tabs
autocmd FileType make setlocal noexpandtab
" Special ruby files
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
autocmd BufRead,BufNewFile Fastfile set filetype=ruby
autocmd BufRead,BufNewFile *.rabl set filetype=ruby
autocmd BufRead,BufNewFile *.prawn set filetype=ruby
autocmd BufRead,BufNewFile *Podfile set filetype=ruby
" Don't assume the line after a comment is still a comment
autocmd FileType ruby setlocal formatoptions-=cro
autocmd FileType yaml setlocal formatoptions-=cro
autocmd FileType javascript setlocal formatoptions-=cro
autocmd FileType markdown setlocal formatoptions-=cro
" 4 spaces for python indentation
autocmd BufRead *.py set ts=4 et sw=4 sts=4
autocmd FileType php set sw=2
" js gets confused
autocmd BufRead *.js set ts=2 et sw=2 sts=2

" Git Grep (G[g]rep) the selection
vnoremap <Leader>g y:Ggrep '<C-r>"'<CR>
" Git Grep (G[g]rep) the word under the cursor
nnoremap <Leader>g :Ggrep <C-r><C-w><CR>

" Never .swp
set noswapfile

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" Always display status line
set laststatus=2

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Quick shell
nnoremap <Leader>s :shell <CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" MacVim
if has('gui_running')
  set lines=200
  set columns=200
endif

" ctrlp
let g:ctrlp_match_window = 'results:100'

" Edit existing file under cursor in vertically split window
nnoremap <C-W><C-F> <C-W>vgf

" Create and edit file under cursor
noremap <leader>gf :e <cfile><cr>

" Configure markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['ruby', 'sh', 'bash=sh', 'javascript', 'sql']

" vim-ruby
let g:ruby_fold = 1
let g:ruby_foldable_groups = 'class module def if'
