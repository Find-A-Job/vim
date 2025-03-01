vim9script noclear

if exists("g:myPlug")
    finish
endif

g:myPlug = 1

# 禁用undo文件
set noundofile
# 禁用备份文件
set nobackup
# 禁用错误响铃、可视响铃、终端可视响铃
set noeb novb t_vb=
# 显示行号
set nu
# 缩进宽度4空格
set shiftwidth=4 
# 按下tab键时插入4个空格
set softtabstop=4 
# 将tab转换为空格
set expandtab

# highlight Normal ctermbg=0
#
# 保存到github中便于随时复制粘贴
# 查看脚本编写规范
# 查看<xxx>对应的含义
# ftdetect 下放入脚本用来实现插入模式下按CTRL-s后保存并回到插入模式 
# 复制
# 修改vim换行后自动tab的设置，改为4个空格
# ctrl+/ 注释行 在vim脚本中使用#，js脚本中使用//
# 自动补全单双引号、小中大括号、反引号
# 自定语法高亮
#
# i 光标前插入
# a 光标后插入
# o 光标移到行尾然后回车
# O 光标上移到行尾然后回车
#
# 复制文本到剪贴板
# 进入可视模式后移动光标选中需要复制的文本，然后直接输入"+y，不需要退出可视模式
# "+p 从剪贴板粘贴到光标处 
# "*yy 复制一行到剪贴板中
# "+p 粘贴回去

# 重启并使此脚本生效
command! RestartMyPlug unlet! g:myPlug | so ~/vimfiles/plugin/myPlugin.vim | echo "插件已重启"

# 重启vimrc文件
command! RestartMyVimRc so $MYVIMRC | echo "vimrc已重启"

# CTRL-s 插入模式保存文件
if !empty(maparg('C-s', 'i'))
    iunmap <C-s>
endif
imap <C-s> <Esc>:w<CR>a

# iunmap <A-a>

# ALT+下/上 整行移动
if !empty(maparg('<A-Down', 'i'))
    iunmap <A-Down>
endif
imap <A-Down> <Esc>:m .+1<cr>a

if !empty(maparg('<A-Up>', 'i'))
    iunmap <A-Up>
endif
imap <A-Up> <Esc>:m .-2<cr>a









