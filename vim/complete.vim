scriptencoding utf-8

"### 補完
" set wildmenu               " コマンド補完を強化
" set wildchar=<tab>         " コマンド補完を開始するキー
" set wildmode=list:full     " リスト表示，最長マッチ
" set complete+=k            " 補完に辞書ファイル追加

"### neocomplcache
" 補完ウィンドウの設定
" set completeopt=menuone
" 起動時に有効化
"  let g:neocomplcache_enable_at_startup=1
"  " 大文字が入力されるまで大文字小文字の区別を無視する
"  let g:neocomplcache_enable_smart_case=1
"  " _(アンダースコア)区切りの補完を有効化
"  let g:neocomplcache_enable_underbar_completion=1
"  let g:neocomplcache_enable_camel_case_completion=1
"  " ポップアップメニューで表示される候補の数
"  let g:neocomplcache_max_list=20
"  " シンタックスをキャッシュするときの最小文字長
"  let g:neocomplcache_min_syntax_length=3
"  " ディクショナリ定義
"  let g:neocomplcache_dictionary_filetype_lists = {
"        \'default' : '',
"        \'php' : $HOME . '/.vim/dict/php.dict',
"      \}
"  if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns={}
"  endif
"  let g:neocomplcache_keyword_patterns['default']='\h\w*'
"  " スニペットを展開する。スニペットが関係しないところでは行末まで削除
"  imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"  smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"  " 前回行われた補完をキャンセルします
"  inoremap <expr><C-g> neocomplcache#undo_completion()
"  " 補完候補のなかから、共通する部分を補完します
"  inoremap <expr><C-l> neocomplcache#complete_common_string()
"  " 改行で補完ウィンドウを閉じる
"  inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
"  "tabで補完候補の選択を行う
" inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"  " 現在選択している候補を確定します
" inoremap <expr><C-y> neocomplcache#close_popup()
"  " 現在選択している候補をキャンセルし、ポップアップを閉じます
" inoremap <expr><C-e> neocomplcache#cancel_popup()
"  " <C-h>や<BS>を押したときに確実にポップアップを削除します
"  inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
