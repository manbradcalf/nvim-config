filetype plugin indent on
syntax on

set number relativenumber
set nowrap
set showcmd
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set ruler
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set noswapfile
set undofile
set undodir=~/.vim/undodir

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'eliba2/vim-node-inspect'
Plug 'felixhummel/setcolors.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:netrw_altv = 1 
colorscheme candycode

"" Ripgrep uses git root if there
if executable('rg')
    let g:rg_derive_root='true'
endif

hi Pmenu ctermfg=White ctermbg=235
hi PmenuSel ctermfg=Black ctermbg=White
" hi ColorColumn ctermbg=Gray
" Checks silently for local vim config

"" Set my colors to 'all' so i can toggle through
"" all schemes in /colors
autocmd VimEnter * :SetColors all
"" treat handlebars as html files for formatting purporses
autocmd BufEnter *.hbs :set ft=html

"" Set tab keys to match bracket pairs
" nnoremap <tab> %
" vnoremap <tab> %

let mapleader = "\<Space>"

"" Sane text wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=0

"" exit easier
inoremap <C-q> <C-\><C-n> 
tnoremap <C-q> <C-\><C-n>

"" ,ev to open and edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.config/nvim/init.vim<cr>

" window navigation
nnoremap <leader><Tab>h :wincmd h<CR>
nnoremap <leader><Tab>l :wincmd l<CR>
nnoremap <leader><Tab>j :wincmd j<CR>
nnoremap <leader><Tab>k :wincmd k<CR>
nnoremap <leader>ew :wincmd =<CR>

"" resize width bigger
nnoremap <leader>. 10<C-w>>
"" resize width smaller
nnoremap <leader>, 10<C-w>< 

" tab nav
nnoremap <leader><Tab>] :+tabnext<CR>
nnoremap <leader><Tab>[ :-tabnext<CR>
nnoremap <leader><Tab><BS> :tabclose<CR>

"" prettier
nnoremap <leader>pf :Prettier<CR>

"" Save 
nnoremap <leader>s :w<CR>

"" Mimic forward and backward normal operation
nnoremap <leader>[ <C-o>
nnoremap <leader>] <C-i>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>1 :Lexplore<CR>
" nnoremap <leader>1 :NERDTreeToggle<CR> 
let g:netrw_browse_split=0
let g:netrw_winsize = 25
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>ef :CocFix<CR>

"" Space Tab to write and save
nnoremap <leader><Tab> :w!<CR>
nnoremap <leader>q :q<CR>

"" UndoTree
nnoremap <leader>u :UndotreeShow<CR>

"" Autocompletion and navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

"" Formatting and Coc utilities
nmap <leader><Tab>f :CocCommand prettier.formatFile<CR>
nnoremap <leader>cr :CocRestart
nnoremap <leader>cf :CocFix<CR>
nnoremap <leader>di :CocList diagnostics<CR>

"" Node Debugging
let g:node_inspect_start_repl = 0
nnoremap <leader>bb :NodeInspectToggleBreakpoint<CR>
nnoremap <leader>dn :NodeInspectStart<CR>
nnoremap <leader>dnx :NodeInspectStop<CR>
nnoremap <leader>dn<TAB> :NodeInspectStepOver<CR>

"" remove highlights
nnoremap <leader>ho :noh<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"" Insert mode sanity
"" Insert to block visual to emulate highlighting
inoremap <c-v> <ESC><C-v>
"" Insert to line visual to emulate highlighting
inoremap <c-S-v> <ESC><S-v>

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
:autocmd CursorHold * call CocActionAsync('doHover')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


"" Make Coc use tab select
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_snippet_next = '<tab>'
let g:ut = 2000
silent! so .vimlocal
