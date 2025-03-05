vim9script noclear

if exists("g:myPlug")
    finish
endif

g:myPlug = 1

# 启用256色
set termguicolors 
# 禁用undo文件
set noundofile
# 禁用备份文件
set nobackup
# 禁用错误响铃、可视响铃、终端可视响铃
# set noeb novb t_vb=
set vb t_vb=
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
# ctrl+/ 在行首添加#并回到执行命令时光标所处的位置
# 升级版 ctrl+/ 第一个非空字符出添加注释符号和一个空格，且在vim脚本中使用#，js脚本中使用//
# 命令一键替换行首注释为指定字符 如#替换为", "替换为#
# 自动补全单双引号、小中大括号、反引号
# 自定语法高亮
# 复制多行内容时,其格式总是不理想,需要用自动命令改进
# feedkeys
#
# i 光标前插入
# a 光标后插入
# o 光标移到行尾然后回车
# O 光标上移到行尾然后回车
# 0 光标移至行首
# $ 光标移至行尾
#
# :marks 查看标记
# m{a-zA-Z} 进行标记
# `{a-z} 反引号 到当前文件中的标记处
# `{A-Z} 反引号 到任意文件中的标记处
# `` 反引号 到前次跳转之前的位置
# :ju 查看可跳转表
#
# 复制文本到剪贴板
# 进入可视模式后移动光标选中需要复制的文本，然后直接输入"+y，不需要退出可视模式
# "+p 从剪贴板粘贴到光标处 
# "*yy 复制一行到剪贴板中
# "+p 粘贴回去
#
# 替换
# :{作用范围}s/{目标}/{替换}/{替换标志}  %作用范围整个文件 g全局替换
# :%s/foo/bar/g
#
#
#

#
# 我的函数
#


# 定义 InsertCharPre 事件处理函数
def TriggerPopupMenu()
    # 获取当前光标前的字符
    var char: string = getline('.')[col('.') - 2]

    # 如果输入的是 '.' 或触发补全的字符
    if char == '.' || char == '>'
        # 延迟 100 毫秒后触发补全菜单
        timer_start(100, (_) => execute('call ShowPopupMenu()'))
    endif
enddef

# 定义显示 popupmenu 的函数
def ShowPopupMenu()
    # 动态生成补全选项
    var items: list<string> = ['apple', 'banana', 'cherry']

    # 创建 popupmenu
    var popup_id = popup_create(items, {
        pos: 'botleft',
        line: 'cursor+1',
        col: 'cursor',
        mapping: false,
        callback: 'SelectMenuItem',
    })
enddef

# 定义 popupmenu 回调函数
def SelectMenuItem(id: number, result: number)
    if result > 0
        # 获取选中的补全项
        var selected_item: string = get(g:popup_items, result - 1)

        # 插入选中的补全项
        feedkeys(selected_item, 'n')
    endif
enddef


# 
# 自定义命令
#

# 重启并使此脚本生效
# 重启vimrc文件
command! RestartMyVimRc so $MYVIMRC | echo "vimrc已重启"

#
command! Replace1 %s/^"/#/g | echo "替换完成"
command! Replace2 %s/^#/"/g | echo "替换完成"
command! EditMyPlugin edit ~\vimfiles\plugin\myPlugin.vim | echo "编辑我的插件脚本"
command! EditMyColor edit ~\vimfiles\colors\darcula.vim | echo "编辑我的主题"
command! EditMyVimRc edit $MYVIMRC | echo "编辑vimrc"


#
# 自定义快捷键
#

# CTRL-s 插入模式保存文件
if !empty(maparg('<C-s>', 'i'))
    iunmap <C-s>
endif
imap <C-s> <Esc>:w<CR>

# CTRL+z 撤销
if !empty(maparg('<C-z>', 'i'))
    iunmap <C-z>
endif
imap <C-z> <Esc>ui

# CTRL+v 粘贴
if !empty(maparg('<C-v>', 'i'))
    iunmap <C-v>
endif
imap <C-v> <Esc>"+pa

# iunmap <A-a>
# CTRL+/ 注释
if !empty(maparg('<C-/>', 'i'))
    iunmap <C-/>
endif
imap <C-/> <Esc>mz0i#<Esc>`zla


# ALT+下/上 整行移动
if !empty(maparg('<A-Down', 'i'))
    iunmap <A-Down>
endif
imap <A-Down> <Esc>:m .+1<cr>a

if !empty(maparg('<A-Up>', 'i'))
    iunmap <A-Up>
endif
imap <A-Up> <Esc>:m .-2<cr>a

# 整行复制
if !empty(maparg('<S-A-Up>', 'i'))
    iunmap <S-A-Up>
endif
imap <S-A-Up> <Esc>:hello
if !empty(maparg('<S-A-Down', 'i'))
    iunmap <S-A-Down>
endif
imap <S-A-Down> <Esc>mz"+yy"+p`zja

#
# 自动命令
#
# TextChanged   文本内容发生变化时触发
# TextChanged 普通模式中对文本进行改变后
# TextChangedI 弹出菜单不可见时，插入模式中对文本进行改变后
# TextChangedP 弹出菜单可见时，插入模式中对文本进行改变后
# TextYankPost 文本抽出或删除后
#
# InsertEnter 开始插入模式前
# InsertChange 在插入或替换模式下输入 <Insert> 时
# InsertLeave 离开插入模式时
# InsertLeavePre 离开插入模式前
# InsertCharPre 插入模式输入每个字符前
augroup MyAutocmd
    autocmd!
    # 每当进入一个缓冲区时，自动将 Vim 的工作目录切换到该文件所在的目录
    # lcd 局部改变当前窗口的工作目录
    # % 当前缓冲区的文件名
    # :p 将文件名转换为完整路径
    # :h 获取路径的目录部分（去掉文件名）
    autocmd BufEnter * lcd %:p:h

#    autocmd InsertCharPre * call TriggerPopupMenu()
augroup END

# N CTRL-D 窗口下滚N行(默认1/2窗口)(Downwards)
# N CTRL-U (Upwards)
# N zH 右滚半屏
# N zL 左
# zt 当前行置顶
# zz 置中
# zb 置底
#
# CTRL ww 窗口间切换
# CTRL wq 关闭此窗口
# :split {file} 在当前窗口的下方创建新窗口
# :vsplit {file} 在当前窗口的右侧创建新窗口
#
# dd 删除当前行
# N u 撤销最近的N次改动
# U 恢复最近被改动的行
#
# "*yy 要拷贝一行到剪贴板中
# "*p 从剪贴板粘贴到光标处
# ddkp 命令模式下删除某行(dd)然后移(hjkl)动至指定位置粘贴(p)
#
# :reg 查看寄存器
# :buffers 查看缓冲区
# :highlight 查看高亮组
#
# :pwd 查看当前工作目录
#
# :!{command} vim内执行shell命令 :!dir
#
#
# 遍历 RGB 颜色立方并显示颜色
# set termguicolors 
# colorscheme darcula
def ShowCtermColor()
for r in range(0, 5)
    for g in range(0, 5)
        for b in range(0, 5)
            let color_num = 16 + (36 * r) + (6 * g) + b
            execute 'highlight Color_' .. color_num .. ' ctermfg=' .. color_num
            execute 'echohl Color_' .. color_num
            echomsg printf("Color %3d: R=%d, G=%d, B=%d", color_num, r, g, b)
            echohl None
        endfor
    endfor
endfor
enddef

#
# 高亮组设置
#
# highlight group settings
# verbose hi comment 查看最后一次设置是在何处
# highlight comment guifg=#2b2b2b
highlight normal guifg=#A9b7C6 guibg=#2B2B2B
highlight comment guifg=#808080 guibg=NONE
highlight keyword guifg=#CC7832 guibg=NONE
hi constant guifg=#A8C023 guibg=NONE
hi identifier guifg=#FFC66D guibg=NONE
hi statement guifg=#CC7832 guibg=NONE
hi preProc guifg=#CC7832
hi type guifg=#A9B7C6
highlight Special guifg=#FFC66D guibg=NONE
highlight String guifg=#6A8759 guibg=NONE
highlight Number guifg=#6897BB guibg=NONE
highlight Function guifg=#FFC66D guibg=NONE
highlight Operator guifg=#A9B7C6 guibg=NONE

highlight CursorLine guibg=#323232
hi lineNr guifg=#808080 guibg=#2B2B2B # 行号
highlight CursorLineNr guifg=#A9B7C6 guibg=#323232
highlight Visual guibg=#4B4B4B

highlight StatusLine guifg=#A9B7C6 guibg=#4B4B4B
highlight StatusLineNC guifg=#808080 guibg=#2B2B2B

# 设置 popupmenu 的背景色和前景色
highlight Pmenu guibg=#2B2B2B guifg=#A9B7C6

# 设置选中项的背景色和前景色
highlight PmenuSel   ctermbg=238 guibg=#4B4B4B ctermfg=255 guifg=#FFFFFF

# 设置滚动条的背景色
highlight PmenuSbar guibg=#323232

# 设置滚动条滑块的颜色
highlight PmenuThumb guibg=#808080


