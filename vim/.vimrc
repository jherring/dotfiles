"
" Plugins
"
call plug#begin('~/.vim/plugged')

" Addons
Plug 'scrooloose/nerdtree'
Plug 'yegappan/mru'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
" Plug 'jremmen/vim-ripgrep' #  causing error
Plug 'github/copilot.vim'
Plug 'blarghmatey/split-expander'
Plug 'farmergreg/vim-lastplace'
Plug 'jlanzarotta/bufexplorer'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-airline/vim-airline' " Status bar colouring
Plug 'preservim/nerdcommenter'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vimwiki/vimwiki'

" Tmux integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" File system navigation
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/is.vim' " Remove search on cursor move

" File navigation outline
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Syntax highlighting
Plug 'elzr/vim-json'
Plug 'tpope/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'vim-python/python-syntax'
Plug 'hashivim/vim-terraform'
Plug 'pprovost/vim-ps1'
Plug 'ekalinin/Dockerfile.vim'
Plug 'avanzzzi/behave.vim'

" Syntax errors
" Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'

" Markdown support
Plug 'junegunn/goyo.vim'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'

" Testing
Plug 'janko-m/vim-test'

" Gist
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

" Python Autocomplete
Plug 'davidhalter/jedi-vim'
" Reference
" ---------
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_stubs_command = "<leader>s"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
let g:jedi#environment_path = ".venv"

" Syntax checker
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>p :SyntasticCheck<CR>


call plug#end()

"
" Vim settings for @jherringdev based on @mscoutermarsh
"

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

syntax on
autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif


set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
"set textwidth=100

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/
set wildignore+=*/vendor/*

"-------------------------------------------------------------------------------
" interface
"-------------------------------------------------------------------------------
inoremap <C-w> <Plug>(copilot-next)
inoremap <C-q> <Plug>(copilot-previous)
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

"-------------------------------------------------------------------------------
" interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Move Line up or down
nnoremap <leader>k :move-2<CR>==
nnoremap <leader>j :move+<CR>==
xnoremap <leader>k :move-2<CR>gv=gv
xnoremap <leader>j :move'>+<CR>gv=gv

" Insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Maximise / Return to previous split size
nnoremap <C-W>O :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------

" show commit that introduced current line
map <leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

" Theme
set termguicolors
colorscheme gruvbox
set background=dark " or light

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set colorcolumn=100

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" NERDComment config
let g:NERDToggleCheckAllLines = 1

" NERDTree config
let g:NERDTreeWinSize = 60

" Show buffers
nnoremap <C-b> :Buffers<CR>

" CtrlP use FZF (faster!)
nnoremap <C-p> :Files<Cr>

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

let g:auto_save = 0  " disable on startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode

" Format Json
com! FormatJSON %!python -m json.tool

" Format XML
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" Get off my lawn - helpful when learning Vim :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

" if has('nvim')
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   set termguicolors
"   colorscheme NeoSolarized
"   set background=dark

"   " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
"   nmap <BS> <C-W>h

"   " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
"   nmap <BS> :<C-u>TmuxNavigateLeft<CR>
" endif



"-------------------------------------------------------------------------------
" FZF
"-------------------------------------------------------------------------------

" AgIn [path/to/search_and_replace/in] [search string]
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

"-------------------------------------------------------------------------------
" Nerdtree
"-------------------------------------------------------------------------------

" Toggle nerdtree with F8
map <F8> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
let NERDTreeIgnore=['\~$', '__pycache__']
"-------------------------------------------------------------------------------
" Tagbar
"-------------------------------------------------------------------------------
nmap <F7> :TagbarToggle<CR>

"--------------------------------------------------------------------------------
" PHP CS Fixer
"--------------------------------------------------------------------------------
let g:php_cs_fixer_rules = "@PSR2"
nnoremap <C-f> :call PhpCsFixerFixFile()<CR>

"--------------------------------------------------------------------------------
" VIM Session
"--------------------------------------------------------------------------------
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

"--------------------------------------------------------------------------------
" Git Fugitive
"--------------------------------------------------------------------------------
let g:fugitive_gitlab_domains = ['http://gitlab.fluid7.co.uk']

"--------------------------------------------------------------------------------
" Python
"--------------------------------------------------------------------------------
let g:python_highlight_all = 1
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']

"--------------------------------------------------------------------------------
" Terraform
"--------------------------------------------------------------------------------
let g:terraform_align=1

"--------------------------------------------------------------------------------
" Gutentags
"--------------------------------------------------------------------------------
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

"-------------------------------------------------------------------------------
" VimWIki
"-------------------------------------------------------------------------------
let g:vimwiki_list = [{'syntax': 'markdown'}]
