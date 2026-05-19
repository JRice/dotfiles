" ==============================================================================
" Tabs, Indentations
" ==============================================================================
set tabstop=2       " Number of visual spaces per TAB
set softtabstop=2   " Number of spaces a TAB counts for while editing
set shiftwidth=2    " Indentation amount for < and > commands
set expandtab       " Turn TABs into spaces (Use Ctrl-V + TAB to insert a real tab)

set autoindent      " Always copy indentation from current line when starting a new one
set nosmartindent   " Turned off: smartindent is legacy and conflicts with filetype plugins
set smarttab        " TAB at start of line inserts shiftwidth spaces

" ==============================================================================
" General Settings & Performance
" ==============================================================================
" Leave 'set nocompatible' removed: Neovim ignores it, and modern Vim sets it 
" automatically if it detects a user .vimrc file.

set wrap            " Wrap lines visually
set linebreak       " Break lines at convenient characters (words won't split mid-line)

set fileencodings=utf-8,default,latin1
set encoding=utf-8
" Note: 'termencoding' is removed. Modern terminals handle UTF-8 globally; 
" explicitly setting this often breaks text rendering over SSH.

set viminfo='20,\"50 " Remember info for up to 20 files, max 50 lines per register
set history=200     " Modernized: Boosted from 50 to 200 (virtually zero memory cost)
set backspace=indent,eol,start " Standardized alias for 'bs': allow backspacing over everything
set hidden          " Hide buffers when abandoned instead of unloading them

" Abbreviate status messages to reduce the annoying 'Press ENTER to continue' prompts
set shortmess+=filmnrxoOtT

" Enable advanced file detection, file-specific plugins, and smart indentation layers
filetype plugin indent on  
syntax on           " Enable syntax highlighting

set mouse=          " Don't use the mouse. Let the terminal handle copy/paste.
set visualbell      " Use visual bell (flash) instead of an audio beep

" ==============================================================================
" Status Bar & Search
" ==============================================================================
set ruler           " Show cursor line and column number
set laststatus=2    " Always show the status line

" Shows file layout, encoding, hex value of character under cursor, and line info
set statusline=%<%f%h%m%r%=%b\ %{&encoding}\ 0x%B\ \ %l,%c%V\ %P

set nohlsearch      " Keep searches unhighlighted until toggled
set incsearch       " Find matching strings incrementally as you type
set ignorecase      " Ignore case in search patterns...
set smartcase       " ...unless the pattern contains uppercase letters

" ==============================================================================
" Invisible Characters & Colors
" ==============================================================================
" Toggle visible tabs and trailing whitespace markers
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

if &diff
    colorscheme evening
endif

" Syntax theme overrides
hi Comment      term=NONE cterm=NONE ctermfg=Cyan
hi Constant     ctermfg=gray
hi String       ctermfg=green
hi Folded       ctermbg=black ctermfg=green guibg=black guifg=green
hi FoldColumn   guibg=black guifg=green
hi NonText      ctermfg=blue guifg=#4a4a59
hi SpecialKey   ctermfg=blue guifg=#4a4a59
hi ExtraWhitespace ctermbg=red guibg=red

" Modern, clean Git-Diff colors
highlight DiffAdd    term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan  ctermfg=black
highlight DiffText   term=reverse cterm=bold ctermbg=gray  ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red   ctermfg=black

" ==============================================================================
" Custom Mappings & Commands (Your Toolkit)
" ==============================================================================
set wrapmargin=3
let &showbreak = '  '

" Use nnoremap/nnoremap for safety so shortcuts don't accidentally recursively loop
nnoremap q3 :e #<CR>
nnoremap q1 :e #1<CR>
nnoremap q2 :e #2<CR>
nnoremap q4 :buffers<CR>
nnoremap qP gqip}
nnoremap qD dG
nnoremap _  ct_
nnoremap qc :.ce120<CR>
nnoremap qh :set hls!<CR>
nnoremap qp :set paste!<CR>

" Strip trailing whitespace across the whole file cleanly without moving your cursor
nnoremap qb :let _s=@/<Bar>%s/\s\+$//e<Bar>let @/=_s<Bar>unlet _s<CR>

" Common typos / Lazy command capitalization fixes
command! W w
command! Q q

" Quick Git Grep for the word currently under your cursor
nnoremap qg :!git grep <cword><CR>

" Map ; to : for faster command typing, preserving original ; functionality on ;;
nnoremap ; :
nnoremap ;; ;

" Rebuild ctags while safely ignoring bulky development artifacts
nnoremap qt :!ctags -R --exclude=.git --exclude=tmp --exclude=logs --exclude=app/assets/javascripts --exclude=doc --exclude=generate/vendor .<CR>

" Formatting markers
set colorcolumn=121 " Vertical rule reminder at 120 characters
set textwidth=120   " Automatically wrap text at 120 characters
