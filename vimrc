""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Bundling
""""""""""""""""""""""""""""""""""""""""""""""""""
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))
 NeoBundleFetch 'Shougo/neobundle.vim'

" =================== UI =========================
NeoBundle 'nathanaelkane/vim-indent-guides' " indenting guidelines <leader> ig
NeoBundle 'chriskempson/base16-vim'         " ColourScheme
NeoBundle 'ap/vim-css-color'                " highlight css colours

NeoBundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" need for ctrlSpace
let g:airline_exclude_preview = 1

NeoBundle 'myusuf3/numbers.vim' " relative numbering toggle
NeoBundle 'gregsexton/MatchTag' " Highlights matching tags when the cursor is over one of them

" =================== fast edit  =================
NeoBundle 'tpope/vim-surround'             " quickly change surounded tags quotes brackts
NeoBundle 'Lokaltog/vim-easymotion'        " <leader><leader> (options: w,b, ......)
NeoBundle 'tmhedberg/matchit'              " matching tags
NeoBundle 'christoomey/vim-tmux-navigator' " provide movment integration with tmux, required for tmux script
NeoBundle 'vim-scripts/HTML-AutoCloseTag'  " fast close html tags
NeoBundle 'sudo.vim'                       " edit permission files :e sudo:/etc/passwd
NeoBundle 'vim-forrestgump'                " repl <leader> r

NeoBundle 'matze/vim-move'                 " moving lines <A-k>

NeoBundle 'chrisbra/NrrwRgn'               " narrow the region
    " NrrwRgn {
        vnoremap <Enter> :NR<cr>
    " }

NeoBundle 'vim-scripts/compview'           " fast serach buffer <leader> v
    " compview {
        nnoremap <leader>v :CompView<cr>
    " }

NeoBundle 'mattn/emmet-vim'
    " emmet {
        let g:use_emmet_complete_tag = 1
    " }

NeoBundle 'godlygeek/tabular'
    " tabularize {
        vnoremap <silent> <Space> :Tabularize /
        inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
        function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
        endfunction
    "}

NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'SirVer/ultisnips'  " snippets
    " ultra snippets {
        function! g:UltiSnips_Complete()
            call UltiSnips#ExpandSnippet()
            if g:ulti_expand_res == 0
                if pumvisible()
                    return "\<C-n>"
                else
                    call UltiSnips#JumpForwards()
                    if g:ulti_jump_forwards_res == 0
                   return "\<TAB>"
                    endif
                endif
            endif
            return ""
        endfunction

        au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsListSnippets="<c-e>"
        " this mapping Enter key to <C-y> to chose the current highlight item 
        " and close the selection list, same as other IDEs.
        " CONFLICT with some plugins like tpope/Endwise
        inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        let g:ycm_key_list_select_completion=[]
        let g:ycm_key_list_previous_completion=[]
    " }

" =================== Completions ================
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'docunext/closetag.vim'

NeoBundle 'marijnh/tern_for_vim'
    " tern {
            let g:tern_show_argument_hints   = 'on_move'
            let g:tern_show_signature_in_pum = 1
            map <leader>tt :TernType<CR>
            map <leader>td :TernDef<CR>
            map <leader>tD :TernDoc<CR>
            map <leader>tr :TernRename<CR>
    " }


" ================== version control =============
NeoBundle 'tpope/vim-fugitive'     " vim git commands
NeoBundle 'airblade/vim-gitgutter' " create a gutter for git + - when file is changed
NeoBundle 'sjl/splice.vim'         " 3 way diff for git merge

NeoBundle 'sjl/gundo.vim'          " python! change tree
    " gundo {
        nnoremap <F2> :GundoToggle<CR>
    " }

NeoBundle 'int3/vim-extradite'     " git history of current file
    " Extradite {
        nnoremap <F4> :Extradite<CR>
    " }

" ================== IDE =========================
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'kien/ctrlp.vim' 
NeoBundle 'mileszs/ack.vim'
NeoBundle 'zoeesilcock/vim-caniuse' " can i use :Caniuse border-radius

NeoBundle 'scrooloose/nerdtree' 
    " Nerdtree {
        map <F1> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

NeoBundle 'majutsushi/tagbar'
    " tagbar {
        let g:tagbar_usearrows = 1
        nnoremap <F3> :TagbarToggle<CR>
    " }

NeoBundle 'szw/vim-ctrlspace'
    " ctrlSpace {
        let g:ctrlspace_load_last_workspace_on_start=1
    " }

" ================== Syntax ======================
NeoBundle 'JulesWang/css.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'moll/vim-node' " Helpers for working in NodeJS
NeoBundle 'sheerun/vim-polyglot' 

" ================== Lint ========================
NeoBundle 'scrooloose/syntastic'



call neobundle#end()
NeoBundleCheck
"""""""""""""""""""""""""""""""""""""""""""
" End Bundling
"""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on

set autoread " Set auto read when a file is changed outside
set history=128
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers'

"""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-eighties
set so=7        " 7 lines to the cursor
set showcmd
set ru
set nu
set laststatus=2 " show status line
set mousehide
set hidden      " Always show cursor position
set wrapmargin=0
set linebreak
set background=dark

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase " ignore case when search
set smartcase

"""""""""""""""""""""""""""""""""
" Highlighting
"""""""""""""""""""""""""""""""""
set hlsearch                                    " highlight search things
hi htmlTag guifg=#00bdec guibg=#200000 gui=bold " highlight html tags block
set cursorline   "highlight current line
set cursorcolumn "highlight current column

set incsearch    " Highlight search as you type
set nolazyredraw " dont redraw while executing macros

if &diff
	" only interested in diff colours
	syntax off
endif

set magic     " set magic on, for reugular expressions
set showmatch " show matching bracets when text indication is over them
set mat=2     " how many tenths of a second to blink

"Make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

"""""""""""""""""""""""""""""""""
" Error Handling
"""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell
set t_vb=
set vb t_vb=
set tm=500"

"""""""""""""""""""""""""""""""""
" Indenting
"""""""""""""""""""""""""""""""""
set noautoindent smartindent
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set nojoinspaces

"""""""""""""""""""""""""""""""""
" Default Key Bindings
"""""""""""""""""""""""""""""""""
let mapleader= ";"
nmap <space> :
imap jk <esc>
imap <C-c> <esc>

imap <Leader>date   <C-R>=strftime("%d/%m/%y")<CR>
imap <Leader>time   <C-R>=strftime("%T")<CR>

" \n to turn off search highlighting
nmap <silent> <leader>h :silent :nohlsearch<CR> 
" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>          
" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>                
" allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x                                  


" faster back space
inoremap <c-h> <bs>

" fast function
inoremap <c-l> var 

map <leader>bd :bd<cr>

" tab configurations
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" split
map <leader>s :vsp<cr>

" Arrows to switch buffer
map <right> :bn<cr>
map <left> :bp<cr>

" Shift Arrows to switch tabs
map <s-right> :tabnext<cr>
map <s-left> :tabprevious<cr>

" quit all
map <leader>q :qa<cr>

" quick indenting
vnoremap <C-h> <ESC>v<<ESC>
vnoremap <C-l> <ESC>v><ESC>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Tmux
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

set pastetoggle=<F9>
" disable paste mode after leave insert
au InsertLeave * set nopaste

" save file in normal mode
nnoremap s :w<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Q to repeat last macro @@
map Q @@

" Change Working Directory to that of the current file
cmap cd. lcd %:p:h<cr>"

" Remove trailing white space before save
autocmd! BufWritePost :%s/\s\+$//e"

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif"

" vim cant detect json by default
au BufRead,BufNewFile *.json setf json


" force saving file that requires root permission
cmap w!! %!sudo tee > /dev/null %

" scroll history
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

" jump to begin / end
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => backup files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
function! InitBackupDir()
    let separator = "."
    let parent = $HOME .'/' . separator . 'vim/'
    let backup = parent . 'backup/'
    let tmp    = parent . 'tmp/'
    if exists("*mkdir")
        if !isdirectory(parent)
            call mkdir(parent)
        endif
        if !isdirectory(backup)
            call mkdir(backup)
        endif
        if !isdirectory(tmp)
            call mkdir(tmp)
        endif
    endif
    let missing_dir = 0
    if isdirectory(tmp)
        execute 'set backupdir=' . escape(backup, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if isdirectory(backup)
        execute 'set directory=' . escape(tmp, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if missing_dir
        echo "Warning: Unable to create backup directories: " 
        . backup ." and " . tmp
        echo "Try: mkdir -p " . backup
        echo "and: mkdir -p " . tmp
        set backupdir=.                 
        set directory=.
    endif
endfunction          
call InitBackupDir()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => allow you yank to mac clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 730 && has("macunix")
  set clipboard=unnamed
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => persist undo on reopening file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is only present in 7.3+
" :help undo-persistence
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

" Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
endif

" ctrlp {
    let g:ctrlp_map = '<c-p_p>'
    let g:ctrlp_working_path_mode = '.' " make it open the root directory
    nnoremap <leader>x :CtrlP<CR>
    nnoremap <leader>X :ClearCtrlPCache<cr>\|:CtrlP<CR>
" }

" minibuffer explore {
    let g:miniBufExplModSelTarget      = 1 " active when using with taglist
    let g:miniBufExplorerMoreThanOne   = 2 " only activate when more then one buffer
    let g:miniBufExplUseSingleClick    = 1 " single click to change file
    let g:miniBufExplMapWindowNavVim   = 1 " hjkl mappig
    let g:miniBufExplSplitBelow        = 0 " 1 below, 0 above
    let g:miniBufExplMapCTabSwitchBufs = 1 " tab s-tab navigation
    let g:bufExplorerSortBy            = "name"
    autocmd BufRead,BufNew :call UMiniBufExplorer
    map <leader>u :MBEToggle<cr>
" }

" splitjoin {
    nmap <Leader>sj :SplitjoinJoin<cr>
    nmap <Leader>ss :SplitjoinSplit<cr>
" }

" surround {
    " remap shift-s to just s
    vmap s S
" }

" ag {
    let g:ackprg = 'ag --nogroup --nocolor --column'
    nmap <leader>g :Ack <C-R>=expand("<cword>")<CR><CR>
" }
"
" syntastic {
    let g:syntastic_javascript_checkers=['jshint']
    let g:Synstatic_javascript_jshint_conf="~/.jshintrc"

    let g:syntastic_aggregate_errors=1
    let g:synstatic_check_on_open=0

    let g:syntastic_enable_signs=1
    let g:syntastic_error_symbol='✗'         " Error Symbol
    let g:syntastic_warning_symbol='⚠'       " Warning Symbol
    let g:syntastic_style_error_symbol='⚡'   " Style Error Symbol
    let g:syntastic_style_warning_symbol='⚡' " Style Warning Symbol
" }

" vim-move {
    let g:move_key_modifier = 'C'
" }
