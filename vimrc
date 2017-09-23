" source /blah/blah/vimrc

" ===== VISUAL ===== "

" Turn on hybrid numbers (absolute + relative = hybrid)
set number relativenumber

" Turn on search highlighting
set hlsearch


" ===== EDITING ===== "

" Set tab length to (4) AND convert to spaces
set tabstop=4
set expandtab


" ===== CONTROL ===== "

" Turn on mouse stuff
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


" ===== NERDTREE ===== "

" Open NERDTree if vim opened w/o file
if empty(argv())
    au VimEnter * NERDTree
endif

" Ignore certain filetypes
let NERDTreeIgnore = ['\.pyc$']


" ===== COLORS ===== "

highlight LineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight Statement term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE

