" source /blah/blah/vimrc
"
" ===== GENERAL ===== "

" Turn on hybrid numbers (absolute + relative = hybrid)
set number relativenumber

" Turn on search highlighting
set hlsearch

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" ===== <LEADER> ===== "

" Remap <leader> key
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>q :qa<Enter>

" Toggle NERDTree
nmap <leader>t :NERDTreeToggle<cr>

" Open CtrlP
nmap <leader>p :CtrlP<Enter>

" ===== EDITING ===== "

" Set tab length to (4) AND convert to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Shuffle lines using Ctrl+j/k (hold: OK!)
" Normal mode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" Insert mode
inoremap <A-j> <ESC>:m .+1<CR>==gi
inoremap <A-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Set toggle spell check w/ <leader>ss
map <leader>ss :setlocal spell!<cr>
" Spell check shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" ===== CONTROL ===== "

" Turn on mouse stuff
set mouse+=a
"if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
"endif

" Set scroll offset (buffer around cursor)
set scrolloff=7

" Easily change window focus w/ Ctrl+h/j/k/l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map <space> to search
map <space> /
map <C-space> ?


" ===== NERDTREE ===== "

" Open NERDTree if vim opened w/o file
"if empty(argv())
"    au VimEnter * NERDTree
"endif

" Show hidden files by default
let NERDTreeShowHidden=1

" Ignore certain filetypes
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

" Some weird bug fix...
let g:NERDTreeGlyphReadOnly = "RO"

" Configure NerdtreePluginOpen
let g:nerdtree_plugin_open_cmd = 'kde-open'

" ===== COLORS ===== "

highlight LineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight Statement term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE


" ===== WEIRD FIXES ===== "

" Map all <Alt>-key combinations to use <Esc> sequences instead
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
" ... and set ttimeout
" (if it's faster than x milliseconds, it's an escape sequence)
set ttimeout ttimeoutlen=50
