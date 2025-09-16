call plug#begin()

Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Personal Configs
set number  "Numbers
set relativenumber  "Make numbers relative

syntax on " Enable Syntax Highlighting

set showmatch " Show Matching Brackets Instantly

" Highlight Search Results and Enable Incremental Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Keep Cursor Centered while Scrolling

set scrolloff=8
set sidescrolloff=8

" Tab Settings

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set cursorline
syntax enable
set termguicolors

set clipboard=unnamedplus " Synchronize yank and paste with system clipboard

" Undofile to keep undo history when exiting
set undofile
set undodir=~/.config/nvim/undodir

"Initialize Lua for numToStr

lua << EOF
require('Comment').setup()
EOF

" Normal mode
nnoremap <C-_> :lua require('Comment.api').toggle.linewise.current()<CR>

" Visual mode
xnoremap <C-_> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" Insert mode (leave insert, toggle, re-enter insert)
inoremap <C-_> <Esc>:lua require('Comment.api').toggle.linewise.current()<CR>

" NERDTree Bindings
nnoremap <C-b> :NERDTreeToggle<CR>
inoremap <C-b> <Esc>:NERDTreeToggle<CR>

" Use <Tab> for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remove background color (transparent effect)
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

