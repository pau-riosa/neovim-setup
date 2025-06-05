packadd minpac
call minpac#init()
" Plugins
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('scrooloose/nerdtree')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-markdown')
call minpac#add('vim-scripts/closetag.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('Yggdroot/indentLine')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko-m/vim-test')
call minpac#add('mxw/vim-jsx')
call minpac#add('storyn26383/vim-vue')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('digitaltoad/vim-pug')
call minpac#add('isRuslan/vim-es6')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('slashmili/alchemist.vim')
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('c-brenn/phoenix.vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('mattn/emmet-vim')
call minpac#add('dense-analysis/ale')


" Commands
command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean call minpac#clean()
command! PackStatus  call minpac#status()

" General
set clipboard=unnamed
syntax on
filetype plugin indent on
set nopaste
color desert
set tabstop=2
set ts=2
set shiftwidth=2
set expandtab
setlocal formatprg=mix\ format\ -
" mkdir -p ~/.vim/colors
" cd ~/.vim/colors
" curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
colorscheme jellybeans 
highlight Normal guibg=none
highlight NonText guibg=none
set number	" Display the line numbers
set showcmd
set showmode
set backspace=indent,eol,start
set mouse=ia "  Enable your track pad interaction
set incsearch   " Highlight matches as you type
set hlsearch    " Highlight matches
xnoremap p pgvy " Paste multiple times

" Clear cache
:nnoremap <CR> :nohlsearch<cr>

" Make it easy to navigate on insert mode
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Undo files
set undofile
if !has('nvim')
  set undodir=~/.vim/undo
endif

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


"Use deoplete
" let g:deoplete#enable_at_startup=1
" let g:deoplete#auto_complete_delay=500

"Use Silver Searcher
" let g:ag_working_path_mode="r"

" Leader commands
let mapleader=" "

nnoremap <leader>gs :<C-u>GFiles?<CR>
nnoremap <leader>ag :<C-u>Ag<CR>
nnoremap <leader>rg :<C-u>Rg<CR>
nnoremap <leader>f :<C-u>FZF<CR>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>mv :vsplit <cr>
nnoremap <leader>ms :split <cr>
nnoremap <leader>z <C-Z>
nnoremap <leader>g <C-O>

" Grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg', 'ag']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Neovim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" Key commands
imap jj <Esc>
map ss :w<cr>
map qq :q <cr>
nmap <tab> <c-w>w


" Create robust Elixir formatting function
function! SafeElixirFormat()
  " Check if we're in an Elixir or Phoenix LiveView template file
  let l:is_elixir = &filetype == 'elixir'
  let l:is_heex = expand('%:e') == 'heex'
  
  if !l:is_elixir && !l:is_heex
    return
  endif
  
  " Check if mix.exs exists in project
  let l:mix_file = findfile('mix.exs', '.;')
  if empty(l:mix_file)
    echo "No mix.exs found, skipping format"
    return
  endif
  
  " Save cursor position
  let l:curpos = getcurpos()
  
  " Run mix format on the current file
  let l:cmd = "mix format " . expand('%:p') . " 2>/dev/null"
  silent let l:output = system(l:cmd)
  
  " Reload the file and restore cursor
  edit!
  call setpos('.', l:curpos)
endfunction

" Set up autocommand to use our safe formatter for both Elixir and HEEX files
autocmd BufWritePost *.ex,*.exs,*.heex call SafeElixirFormat()

" Optional: If you want to set proper filetype for .heex files
" This helps with syntax highlighting and other filetype-specific features
augroup heex_ft
  au!
  autocmd BufNewFile,BufRead *.heex setfiletype eelixir
augroup END

" Linting
let g:ale_linters = {
\ 'javascript': ['eslint', 'prettier', 'tslint'],
\ 'typescript': ['eslint', 'prettier', 'tslint'],
\ 'elixir': ['credo', 'mix_format']
\}


let g:ale_enabled = 0
" Fixers
let g:ale_fixers = {
\   '*': ['mix_format', 'remove_trailing_lines', 'trim_whitespace']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
let g:ale_elixir_credo_strict=1
let g:ale_set_highlights=1
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed='always' " default
let g:ale_lint_on_save=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_filetype_changed=1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
nnoremap <Leader>l :ALELint<CR>


" New tests from vim-test
" Run only the example under the cursor
nmap <silent> <leader>tn :TestNearest<cr>
" Run last visit
nmap <silent> <leader>tl :TestLast<cr>
" Run visit
nmap <silent> <leader>tg :TestVisit<cr>
" Run this file
nmap <silent> <leader>tt :TestFile<cr>
" Run all test files
nmap <silent> <leader>ta :TestSuite<cr>

"""""""""""""""
" search replace all files in current (project folder)
"
" :call SearchAndReplace(search, value, directory)
"""""""""""""""
" function SearchAndReplace(search_value, replace_value, directory)
"   exec ":vimgrep /" . a:search_value . "/gj " . a:directory
"   exec ":cfdo %s/" . a:search_value . "/" . a:replace_value . "/g | update"
" endfunction



"""""""""""""""""""""
" vim-test extensions
"""""""""""""""""""""
" function! ElixirUmbrellaTransform(cmd) abort
"   if match(a:cmd, 'apps/') != -1
"     return substitute(a:cmd, 'mix test apps/\([^/]*/\)', 'cd apps/\1 \&\& mix test ', '')
"   else
"     return a:cmd
"   end
" endfunction

" let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
" let g:test#transformation = 'elixir_umbrella'
let g:test#preserve_screen = 0
let g:test#filename_modifier = ":."

" Run Mix Compile in File
function! RunPhoenixCompileFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  call SetTestFile()
  call RunPhoenixCompile(t:grb_test_file . command_suffix)
endfunction

" Run Credo in Project
function! RunPhoenixCompile(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!time mix compile --force " . a:filename
endfunction


" Run this file
map <leader>cc :call RunPhoenixCompileFile()<cr>
" Run all test files
map <leader>ca :call RunPhoenixCompile('')<cr>

" Run Credo in Project
function! RunPhoenixCredo(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!time mix credo --strict " . a:filename
endfunction

" Run Credo in File
function! RunPhoenixCredoFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  call SetTestFile()
  call RunPhoenixCredo(t:grb_test_file . command_suffix)
endfunction

" Run Credo in Line
function! RunNearestCredoLine()
  let spec_line_number = line('.')
  call RunPhoenixCredoFile(":" . spec_line_number)
endfunction

" Run only the example under the cursor
map <leader>yl :call RunNearestCredoLine()<cr>
" Run this file
map <leader>yy :call RunPhoenixCredoFile()<cr>
" Run all test files
map <leader>ya :call RunPhoenixCredo('')<cr>

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

" Destroy all Softwares
augroup vimrcEX
  autocmd!
  autocmd FileType text setlocal textwidth=78
  "Jump to last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0  && line("'\"") <= line ("$") |
        \   exe "normal g'\"" |
        \ endif
augroup END

"Indent at begining of line, else do completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"Rename file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>j :call RenameFile()<cr>

" Record Session
map <leader>r :Obsession<cr>
map <leader>rt :Obsession!<cr>

" Source vimrc
map <leader>so :so ~/.vimrc<cr>

"Easy navigate vim panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Terminal
map <leader>ts :split \| terminal <cr>
map <leader>tv :vsplit \| terminal <cr>
map <leader>tp :split \| terminal mix phx.server <cr>
map <leader>tg :split \| terminal mix deps.get <cr>
map <leader>tm :split \| terminal mix ecto.migrate <cr>
