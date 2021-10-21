nnoremap <SPACE> <Nop>
let mapleader=" "
set number relativenumber
set titlestring+=%(%{expand('%:p:~')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
set hidden
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set visualbell
set autoread

set splitbelow
set splitright

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
let g:tmuxline_preset = {
      \'a'    : ['#S', '#(whoami)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%R', '%a %d', '%Y'],
      \'z'    : '#H'}
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

tnoremap <Esc> <C-W>N
tnoremap § <C-W>N:q!<CR>

nnoremap § :term<CR>
inoremap jj <ESC>:update<CR>

"autocmd InsertLeave *.js,*.ts,*.jsx,*.tsx :CocCommand prettier.formatFile

syntax enable

set ignorecase
set hlsearch
set incsearch

set nowrap
set linebreak

nmap j gj
nmap k gk

nmap <C-p> :Telescope find_files<CR>

autocmd VimResized * wincmd = 
nnoremap H ^
nnoremap L $

set cmdheight=2

set updatetime=300

set shortmess+=c

set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nmap <leader>i :CocCommand tsserver.organizeImports<cr>
let g:used_javascript_libs = 'underscore,react'


call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'overcache/NeoSolarized'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'liuchengxu/vista.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()


let g:NERDTreeShowHidden = 1
let g:NERDTreeShowMinimalUi = 1
let g:NERDTreeIgnore = ['node_modules', '.git']
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


let g:vista_default_executive = 'coc'
let g:vista_echo_cursor_strategy = 'both'
nmap <C-o> :Vista finder<CR>
nmap <C-t> :Vista<CR>



" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

" let g:ale_fixers = {
      " \ 'javascript': ['eslint'],
      " \ 'java': ['google-java-format'],
      " \}

" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))    let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors    return l:counts.total == 0 ? 'OK' : printf(
      \   '%d! %d? ',
      \   all_non_errors,
      \   all_errors
      \)
endfunction

nmap <silent> <C-e> <Plug>(ale_next_wrap)
syntax on

set termguicolors
colorscheme NeoSolarized
set background=dark

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      'node_modules', '.git', 'build/.*', 'dist/.*'
      },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
}
EOF
