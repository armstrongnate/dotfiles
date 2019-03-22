" https://github.com/Shougo/neobundle.vim
" Install: curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
" :NeoBundleUpdatesLog - list recent changes.
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" Configure NeoBundle
let g:neobundle#types#git#default_protocol = 'https'

NeoBundleFetch 'Shougo/neobundle.vim'

" General
NeoBundle 'matchit.zip'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'bogado/file-line'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'wincent/command-t'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'armstrongnate/vim-journal'
NeoBundle 'vimwiki/vimwiki', 'dev'
NeoBundle 'morhetz/gruvbox'

" Languages/frameworks
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'apple/swift', { 'rtp' : 'utils/vim' }
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'armstrongnate/todo.txt-vim'

" NERDTree
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

" Set Leader
" \ is too far away!
let mapleader = "'"

" Toggle NERDTree
nnoremap <D-0> :NERDTreeToggle <CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" Autosave when changing buffers (the warnings get annoying)
set autowriteall

" Never .swp
set noswapfile

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
" Don't assume the line after a comment is still a comment
autocmd FileType ruby setlocal formatoptions-=cro
autocmd FileType yaml setlocal formatoptions-=cro
autocmd FileType javascript setlocal formatoptions-=cro
autocmd FileType markdown setlocal formatoptions-=cro
" 4 spaces for python indentation
autocmd BufRead *.py set ts=4 et sw=4 sts=4
autocmd FileType php set sw=2
" Remove fugitive buffers (from browsing git objects)
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database
autocmd BufReadPost fugitive://* set bufhidden=delete

" Enable syntax highlighting for Flow
let g:javascript_plugin_flow = 1

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

" Colors
syntax enable
set background=dark
colorscheme gruvbox
set linespace=1
" set t_Co=256
" set cursorline

" Color Customizations
syntax on
set nohlsearch
highlight MatchParen ctermbg=4
set synmaxcol=1024 " Give up on uberlong lines
" Vimdiff
highlight DiffAdd cterm=underline ctermbg=Black ctermfg=2
highlight DiffChange cterm=underline ctermbg=Black ctermfg=4
highlight DiffText cterm=underline ctermbg=4 ctermfg=0
highlight DiffDelete cterm=underline ctermbg=Black ctermfg=1
" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Highlight 81st column to discourage long lines.
" set colorcolumn=81

" Case insensitive filename completion
set wildignorecase

" Remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Ignore the following
set wildignore+=.git,*.jpg,*.png,*.zip,*.tar.gz,.DS_Store,tmp/**

" Ignore case for fast-typed commands.
command Q q
command W w
command WQ wq
command Wq wq

" Copy to the end of the line (https://github.com/tpope/tpope/blob/master/.vimrc)
nnoremap Y y$

" Insert just one character
nnoremap <space> :exec "normal i".nr2char(getchar())."\e"<CR>

" Search in a visual range
" http://www.vim.org/tips/tip.php?tip_id=796
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" Use motion commands to leave insert mode
" http://weblog.jamisbuck.org/2008/10/10/coming-home-to-vim
imap jk <esc>
imap jj <esc>j
imap kk <esc>k

" Abbreviations
ab pa params

" [b]uffergator
nnoremap <leader>b :BuffergatorOpen<CR>
" Close all but current [B]uffer
nnoremap <leader>B :1,999bd<CR><C-^>
" Open file in current [d]irectory
" http://vimcasts.org/episodes/the-edit-command
map <leader>d :e %:p:h/
" Insert the current [D]ate
nnoremap <Leader>D "=strftime("%a %b %d %Y")<CR>P
" [cd] to the current directory
map <leader>cd :cd %:p:h<CR>:pwd<CR>
" [E]dit
noremap <Leader>e :e<Space>
" [F]lip to alternate buffers
noremap <Leader>f :e #<CR>
" Git Grep (G[g]rep) the selection
vnoremap <Leader>g y:Ggrep '<C-r>"'<CR>
" Git Grep (G[g]rep) the word under the cursor
nnoremap <Leader>g :Ggrep <C-r><C-w><CR>
" Convert a three line tag or block to one line. (an overpowered [J])
noremap <Leader>j maJxJx`a
" [M]ulti-line an array or hash
noremap <Leader>m ma:s/, \?/,<c-v><CR>/g<CR>j=`a
" Edit [N]otes file
noremap <Leader>n :e notes.md<CR>
" [O]rganize alphabetically (sort)
" noremap <Leader>o :sort<CR>
" [Q]uit
noremap <Leader>q :quit<CR>
" [R]emove smart quotes (and friends).
noremap <Leader>R ma:%s/[“”]/"/eg<CR>:%s/’/'/eg<CR>`a
" [S]ave
noremap <Leader>s :write<CR>
" Show ou[t]line
nnoremap <leader>t :<C-u>Unite -buffer-name=outline -start-insert outline<CR>
" [y]ank history
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite -buffer-name=yank history/yank<CR>
" Change working directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Configure surround
" https://github.com/tpope/vim-surround
" Re-indent (=) after surrounding
let b:surround_indent = 1
" -
autocmd FileType php,html let b:surround_45 = "<?php \r ?>"
" # - #{}
autocmd FileType ruby,eruby,haml let g:surround_35 = "#{\r}"
" c - code block
autocmd FileType markdown let b:surround_99 = "```ruby\n\r\n```"
" d - debug
autocmd FileType ruby let b:surround_100 = "logger.debug(\"### #{\r}\") #TODO: remove debug code"
autocmd FileType javascript let g:surround_100 = "console.log(\r); // TODO Remove debug code"
autocmd FileType unite DisableWhitespace
" t - try
let g:surround_116 = "try(:\r)"
" v - variable
let g:surround_118 = "\"#{\r}\""

" Configure vim-ruby
" https://github.com/vim-ruby/vim-ruby
let g:ruby_hanging_indent = 0

" Configure vim-markdown-folding
let g:markdown_fold_style = 'nested'
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
set foldlevel=99

" Extend fugitive
cmap Gwc :Git whatchanged -p --abbrev-commit --pretty=medium %

" Load customizations for local machine.
if filereadable(expand("$HOME/.vimrc_local"))
  source $HOME/.vimrc_local
endif

" Configure panel navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Font
" set gfn=Meno:h13

" Edit routes and schema
command! Eroutes :e config/routes.rb
command! Sroutes :split config/routes.rb
command! Vroutes :vsplit config/routes.rb
command! Eschema :e db/schema.rb

" Show line numbers
set number

" Hide scrollbars
set guioptions-=L
set guioptions-=r

" 0 goes to beginning of line where text begins
map 0 ^

" Command-t is Ctrl-t
nnoremap <C-T> :CommandT <CR>

" put new vsplit buff on on the right
set splitright

" auto read changes from disk
set autoread

" Configure vim-markdown
let g:vim_markdown_folding_level = 1
let g:vim_markdown_new_list_item_indent = 0

" vim-journal
" Move todo down to next day
map <leader>> yy0r>Gp<C-o>
" Mark row as complete
map <leader>x 0rx
" Prioritize task
map <leader>p 0r+

" vimwiki
let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.syntax = 'markdown'
let wiki.nested_syntaxes = {'swift': 'swift', 'javascript': 'javascript', 'ruby': 'ruby'}
let wiki.ext = '.md'
let wiki.automatic_nested_syntaxes = 1
let g:vimwiki_list = [wiki]
let g:vimwiki_markdown_link_ext = 1

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

NeoBundleCheck
