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
# ctrl+/ 在行首添加#并回到执行命令时光标所处的位置
# 升级版 ctrl+/ 第一个非空字符出添加注释符号和一个空格，且在vim脚本中使用#，js脚本中使用//
# 命令一键替换行首注释为指定字符 如#替换为", "替换为#
# 自动补全单双引号、小中大括号、反引号
# 自定语法高亮
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

# 重启并使此脚本生效
command! RestartMyPlug unlet! g:myPlug | so ~/vimfiles/plugin/myPlugin.vim | echo "插件已重启"

# 重启vimrc文件
command! RestartMyVimRc so $MYVIMRC | echo "vimrc已重启"

#
command! Replace1 %s/^"/#/g | echo "替换完成"
command! Replace2 %s/^#/"/g | echo "替换完成"
command! EditMyPlugin edit ~\vimfiles\plugin\myPlugin.vim | echo "编辑我的插件脚本"
command! EditMyColor edit ~\vimfiles\colors\darcula.vim | echo "编辑我的主题"
command! EditMyVimRc edit $MYVIMRC | echo "编辑vimrc"

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


