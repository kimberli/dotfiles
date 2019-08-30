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

" " Syntastic
" Plugin 'vim-syntastic/syntastic'

" ALE
Plugin 'w0rp/ale'

" Surround
Plugin 'tpope/vim-surround'

" tab autocomplete
Plugin 'ervandew/supertab'

" commentary
Plugin 'tpope/vim-commentary'

" dispatch
Plugin 'tpope/vim-dispatch'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" vim-wordmotion
Plugin 'chaoren/vim-wordmotion'

" vim-terraform
Plugin 'hashivim/vim-terraform'

" smarter tabs
Plugin 'tpope/vim-sleuth'

" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

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
set statusline+=%*

let g:python_host_prog = '/Users/kimberli/miniconda3/envs/python2/bin/python'
let g:python3_host_prog = '/Users/kimberli/miniconda3/envs/python3/bin/python'

" vim-terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save=1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=3
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["python", "javascript", "c", "cpp", "html"],
    \ "passive_filetypes": ["go"] }
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_html_checkers = ["jshint", "tidy"]
let g:syntastic_cpp_compiler_options = "-std=gnu++11 -std=gnu++1y"

" ALE
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_c_clangformat_options = '--style=Google'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'cpp': ['cpplint'],
\   'python': ['pylint'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'cpp': ['clang-format'],
\ }
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 5
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    autocmd QuitPre * if empty(&bt) | lclose | endif
augroup END

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Constant'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'CursorLine'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Constant'],
  \ 'info':    ['fg', 'Special'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

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
let g:airline#extensions#ale#enabled = 1

" mappings
augroup qf  " skip quickfix windows in :bn and :bp
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

let mapleader="\,"
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
noremap 0 ^
noremap ^ 0
noremap <C-P> :GFiles<CR>
noremap <C-N> :Lines<CR>
noremap <silent> <leader>j :ALENext<cr>
noremap <silent> <leader>k :ALEPrevious<cr>
nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap // y/<C-R>"<CR>

nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>x :bd<CR>
nnoremap <leader>e :edit  
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>
nnoremap <leader>l :call NumberToggle()<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>m :w<CR>:Make<CR>
nnoremap <leader>p :Dispatch 
nnoremap <C-g> [{

" insert mode mappings
" Just smash j + k to escape
inoremap jk <esc>l
inoremap kj <esc>l

" up/down to same indentation
nnoremap K :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap J :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
vnoremap K mt:call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>my`tv`y
vnoremap J mt:call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>my`tv`y

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
    set nonumber
	:GitGutterDisable
  else
    set rnu
    set number
    :GitGutterEnable
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
