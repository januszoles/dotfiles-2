" Vim. Live it. ------------------------------------------------------- {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
" }}}

" What is this 'Vee-Eye' of which you speak? -------------------------- {{{
set nocompatible
" }}}

" Vundle -------------------------------------------------------------- {{{
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tpope/vim-surround'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'goldfeld/vim-seek'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joonty/vdebug'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'juvenn/mustache'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Lifesaver ----------------------------------------------------------- {{{
if &term =~ '256color'
   "Disable Background Color Erase (BCE) so that color schemes
   "work properly when Vim is used inside tmux and GNU screen.
   "See also http://snk.tuxfamily.org/log/vim-256color-bce.html
   " May be unnecessary see:
   " http://www.reddit.com/r/vim/comments/1a29vk/fixing_vims_background_color_erase_for_256color/c8thqe7
   set t_ut=
endif
" }}}

" Basic options ------------------------------------------------------- {{{
let mapleader=','
set t_Co=256              " My terminal's got all those colors, yo

set title                 " Change the terminal title
set encoding=utf-8        " Show utf-8 chars
set showcmd               " count highlighted
set ruler                 " Show where I am in the command area
set showmode              " -- INSERT (appreciation)-- :)
set laststatus=2          " always show the status line
                          " ↪ (0 = never, 1 = default [multi-window only])
set mouse=a               " Use the mouse

set modelines=0           " Don't read first/last lines of file for settings
set hidden                " Stash unwritten files in buffer
set vb                    " Don't beep at me
set cursorline            " Highlight current line
set scrolloff=3           " Start scrolling when I'm 3 lines from top/bottom
set history=1000          " Remember commands and search history
set backspace=2           " Backspace over indent, eol, and insert
set mousehide             " Hide the mouse pointer while typing

set binary                " Don’t add empty newlines at the end of files
set noeol

set number                " Show linenumbers
set nowrap                " Turn off linewrap
set list                  " Show invisible chars
set tabstop=2             " 2 spaces
set shiftwidth=2          " 2 spaces
set softtabstop=2         " 2 spaces
set expandtab             " Expand tabs to spaces

set hlsearch              " highlight my search
set incsearch             " incremental search
set wrapscan              " Set the search scan to wrap around the file

set ignorecase            " when searching
set smartcase             " …unless I use an uppercase character

syntax on                 " Syntax highlighting
syntax sync minlines=256  " Makes big files slow
set synmaxcol=2048        " Also long lines are slow
set autoindent            " try your darndest to keep my indentation
set smartindent           " Be smarter about indenting dummy
set formatoptions=tcqr    " I like smart comments

set foldmethod=marker     " Fold on 3x{
set nofoldenable          " But turn it off initially


"no backup or swap files
set nobackup
set nowritebackup
set noswapfile

" Colorscheme
" https://github.com/altercation/vim-colors-solarized
" colorscheme solarized
set background=dark
" colorscheme iawriter
colorscheme Tomorrow-Night

" GUI Font (same as my gnome-terminal font)
" https://github.com/adobe/source-code-pro
set guifont=Source\ Code\ Pro\ 14

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" }}}

" Version 7.3 (703) --------------------------------------------------- {{{
if v:version >= 703
  set colorcolumn=75
  hi ColorColumn ctermbg=234
  set undodir=~/.vim-undo
  set undofile
  set undolevels=1000 "max number of changes that can be undone
  set undoreload=10000 "max number lines to save for undo on buffer reload

  " Toggle line numbers in normal mode, set by default
  set number relativenumber
  function! NumberToggle()
    if(&relativenumber == 1)
      set number norelativenumber
    else
      set number relativenumber
    endif
  endfunc

  nnoremap <leader>n :call NumberToggle()<cr>
endif
" }}}

" Dumb osx -------- --------------------------------------------------- {{{
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set clipboard=unnamed
    endif
endif
" }}}

" Convenient Mappings ------------------------------------------------- {{{
" Make regex sane
nnoremap / /\v

" Dumb escape
inoremap JJ <ESC>
vnoremap JJ <ESC>

" Vimrc editing
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" un-highlight search results
nnoremap <silent><leader><space> :noh<cr>

" Toggle auto-indent before clipboard paste
set pastetoggle=<leader>p

" Shortcut to rapidly toggle `set list`
nnoremap <silent><leader>l :set list!<cr>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Close a window
nnoremap <silent><leader>q :q<cr>

" Close buffer
noremap <silent><leader>d :bd<cr>

" Buffer previous
noremap <silent><leader>z :bp<CR>

" Buffer next
noremap <silent><leader>x :bn<CR>

nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew %<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Vmap for maintain Visual Mode after shifting > and <, prevents the use of
" '.' to repeat
" vmap < <gv
" vmap > >gv

" Better use of folding
" nnoremap <leader>z za
" }}}

" Status line --------------------------------------------------------- {{{
augroup ft_statuslinecolor
    au!
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.
set statusline+=%=   " Right align.
" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
" }}}

" Autocmds -------------------------------------------------- {{{
autocmd FileType make setlocal noexpandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Development Tools --------------------------------------------------- {{{
" Tagbar (requires Exuberant ctags 5.5+)
nnoremap <silent><leader>c :TagbarToggle<cr>

" Xdebug local debugger
let g:vdebug_options = {
\    'server': '33.33.33.1',
\    'port': '9000',
\    'path_maps' : {
\        '/srv/www/local.people.dev': '/Users/tyler/Development/upsync-vagrant/shared/people'
\    }
\}

let g:syntastic_javascript_jshint_conf="$HOME/.jshintrc"
" }}}

" NERDTree Settings---------------------------------------------------- {{{
"map <leader>t :NERDTreeToggle<cr>
nnoremap <leader>t :NERDTreeTabsToggle<cr>
" Close vim if NERDTree is the last thing standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Included for Airline ------------------------------------------------ {{{
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
" }}}

" CtrlP --------------------------------------------------------------- {{{
let g:ctrlp_max_files = 0 " Set no max file limit
let g:ctrlp_working_path_mode = 0 " Search current directory not project root
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif

    let g:ctrlp_show_hidden = 1
"}}}

" Version 7.4 && Lua — unleash the completion! ------------------------ {{{
if v:version >= 704 && has("lua")
  " Neocomplete.vim --------------------------------------------------- {{{
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  " I will probably never hit <TAB> 10 times
  let g:neocomplete#max_list = 10

  " Automatically open and close the popup menu / preview window
  " https://github.com/JessicaKMcIntosh/TagmaBufMgr/issues/8
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt=menuone,menu,longest

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()

  " Close popup by <Space>.
  " inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  " }}}

  " Neosnippet.vim ------------------------------------------------------ {{{
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
  " }}}
endif
" }}}

" Indent Guides ------------------------------------------------------- {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_space_guides = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=none
" }}}