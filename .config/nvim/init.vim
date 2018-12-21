" インストール
" :call dein#install()
" アップデート
" :call dein#update()
" 再インストール
" :call dein#reinstall({plugin})

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let s:toml		= '~/.nvim/rc/dein.toml'
	let s:lazy_toml	= '~/.nvim/rc/dein_lazy.toml'

	call dein#load_toml(s:toml,			{'lazy': 0})
	call dein#load_toml(s:lazy_toml,	{'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

" textobj
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" jjでinsertを抜ける
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>

" 日本語入力オンのままコマンド
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" Color Scheme
syntax enable
set t_Co=256
colorscheme desert

filetype plugin indent on

" 補完ウィンドウの設定 :help completeopt
" set completeopt=menuone
set completeopt+=noinsert

let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
" let php_folding = 1

" タグ補完
" タグファイルの場所
augroup SetTagsFile
  autocmd!
  autocmd FileType php set tags=.git/tags
  autocmd FileType as3 set tags=.git/tags
augroup END
 
" zencoding連携
let g:use_zen_complete_tag = 1
 

" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=jedi#completions
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

 
" Ctrl +  o でタグアウトラインを表示
" nnoremap <C-o> :<C-u>Unite outline<CR>

" ,, でコメントアウトをトグル
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く(デフォルト設定のこと)
nmap <silent> <Leader>p :Project ~/.vimprojects<CR>
" サブプロジェクトを上に、vimgrepではなくgrepを使うように設定
let g:proj_flags = 'imstTv'

" memolist.vim設定
map ,mn  :MemoNew<CR>
map ,mc  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>

" HyblidText設定
autocmd BufEnter * if &filetype == "" | setlocal ft=hybrid | endif

" エラーマーカーの設定
let g:errormarker_errortext = '!!'
let g:errormarker_warningtext = '??'
let g:errormarker_errorgroup = 'Error'
let g:errormarker_errorgroup = 'Todo'

" zen-codingのインデント等の設定
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'indentation' : '\t',
\  'html' : {
\    'indentation' : ' ',
\    'filters' : 'html',
\   },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\}

" .vimrc編集 :Ev
command! Ev edit $MYVIMRC
" .vimrc再読み込み :Rv
command! Rv source $MYVIMRC

" タブ
set showtabline=2
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=0
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 自動改行オフ
set tw=0
" マウスモード有効
set mouse=a
" xtermとscreen対応
" set ttymouse=xterm2
"コメントアウトが連続して入力されるのを禁止 :a!でも代用可
autocmd FileType * setlocal formatoptions-=ro
" サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
" 挿入モードとノーマルモードでステータスラインの色を変更する
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=Black guibg=White gui=none ctermfg=Black ctermbg=White cterm=none
" ヴィジュアルモードで選択したテキストをnで検索する(レジスタv使用)
vnoremap <silent> n "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" gfでカーソル下のファイル名を新しいタブで開く
nnoremap gf :tabe <cfile><CR>
vnoremap gf :tabe <cfile><CR>
" 検索語が画面中央にくるように
" nmap n nzz
" nmap N Nzz
" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1

" sassシンタックスハイライト
au BufRead,BufNewFile *.scss set filetype=sass
" as3シンタックスハイライト https://github.com/mherkender/as3.vim
autocmd BufRead,BufNewFile *.as set filetype=as3
" mxmlシンタックス http://abdulqabiz.com/files/vim/mxml.vim
autocmd BufRead,BufNewFile *.mxml set filetype=mxml

" keymap
 
" 表示行単位で移動(snippet展開対策済み)
" nnoremap j gj
" onoremap j gj
" xnoremap j gj
" nnoremap k gk
" onoremap k gk
" xnoremap k gk
 
" Ctrl + h or lでタブ移動
nnoremap <C-h> gT
nnoremap <C-l> gt
" ノーマルモードではセミコロンをコロンに
nnoremap ; :
" insert mode での移動
imap <C-e> <END>
imap <C-a> <HOME>
" imap <C-j> <Down>
" imap <C-k> <Up>
" imap <C-h> <Left>
" imap <C-l> <Right>
" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,],h,l
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" スニペットファイルを編集する
nnoremap <Space>nes :NeoComplCacheEditSnippets
"-------------------------------------------
" 入力補完
"-------------------------------------------
" inoremap {} {}<LEFT>
" inoremap [] []<LEFT>
" inoremap () ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" inoremap <> <><LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" tagジャンプ
nnoremap <F8> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

"--------------------
" php syntax
"--------------------
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l



"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
" 常にステータスラインを表示
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト
let g:Powerline_symbols = 'fancy'
let g:lightline = {
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'separator': { 'left': '⮀', 'right': '⮂' },
			\ 'subseparator': { 'left': '⮁', 'right': '⮃' },
			\ 'component_function': {
			\   'modified': 'MyModified',
			\   'readonly': 'MyReadonly',
			\   'fugitive': 'MyFugitive',
			\   'filename': 'MyFilename',
			\   'fileformat': 'MyFileformat',
			\   'filetype': 'MyFiletype',
			\   'fileencoding': 'MyFileencoding',
			\   'mode': 'MyMode'
			\ }
			\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:p') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			let _ = fugitive#head()
			return strlen(_) ? '⭠ '._ : ''
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
	autocmd!
	autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
	autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END

" 自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

function! GetB()
	let c = matchstr(getline('.'), '.', col('.') - 1)
	let c = iconv(c, &enc, &fenc)
	return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
	let n = a:nr
	let r = ""
	while n
		let r = '0123456789ABCDEF'[n % 16] . r
		let n = n / 16
	endwhile
	return r
endfunc
" The function String2Hex() converts each
" character in a string to a two
" character Hex string.
func! String2Hex(str)
	let out = ''
	let ix = 0
	while ix < strlen(a:str)
		let out = out . Nr2Hex(char2nr(a:str[ix]))
		let ix = ix + 1
	endwhile
	return out
endfunc

"----------------------
" NERDTree
"----------------------
nmap <F9> :NERDTreeToggle<CR>

"クリップボードの同期
set clipboard+=unnamedplus

" ctrl+cでクリップボードに
vmap <C-c> :w !xsel -ib<CR><CR>

"----------------------
" vim-session
"----------------------
" 現在のディレクトリ直下の .vimsessions/ を取得 
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" 存在すれば
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory
