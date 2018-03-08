" source /blah/blah/vimrc


" ===== VISUAL ===== "

" Turn on numbers
set number

" Turn on search highlighting
set hlsearch

" Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
set mat=3  " how many tenths of a second to blink


" ===== <LEADER> ===== "

" Remap <leader> key
let mapleader = ","
let g:mapleader = ","

" Save
nmap <leader>w :w<cr>

" Quit
nmap <leader>q :qa<Enter>

" V-split
nmap <leader>v :vsplit<Enter>

" H-split
nmap <leader>s :split<Enter>

" New tab
nmap <leader>t :tabnew<Enter>

" Turn off highlighting
nmap <leader><space> :noh<Enter>

" Hide buffer
nmap <leader>h :hide<Enter>

" Delete buffer
nmap <leader>d :bd<Enter>

" Toggle NERDTree
nmap <leader>e :NERDTreeToggle<cr>

" Close all buffers (then, reopen NERDTree)
nmap <leader>c :%bd \| NERDTreeToggle<Enter>

" Far.vim replace
nmap <leader>r :Farp<Enter>
nmap <leader>R :Fardo<Enter>


" ===== EDITING / MOVEMENT ===== "

" Set up/down to work better with wrapped lines
nnoremap j gj
nnoremap k gk

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Set tab length to (4) AND convert to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Bind system clipboard
vnoremap <C-c> "+y

"" Shuffle lines using Alt+j/k (hold: OK!)
"" Normal mode
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"" Insert mode
"inoremap <A-j> <ESC>:m .+1<CR>==gi
"inoremap <A-k> <ESC>:m .-2<CR>==gi
"" Visual mode
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" Set toggle spell check w/ <leader>ss
map <leader>ss :setlocal spell!<cr>
" Spell check shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Sudo Save
"   To use this command, type :Sudow
"   Note: all custom commands must start uppercase
command Sudow w !sudo tee % >/dev/null


" ===== CONTROL / SEARCH ===== "

" Turn on mouse stuff
set mouse+=a
"if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
"endif

" Set scroll offset (buffer around cursor)
set scrolloff=7

" Easily change window focus w/ Ctrl+h/j/k/l, Ctrl+<ArrowKeys>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h>     :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j>     :TmuxNavigateDown<cr>
nnoremap <silent> <C-k>     :TmuxNavigateUp<cr>
nnoremap <silent> <C-l>     :TmuxNavigateRight<cr>
nnoremap <silent> <C-\>     :TmuxNavigatePrevious<cr>

" Map <space> to search
map <space> /
map <C-space> ?

" For regular expressions turn magic on
set magic

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch  " search as you type


" ===== BUFFERS / FILES ===== "

" A buffer becomes hidden when it is abandoned
set hid

" Write all buffers before navigating from vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Store temporary files in a central location
let vimtmp = $HOME . '/.tmp/vim/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp

" Set to auto read when a file is changed from the outside
set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END


" ===== COLORS ===== "

highlight LineNr       term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight Statement    term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
