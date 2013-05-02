" :NeoBundleInstall インストール
" :NeoBundleInstall! アップデート
" :NeoBundleClean 不要プラグインの削除
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.bundle'))
endif

" Plugins
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'tpope/vim-fugitive'
" Uniteコマンドでアウトラインを表示
NeoBundle 'h1mesuke/unite-outline'
" :JSHintコマンドによるJS文法チェック
NeoBundle 'walm/jshint.vim'
" ,,でトグルでコメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" Scalaのハイライト
NeoBundle 'derekwyatt/vim-scala'
" zendogingプラグイン
" NeoBundle 'mattn/zencoding-vim'
" <Leader>rで:QuickRunという言語ごとの実行コマンド
NeoBundle 'thinca/vim-quickrun'
" URLエンコード、デコードするためのプラグイン
NeoBundle 'koron/chalice'
" SQL の整形のために必要なプラグイン
NeoBundle 'Align'
" 選択後 :SQLUFormatter でSQL整形
NeoBundle 'vim-scripts/SQLUtilities'
" PHP5.4にも対応している新しいPHPのシンタックスハイライト
NeoBundle 'shawncplus/php.vim'
" :CodeSniffでPHP_CodeSnifferを実行するプラグイン
" NeoBundle 'bpearson/vim-phpcs'
" JavaScriptのシンタクスハイライト
NeoBundle 'JavaScript-syntax'
" JavaScriptのインデント
NeoBundle 'pangloss/vim-javascript'
" jQuery
NeoBundle 'jQuery'
" nginx conf
NeoBundle 'nginx.vim'
" プロジェクト
NeoBundle 'scrooloose/nerdtree'
" 括弧囲みの編集操作
NeoBundle 'surround.vim'
" :DirDiff <A:Src Directory> <B:Src Directory> でディレクトリ比較
NeoBundle 'DirDiff.vim'
" :make時のエラーマーカーを表示
" NeoBundle 'errormarker.vim'
" ステータスラインに顔文字を表示
NeoBundle 'mattn/hahhah-vim'
" ステータスラインをカッコよくする
NeoBundle 'Lokaltog/vim-powerline'
" utillity
NeoBundle 'L9'
" smooth_scroll.vim : スクロールを賢く
NeoBundle 'Smooth-Scroll'
NeoBundle 'SudoEdit.vim'
" Qfix howm メモツール
NeoBundle 'fuenor/qfixhowm'

filetype plugin on
filetype indent on

" C-n補完の対象(カレントバッファ、タグ、辞書) :help 'complete'
" neocomplcacheには影響しない？
" neocomplcacheには影響しないそうなのでコメントアウト
" set complete=.,w,b,u,k,t
" 補完ウィンドウの設定 :help completeopt
set completeopt=menuone
 
" 起動時に有効
let g:neocomplcache_enable_at_startup = 1
" ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20
" 自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 2
" 手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
" バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
" シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 3
" 1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
" 入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
" ポップアップメニューが出ているときに-を入力すると英数字で候補選択する。
" 削除されていたようなのでコメントアウト
" let g:neocomplcache_enable_quick_match = 0
" ;で英数字候補選択できるようにしたかったけど動かない
" 動かないのは仕様のようです。コメントアウト
" let g:neocomplcache_quick_match_patterns = {
"  \ 'default' : ';'
"  \ }
" 大文字小文字を区切りとしたあいまい検索を行うかどうか。
" DTと入力するとD*T*と解釈され、DateTime等にマッチする。
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバーを区切りとしたあいまい検索を行うかどうか。
" m_sと入力するとm*_sと解釈され、mb_substr等にマッチする。
let g:neocomplcache_enable_underbar_completion = 1
 
" neocomplcacheを自動的にロックするバッファ名のパターンを指定。
" ku.vimやfuzzyfinderなど、neocomplcacheと相性が悪いプラグインを使用する場合に設定。
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
" let php_folding = 1
 
" キャッシュディレクトリの場所
" RamDiskをキャッシュディレクトリに設定
if has('win32')
  let g:neocomplcache_temporary_dir = 'E:/.neocon'
elseif has('macunix')
  let g:neocomplcache_temporary_dir = '/Volumes/RamDisk/.neocon'
else
  let g:neocomplcache_temporary_dir = '/tmp/.neocon'
endif
 
" シンタックス補完を無効に
" let g:neocomplcache_plugin_disable = {
" \ 'syntax_complete' : 1, 
" \ }
 
" 補完するためのキーワードパターンを指定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
" 日本語を補完候補として取得しないようにする
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" twigはhtmlと同じに
let g:neocomplcache_keyword_patterns['twig'] = '</\?\%([[:alnum:]_:-]\+\s*\)\?\%(/\?>\)\?\|&\h\%(\w*;\)\?\|\h[[:alnum:]_-]*="\%([^"]*"\?\)\?\|\h[[:alnum:]_:-]*'
 
" 関数を補完するための区切り文字パターン
if !exists('g:neocomplcache_delimiter_patterns')
  let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']
 
" カーソルより後のキーワードパターンを認識。
" h|geとなっている状態(|はカーソル)で、hogeを補完したときに後ろのキーワードを認識してho|geと補完する機能。
" 修正するときにかなり便利。
" g:neocomplcache_next_keyword_patternsは分からないときはいじらないほうが良いです。
if !exists('g:neocomplcache_next_keyword_patterns')
  let g:neocomplcache_next_keyword_patterns = {}
endif
" よく分からない場合は未設定のほうがよいとのことなので、ひとまずコメントアウト
" let g:neocomplcache_next_keyword_patterns['php'] = '\h\w*>'
" twigはhtmlと同じに
let g:neocomplcache_next_keyword_patterns['twig'] = '[[:alnum:]_:-]*>\|[^"]*"'
 
 
" ファイルタイプの関連付け
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif
" let g:neocomplcache_same_filetype_lists['ctp'] = 'php'
" let g:neocomplcache_same_filetype_lists['twig'] = 'html'
 
 
" ディクショナリ補完
" ファイルタイプごとの辞書ファイルの場所
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'php' : $HOME . '/.vim/dict/php.dict',
  \ 'ctp' : $HOME . '/.vim/dict/php.dict',
  \ 'twig' : $HOME . '/.vim/dict/twig.dict',
  \ 'vimshell' : $HOME . '/.vimshell/command-history',
  \ }
 
" タグ補完
" タグファイルの場所
augroup SetTagsFile
  autocmd!
  autocmd FileType php set tags=$HOME/.vim/tags/php.tags
augroup END
" タグ補完の呼び出しパターン
if !exists('g:neocomplcache_member_prefix_patterns')
  let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'
 
" スニペット補完
" 標準で用意されているスニペットを無効にする。初期化前に設定する
let g:neocomplcache_snippets_disable_runtime_snippets = 1
" スニペットファイルの置き場所
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
 
" zencoding連携
let g:use_zen_complete_tag = 1
 
" オムニ補完
augroup SetOmniCompletionSetting
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ctp setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType twig setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup END
 
"オムニ補完のパターンを設定
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns['twig']= '<[^>]*'
"let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'
 
" Ctrl +  o でタグアウトラインを表示
nnoremap <C-o> :<C-u>Unite outline<CR>

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
set ttymouse=xterm2
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
nmap n nzz
nmap N Nzz
" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1


" keymap
 
" 表示行単位で移動(snippet展開対策済み)
" nnoremap j gj
" onoremap j gj
" xnoremap j gj
" nnoremap k gk
" onoremap k gk
" xnoremap k gk
 
" Ctrl + n or pでタブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT
" ノーマルモードではセミコロンをコロンに
nnoremap ; :
" insert mode での移動
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>
" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,],h,l
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() ? "" :  "\<CR>"
" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" C-h, BSで補完ウィンドウを確実に閉じる
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
" C-yで補完候補の確定
inoremap <expr><C-y> neocomplcache#close_popup()
" C-eで補完のキャンセルし、ウィンドウを閉じる。ポップアップが開いていないときはEndキー
inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
" C-gで補完を元に戻す
inoremap <expr><C-g> neocomplcache#undo_completion()
" vim標準のキーワード補完を置き換える
inoremap <expr><C-n> neocomplcache#manual_keyword_complete()
" 補完候補の共通文字列を補完する(シェル補完のような動作)
" inoremap <expr><C-l> neocomplcache#complete_common_string()
" スニペットを展開する。スニペットが関係しないところでは行末まで削除
" imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
" smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
" オムニ補完の手動呼び出し
inoremap <expr><C-Space> neocomplcache#manual_omni_complete()
 
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

" インクルード補完。よくわからない。初期化のみに留める
" 通常は設定する必要はないらしい。
" Vim標準のインクルード補完を模倣しているそうなので、そちらを勉強する
if !exists('g:neocomplcache_include_paths')
    let g:neocomplcache_include_paths = {}
endif
if !exists('g:neocomplcache_include_patterns')
    let g:neocomplcache_include_patterns = {}
endif
if !exists('g:neocomplcache_ctags_arguments_list')
    let g:neocomplcache_ctags_arguments_list = {}
endif
 
" ctagsの引数
" let g:neocomplcache_ctags_arguments_list = {
" \ 'php' : '-R --languages=PHP --langmap=PHP:.php.inc --php-types=c+f+d'
" \ }

"--------------------
" php syntax
"--------------------
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l


"--------------------
" Color Scheme
"--------------------
syntax enable
set t_Co=256

"--------------------
" solarized
"--------------------
" NeoBundle 'altercation/vim-colors-solarized'
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="low"
" let g:solarized_visibility="low"
" colorschem solarized

"--------------------
" molokai
"--------------------
" NeoBundle 'tomasr/molokai'
" colorscheme molokai

"--------------------
" desert
"--------------------
NeoBundle 'fugalh/desert.vim'
colorscheme desert

"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
" 常にステータスラインを表示
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト
let g:Powerline_symbols = 'fancy'

" ステータスラインに文字コードと改行文字を表示する
if winwidth(0) >= 120
	set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
else
	set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
endif

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
"set clipboard+=autoselect
"set clipboard+=unnamed
if has("clipboard") 
  vmap ,y "+y 
  nmap ,p "+gP 
  " exclude:{pattern} must be last ^= prepend += append 
  if has("gui_running") || has("xterm_clipboard") 
    silent! set clipboard^=unnamedplus 
    set clipboard^=unnamed 
  endif 
endif 
