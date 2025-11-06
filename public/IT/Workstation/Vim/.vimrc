" ============================================================================
"                           Настройки редактора
" ============================================================================
set nopaste                 " Режим без принудительной вставки отступов
set modifiable
set noautowrite             " Не автосохранять                             
set ignorecase              " Игнорировать регистр букв при поиске
set nobackup                " Без автоматического создания файлов отмены
set noswapfile              " Не создаём swp-файлы
set fileformat=unix         " Формат файла (влияет на окончание строк) 
set fencs=utf8,cp1251       " Автоопределение кодировки
set backspace=indent,eol,start


" ============================================================================
"                     Настройки внешнего вида  редактора
" ============================================================================
set number                  " Нумерация строк
set textwidth=80            " Ширина текста - 80 симполов
set colorcolumn=80          " Подсветка того,что вылезает за 80 символов
" ============================================================================
"                   Редактирование и навигация по коду
" ============================================================================
set autoindent              " Автоматический отступ
set smartindent             " мные отступы (например, автоотступ после {)
set tabstop=4               " Пробелами 
set shiftwidth=4            " По 4 штуки
set expandtab               " Заменять табы на пробелы и обратно                    
set showmatch               " Показывать первую парную скобку после ввода второй
set mps+=<:> " показывать совпадающие скобки для HTML-тегов
set foldmethod=manual

syntax on                   " Подсветка синтаксиса

" ============================================================================
"                                  Меню Alt+F9 
"   * Кодировка файла
"   * Вкл/Откл проверки орфографии
"   * Вкл/Откл автодополнения ввода
" ============================================================================
nmap <F12> :emenu <tab>
imap <F12> <Esc>:emenu <tab>

set spell spelllang=ru,en   " Языки проверки орфографии
set nospell                 " По умолчанию - без проверки орфографии
set wildmenu
set wcm=<Tab>

menu Encoding.CP1251   :e ++enc=cp1251<cr>
menu Encoding.CP866    :e ++enc=cp866<cr>
menu Encoding.UTF-8    :e ++enc=utf-8<cr>
menu Encoding.KOI8-U   :e ++enc=koi8-u<cr>
menu Spell.Off         :set nospell<cr>
menu Spell.On          :spell spelllang=ru,en<cr>
menu Autocomplete.Off  :NeoComplCacheDisable<cr>
menu Autocomplete.On   :NeoComplCacheEnable<cr>


" ============================================================================
"                                  Файл 
"   F2 - сохранить
"   Ctrl+F9 - дерево файлов
"   Ctrl+F10 - выйти
"   Ctrl+x - выйти
"   Ctrl+z - отмена
"   Ctrl+y - отмена отмены
" ============================================================================
" Сохранить
nmap <F2> :w<cr>                        
imap <F2> <Esc>:w<cr>i


map <C-z> u
imap <C-z> <Esc>u

map <C-y> <C-r>
imap <C-y> <Esc><C-r>

map <A-F10> :q<cr>
imap <A-F10> <Esc>:q<cr>

nmap <A-F9> :NERDTree<cr>
imap <A-F9> <Esc>:NERDTree<cr>i

nmap <C-c> y
nmap <C-x> c

"" ============================================================================
"                                 Сборка
"    F8 - make
" ============================================================================
map <F8> :make<cr>
imap <F8> <Esc>:make<cr>

"" ============================================================================
"                                 Git
" ============================================================================
map <F7> :GitGutterLineHighlightsEnable<cr>:GitGutterToggle<cr>
imap <F7> <Esc>:GitGutterLineHighlightsEnable<cr>:GitGutterToggle<cr>


" ============================================================================
"                                  Поиск и замена 
"   * F3 - Поиск по файлам
"   * F4 - Замена в файле
"   * Ctrl + F - поиск в открытом буфере
" ============================================================================
" Поиск по файлам
imap <F3> <Esc>:Rgrep<cr>
nmap <F3> :Rgrep<cr>

" Замена в открытом буфере
imap <F4> <Esc>:%s///<left><left>
nmap <F4> :%s///<left><left>

" Поиск в открытом буфере
imap <C-f> <Esc>/
nmap <C-f> <Esc>/

" ============================================================================
"                                  Окна 
"   * Ctrl + rigth - окно вправо
"   * Ctrl + left - окно влево 
"   * Ctrl + up - окно вверх 
"   * Ctrl + down - окно вниз 
" ============================================================================
" Перемещение по окнам
map <C-right> <C-w>l    
map <C-left> <C-w>h
map <C-up> <C-w>k
map <C-down> <C-w>j

imap <C-right> <C-w>l
imap <C-left> <C-w>h
imap <C-up> <C-w>k
imap <C-down> <C-w>j

" Увеличить текущее окно
imap <C-U> :vertical resize +10<cr>
map <C-U> :vertical resize +10<cr>

" ============================================================================
"                                   Табы
"   * Alt + right - следующий таб
"   * Alt + left - следующий таб
" ============================================================================
map <A-right> :tabn<cr>
map <A-left> :tabp<cr>
imap <A-right> <Esc>:tabn<cr>i
imap <A-left> <Esc>:tabp<cr>i

map <C-Tab> :tabnext<CR>
nmap <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>i
" =============================================================================
" Дерево файлов
" =============================================================================
let NERDTreeShowHidden=1
let g:Tlist_WinWidth=120 
" let g:neocomplcache_enable_at_startup = 1


" =============================================================================
"                              gitGutter
" =============================================================================
menu GitGutter.Update  :GitGutter<cr>
menu GitGutter.UpdateAll  :GitGutterAll<cr>
menu GitGutter.Disable  :GitGutterDisable<cr>
menu GitGutter.Enable   :GitGutterEnable<cr>
menu GitGutter.Disable  :GitGutterDisable<cr>
menu GitGutter.Enable   :GitGutterEnable<cr>

" =============================================================================
"                                 PHP
" =============================================================================

" =============================================================================
"                                 Свёртки блоков кода
" =============================================================================
map <Enter> za 

menu Fold.Indent   :set foldmethod=indent<cr>
menu Fold.Manual   :set foldmethod=manual<cr>

" cd /home/r-asian/pack/Projects/altarix/marketplace/app
" cd /home/r-asian/pack/Projects/altarix/service-shoplnp.ag.mos.ru/app

autocmd VimEnter * NERDTree
autocmd VimEnter * NeoComplCacheEnable
autocmd VimEnter * winc l 
autocmd VimEnter * vertical resize -20
