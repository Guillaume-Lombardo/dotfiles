"---------------------------------------------------------------------------
" PLUGINS
"---------------------------------------------------------------------------

call plug#begin('~/local/share/nvim/plugged')
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Tags
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
" Commenting
Plug 'tpope/vim-commentary'
" Syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rust-lang/rust.vim'
" Motions
Plug 'easymotion/vim-easymotion'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Misc
Plug 'rrethy/vim-hexokinase', { 'do': 'sudo make hexokiase' }
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'

call plug#end()

"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------

set nocompatible               " not compatible with the old-fashion vi mode
                               " set bs=2		" allow backspacing over everything in insert mode
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set autoread                   " auto read when file is changed from outside
set autoindent                 " auto indentation
set number                     " set line number
set relativenumber             " set relative line number
set mouse=a                    " enable mouse to point and scroll
set clipboard=unnamed          " yank to the system register (*) by default
set showmatch                  " Cursor shows matching ) and }
set showmode                   " Show current mode
set wildchar=<TAB>             " start wild expansion in the command line using <TAB>
set wildmenu                   " wild char completion menu
set incsearch                  " incremental search
set nobackup                   " no *~ backup files
set copyindent                 " copy the previous indentation on autoindenting
set ignorecase                 " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab                   " insert tabs on the start of a line according to context
set hlsearch                   " search highlighting
set expandtab                  " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set termguicolors
set wildmode=longest,list,full " Autocompletion
set splitbelow splitright      " Fix splitting
set cursorline                 " Cursor line
set cursorcolumn               " Cursor line
"set nocursorline               " Cursor line
"set nocursorcolumn             " Cursor line
set hidden                     " coc TextEdit might fail if hidden is not set.
highlight CursorLine guibg=#303030
highlight CursorColumn guibg=#303030
au FileType Makefile set noexpandtab
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set noerrorbells " disable sound on errors
set novisualbell " disable sound on errors
set t_vb=        " disable sound on errors
set tm=500       " disable sound on errors

" status line
" set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
" set statusline+=\ \ \ [%{&ff}/%Y]
" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

"skip using the viminfo file entirely
let skip_defaults_vim=1
set viminfo=""

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others

" syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
syntax on		" syntax highlight

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.tex set filetype=tex

" set spell check
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" auto reload vimrc when editing it
autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim

" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=fr_fr<CR>
" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

"exit eterminal mode with escape key
tnoremap <esc> <C-\><C-n>

" Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"---------------------------------------------------------------------------
" PLUGINS SETTINGS
"---------------------------------------------------------------------------

" ------COC---------------
set nobackup        " Some servers have issues with backup files
set nowritebackup
set cmdheight=2     " Give more space for displaying messages.
set updatetime=300
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.
if has("patch-8.1.1564") " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
highlight SignColumn guibg=black
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('nvim')
  inoremap <silent><expr> <c-A-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>  " Use K to show documentation in preview window.

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ------AIR-LINES---------
let g:airline_theme = 'codedark'

" ------HEXOKINASE--------
let g:Hexokinase_highlighters = ['backgroundfull','sign_column']
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
autocmd VimEnter * HexokinaseTurnOn

" ------CLOSETAG----------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ----------EMMET---------
let g:user_emmet_leader_key='<A-c>'

" ------MOTION------------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" -----------EASY ALIGN-----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---------GIT GUTTER-------
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1

" ---------COMMENTARY-------

