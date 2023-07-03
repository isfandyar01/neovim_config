:let mapleader = ","
:set number
":set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a


call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
"Plug 'dense-analysis/ale'
Plug 'w0rp/ale'
Plug 'vim-scripts/DoxygenToolkit.vim' " Doxygen support
Plug 'vim-scripts/SpellCheck' " Spell checking
Plug 'vim-scripts/c.vim' " Syntax highlighting and indentation
Plug 'dhruvasagar/vim-dotoo' " managing to-do lists.
Plug 'mbbill/undotree' " Undo/Redo History Visualizer
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'neoclide/coc.nvim', {'branch': 'release'} " text completion endine
Plug 'lewis6991/gitsigns.nvim' " text buffer Git integration.
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-speeddating' " Quick date navigation
"Plug 'p00f/nvim-ts-rainbow' " Colorful parenthesis
Plug 'hrsh7th/nvim-compe' " versatile auto-completion.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax and code analysis
Plug 'luochen1990/rainbow' "colorfull parenthesis
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'danymat/neogen' "annotation generator
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax


call plug#end()

"call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
" Your minimal init.vim/vimrc
"set runtimepath+=~/home/isfand/.local/share/nvim/plugged/

"let g:deoplete#enable_at_startup = 1

let g:ale_linters= {
\	'python':['flake8'],
\	'yaml': ['yamllint'],
\	'cpp': ['clangtidy'],
\	'c': ['clangtidy'],
\	}

let g:ale_fixers = {
\	'*':['remove_trailing_lines', 'trim_whitespace'],
\	'python':['black','isort'],
\	'cpp': ['clang-format'],
\	'c': ['clang-format'],
\}

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 0
let g:ale_completion_enabled = 1
let g:ale_cpp_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
let g:ale_cpp_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
let g:ale_cpp_clangtidy_checks += ['clang-analyzer-cplusplus-doc-comments']

let g:ale_c_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
let g:ale_c_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
let g:ale_c_clangtidy_checks += ['-readability-function-cognitive-complexity']
let g:ale_c_clangtidy_checks += ['-readability-identifier-length']
let g:ale_c_clangtidy_checks += ['-misc-redundant-expression']
let g:ale_c_build_dir_names = ['build', 'release', 'debug']
let g:ale_set_balloons=1
let g:ale_hover_to_floating_preview=1

" Automatic fixing
autocmd FileType c nnoremap <leader>f <Plug>(ale_fix)

" This function searches for the first clang-tidy config in parent directories and sets it
function! SetClangTidyConfig()
		let l:config_file = findfile('.clang-tidy', expand('%:p:h').';')
		if !empty(l:config_file)
			let g:ale_c_clangtidy_options = '--config=' . l:config_file
			let g:ale_cpp_clangtidy_options = '--config=' . l:config_file
		endif
	endfunction

	" Run this for c and c++ files
	autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp call SetClangTidyConfig()

	let g:ale_sign_error = '>>'
	let g:ale_sign_warning = '!!'

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:airline_theme='molokai' " <theme> is a valid theme name

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"let g:neomake_python_enabled_makers = ['pylint']

call neomake#configure#automake('nrwi', 500)

hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000


colorscheme gruvbox

set background=dark " use dark mode
" set background=light " uncomment to use light mode


let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


let g:doge_doc_standard_python = 'numpy'
let g:doge_doc_standard_cpp ='doxygen_javadoc'
let g:doge_doc_standard_c ='doxygen_javadoc'

let g:doge_python_settings = {
\  'single_quotes': 0,
\  'omit_redundant_param_types': 1
\}

let g:doge_doxygen_settings = {
\  'char': '@'
\}

let g:doge_enable_mappings=1
let g:doge_mapping = '<Leader>]'


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap for format selected region
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
