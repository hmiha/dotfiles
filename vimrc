" ** 参考 ** 
" http://lambdalisue.hatenablog.com/entry/2013/06/23/071344

augroup MyAutoCmd
    autocmd!
augroup END


" ** 検索関連 ** 
set hlsearch            " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set ignorecase          " 検索時に大文字・小文字を区別しない。
set smartcase           " ただし、検索後に大文字小文字が混在しているときは区別する
set incsearch           " インクリメンタルサーチ
nnoremap <C-L> :nohl<CR><C-L>
" <C-L>で検索後の強調表示を解除する
 
" ** 編集関係 **
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを保存しなくても他のバッファを表示できるようにする
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応するカッコをハイライト表示
set matchtime=3         " ハイライト表示を3秒
set autoindent          " オートインデント
set nowritebackup       " swapとかbackupとかのゴミを産まない(?)
set nobackup
set noswapfile
set wildmenu            " コマンドライン補完を便利に
set showcmd             " タイプ途中のコマンドを画面最下行に表示
set nostartofline       " 移動コマンドを使ったとき、行頭に移動しない
set mouse=a             " マウス有効化
set confirm
set backspace=indent,eol,start
nnoremap ~ $

" Yank時のクリップボードをデフォルトレジスタとして使用
if has('unnameplus')
    set clipboard& clipboard+=unnamedplus,unnamed
else
    set clipboard& clipboard+=unnamed
endif



" ** 表示関係 **
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set t_vb=
set novisualbell        " スクリーンベルを無効化
set ruler               " 画面最下行にルーラーを表示する
set laststatus=2        " ステータスラインを常に表示する
set cmdheight=2         " コマンドラインの高さを2行に
set modelines=0         " CVE-2007-2438
set nocompatible        " vi互換をoff 
set backspace=2         " more powerful backspacing
syntax on               " 色づけをオン
filetype indent plugin on " ファイル名と内容によってファイルタイプを判別し，ファイルタイププラグインを有効にする
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:☜ " 不可視文字


" ** 大事な大事なTab関連 **
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab 

" 拡張子でタブ幅を変更する
if expand("%:t") =~ ".*\.html"
    set expandtab
    set softtabstop=2
    set shiftwidth=2
endif

" ** エンコード **
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8 

" ** NeoBundle導入スクリプト **
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'


filetype plugin indent on     " required!
filetype indent on
syntax on

" ** NERDTree 設定 **
let g:NERDTreeShowBookmarks = 1 " ブックマークを最初に表示

if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif  " 起動と同時にNERDTreeも起動

nmap <silent> <C-e> :NERDTreeToggle<CR>
" ctrl+eでNERDTreeをトグル起動

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ** カラースキーマ ** 
"colorscheme solarized
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark


" ** スペルチェッカ **
"set spelllang=en,cjk
"
"fun! s:SpellConf()
"    redir! => syntax
"    silent syntax
"    redir END
"
"    set spell
"
"    if syntax =~? '/<comment\>'
"        syntax spell default
"        syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
"    else
"        syntax spell toplevel
"        syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
"    endif
"
"    syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
"endfunc
"
"augroup spell_check
"    autocmd!
"    autocmd BufReadPost,BufNewFile,Syntax * call s:SpellConf()
"augroup END
