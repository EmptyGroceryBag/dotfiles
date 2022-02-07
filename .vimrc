" PLUGINS
call plug#begin('~/.vim/plugged')

	"Plug '/home/Joey/.fzf/'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	"Plug 'ctrlpvim/ctrlp.vim'
	"let g:ctrlp_show_hidden=1
	let g:fzf_layout = { 'down': '~25%' }
	let g:fzf_preview_window = []

	Plug 'sheerun/vim-polyglot'
	Plug 'sainnhe/sonokai'
	let g:sonokai_style = 'andromeda'
	"let g:sonokai_enable_italic = 1 

call plug#end()

" COLOR SCHEME
set termguicolors
colorscheme sonokai
set t_Co=256

set makeprg=/opt/homebrew/bin/ninja

set mouse=a
set ttimeoutlen=10
set hlsearch
set tabstop=2
set shiftwidth=2
set cc=80
syntax enable
set relativenumber
set number
set background=dark
"don't allow vim to continue comments
set formatoptions-=cro
set rtp+=/home/Joey/.fzf/
set shellslash
set directory=/tmp

" CUSTOM KEYMAPS
nmap <TAB> %
nnoremap <silent> <C-p> :Files<CR>
nmap <silent> <S-Right> gt
nmap <silent> <S-Left> gT

" COMMANDS
:command -nargs=+ Grep vimgrep /<args>/ % | cope
