if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" ===== BEGIN VUNDLE =====
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin()
call vundle#rc(s:editor_root . '/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Surround
Plugin 'tpope/vim-surround'

" commentary
Plugin 'tpope/vim-commentary'

" ctrl-p
Plugin 'ctrlpvim/ctrlp.vim'

" dispatch
Plugin 'tpope/vim-dispatch'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" go syntax
Plugin 'fatih/vim-go'

" theme
Plugin 'rhysd/vim-color-spring-night'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===== END VUNDLE, BEGIN CONFIG =====

" === SYNTAX OPTIONS ===
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:python_host_prog = '/Users/kimberli/miniconda3/envs/python2/bin/python'
let g:python3_host_prog = '/Users/kimberli/miniconda3/envs/python3/bin/python'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=3

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["python", "javascript", "c", "cpp", "html"],
    \ "passive_filetypes": ["go"] }

let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_html_checkers = ["jshint", "tidy"]

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" === APPEARANCE ===
if has("termguicolors")
    set termguicolors
endif
set background=dark
colorscheme spring-night
let g:airline_theme='spring_night'
let g:airline#extensions#tabline#enabled = 1

" mappings
augroup qf  " skip quickfix windows in :bn and :bp
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

let mapleader="\,"
noremap 0 ^
noremap ^ 0
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>[ :bp<cr>
nnoremap <leader>] :bn<cr>
nnoremap <leader>x :bd<cr>
nnoremap <leader>f :find 
nnoremap <leader>l :call NumberToggle()<cr>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>m :Make<CR>
nnoremap <leader>d :Dispatch 
runtime macros/matchit.vim

" === CUSTOM ===
filetype plugin on
filetype indent on
syntax enable

set rnu " relative line numbers
set number
set history=50
set autoread " reload files
set so=5 " cursor buffer space on screen

set hidden
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set completeopt=menu

set ruler
set showmatch " match braces
set mat=2

set backspace=eol,start,indent " make backspace work
set whichwrap+=<,>,h,l

set ignorecase " searching
set smartcase
set hlsearch
set incsearch
set magic " regex magic

set lazyredraw " reduce lag
set nofoldenable

set nobackup " backups
set nowb
set noswapfile
set noerrorbells

set expandtab " tabs
set smarttab
set shiftwidth=4
set tabstop=4

set lbr " line breaks
set tw=500

set ai " indent
set si
set wrap

set laststatus=2 " status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set splitbelow
set splitright

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Remember the last position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Returns true if paste mode is enabled
function! HasPaste()
     if &paste
         return 'PASTE MODE  '
     endif
     return ''
endfunction
