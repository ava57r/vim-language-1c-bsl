# Поддержка языка 1С:Предприятие 8 (BSL) в VIM

Добавляет подсветку встроенного языка 1С:Предпрятие 8 файлам \*.bsl и \*.os - синтаксис `1C (BSL)`.  
Разработка основана на данных репозитария [xDrivenDevelopment/1c-syntax](https://github.com/xDrivenDevelopment/1c-syntax).

# Установка
Установим менеджер пакетов Vundle для vim
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
Настроим файл `~/.vimrc`
```vim
set nocompatible              " be iMproved, required
filetype off                  " required
 
"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2

"--------------=== 1С(BSL)===---------------
Plugin 'andreevlex/vim-language-1c-bsl' "
 
call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on
```
Запускаем `vim` и набираем команду `:PluginInstall`

После успешной установки добавим в файл `~/.vimrc` настройку для поддержки шаблонов 
```vim
" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim//bundle/vim-language-1c-bsl/snippets"
```



