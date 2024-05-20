" Plugins
call plug#begin('~/.config/nvim/plugged')
	" Fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Colorscheme
	Plug 'elvessousa/sobrio'

	" Improved syntax highlighting
	Plug 'sheerun/vim-polyglot'
call plug#end()

" Colorscheme
colorscheme sobrio
set termguicolors
set hlsearch

" Misc.
set tabstop=2
set shiftwidth=2
set cc=80
set relativenumber
set number

" Custom keymaps
nnoremap <silent> <C-p> :Files<CR>
