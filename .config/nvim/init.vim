call plug#begin()

" the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
Plug 'christoomey/vim-tmux-navigator'

" A Lightweight File Browser based on netrw
Plug 'tpope/vim-vinegar'

" wisely add end in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" A simple, easy-to-use Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ack
Plug 'mileszs/ack.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" show the list of buffers in the command bar
" Plug 'bling/vim-bufferline'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" emmet for vim: http://emmet.io
Plug 'mattn/emmet-vim'

" Create your own text objects
Plug 'kana/vim-textobj-user'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim'

" ruby
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'

" solidity
Plug 'tomlion/vim-solidity'

" erlang
" Plug 'vim-erlang/vim-erlang-tags'
" Plug 'vim-erlang/vim-erlang-runtime'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'vim-erlang/vim-erlang-compiler'

" crystal
" Plug 'rhysd/vim-crystal'

" elixir
" Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'

" rust
Plug 'rust-lang/rust.vim'
" let g:rust_recommended_style = 0

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" typescript
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
syntax enable
set autoread
set timeoutlen=500 ttimeoutlen=0 " Avoid delays

" set number norelativenumber
set number relativenumber
set ruler
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50

set title        " make your xterm inherit the title from Vim

" More natural split opening
set splitbelow

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" ---------- from coc.vim ----------
" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType ruby,javascript,typescript,json,rust setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" ---------- from coc.vim end ----------

" vim-easy-align
" ***************************************************************************************************
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" FZF
" ***************************************************************************************************
let g:fzf_nvim_statusline = 0
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Redefine Ag command
" https://vi.stackexchange.com/questions/13965/what-is-command-bang-nargs-in-a-vimrc-file
" https://vi.stackexchange.com/questions/14242/how-to-call-the-fzf-ag-command-with-multiple-arguments
" function! s:ag_with_opts(arg, bang)
  " let tokens  = split(a:arg)
  " let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  " let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  " call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
" endfunction
" autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

" bind :Ag cmd to <leader>g, so you can search text in vim
" nnoremap <Leader>g :Ag<Space>

" ACK
" ***************************************************************************************************
" if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
" endif

let g:ackprg = 'ag --vimgrep -S'
nnoremap <Leader>g :Ack!<Space>

let g:cargo_path="~/.cargo/registry/src"
command! -nargs=1 Ackc execute 'Ack! --rs <args> ' . g:cargo_path
nnoremap <Leader>c :Ackc<Space>

let g:gems_path="/Users/itering/.rvm/gems/ruby-3.0.0/gems"
command! -nargs=1 Ackr execute 'Ack! --rs <args> ' . g:gems_path
nnoremap <Leader>r :Ackr<Space>


" Replace
" ***************************************************************************************************
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nerdcommenter
" nmap zz <leader>ci<CR>
" nnoremap <expr> v:count == 0 ? '':v:count.'zz'
" let g:NERDSpaceDelims = 1

" colortheme
" colorscheme one
colorscheme gruvbox
set background=dark
let g:airline_theme="gruvbox"
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark='soft'
" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic

" font
" set guifont=Menlo\ Regular:h40
" set guifont=JetBrains\ Mono\ Regular:h50

" Indention
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set shiftround
xnoremap < <gv
xnoremap > >gv

" Display extra whitespace
set list lcs=tab:>·,trail:·,nbsp:·

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new tab
nmap <leader>e :tabe<Space>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

let g:airline_theme='gruvbox'
" let g:airline_solarized_bg='light'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

nnoremap <Leader>d. :call DeleteFileAndCloseBuffer()<CR>
fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Yes!\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | bd! | endif
endfun

let g:netrw_banner = 1
let g:netrw_liststyle = 1
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" let g:netrw_keepdir=0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" numbertoggle
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" easy motion

" Change the behavior of paste
" https://stackoverflow.com/questions/25267062/after-pasting-a-yanked-line-in-vim-why-cant-i-paste-it-again
xnoremap p pgvy 

" terminal
" nnoremap <leader>t :12sp term://zsh<CR>
" tnoremap <Esc> <C-\><C-n>
" tnoremap <Esc> <C-\><C-n>:q!<CR>

let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
  if win_gotoid(g:term_win)
      hide
  else
      " vertical new
      botright new
      exec "resize "  . a:height
      try
          exec "buffer " . g:term_buf
      catch
          call termopen($SHELL, {"detach": 0})
          let g:term_buf = bufnr("")
          set nonumber
          set norelativenumber
          set signcolumn=no
      endtry
      startinsert!
      let g:term_win = win_getid()
  endif
endfunction

nnoremap <leader>t :call TermToggle(26)<CR>
" nnoremap <leader>t :call TermToggle()<CR>
" tnoremap <Esc> <C-\><C-n>

" set hidden
" let g:racer_cmd = '/Users/wuminzhe/.cargo/bin/racer'
" let g:racer_experimental_completer = 1
" let g:racer_insert_paren = 1

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

" "   \ 'rust': ['rust-analyzer'],
" "   \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
" let g:LanguageClient_serverCommands = {
"     \ 'ruby': ['~/.rvm/gems/ruby-2.6.3/bin/solargraph', 'stdio'],
"     \ 'javascript': ['typescript-language-server', '--stdio'],
"     \ 'typescript': ['typescript-language-server', '--stdio']
"     \ }
" 
" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" " note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" " Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)

" autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType rust setlocal noexpandtab shiftwidth=4 tabstop=4
set shell=bash\ -i

" https://vim.fandom.com/wiki/Format_pasted_text_automaticall
" nnoremap p p=`]
nnoremap <c-p> p
set autoindent smartindent

nmap <space>e :CocCommand explorer<CR>

set mouse=a

set clipboard=unnamed " use OS clipboard
