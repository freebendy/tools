
# Miscellaneous
Check file encoding:
```bash
file -i <FILE>
```

Convert file encoding:
```bash
# list supported encodings: iconv -l
iconv -f <FROM-ENCODING> -t <TO-ENCODING> <INPUT-FILE> -o <OUTPUT-FILE>
```

Run command with a nologin user:
```bash
su -s /bin/sh <user>
```

dbus-send:
```bash
dbus-send --system --print-reply --dest="bosch.pctrl4.companion" --type=method_call "/bosch/pctrl4/companion" bosch.pctrl4.companion.BuildVersion.Read
dbus-send --system --print-reply --dest="bosch.pctrl4.swupdate" --type=method_call "/bosch/pctrl4/swupdate" bosch.pctrl4.swupdate.IsImageActivated byte:1
dbus-monitor --system "sender='bosch.pctrl4.companion',interface='bosch.pctrl4.companion.GroundFault'"
```

Extend the filesystem fit the partition:
```bash
umount /dev/<PARTITION> && e2fsck /dev/<PARTITION> && resize2fs /dev/<PARTITION>
```

ccze: fast log colorizer written in C
```bash
ccze -A < XXXX.log
```

swupdate:
```bash
swupdate -e stable,first -i <IMAGE_NAME>.swu -v 2>&1 | tee swupdate.log
```

Linux查看内存状态
```bash
cat /proc/meminfo
# free memory in MB
free -m
vmstat
```

查看命令属于哪个包：
```bash
dpkg -S /bin/ps
```

enable systemd-networkd后，ssh到login时间很长，修改/etc/ssh/sshd_config中"UseDNS no"

udev:
```bash
udevadm info -e | grep -A 12 ^P.*eth0
udevadm info --attribute-walk /sys/class/net/eth0
udevadm info --attribute-walk /dev/mmcblk1
```

ID_OUI_FROM_DATABASE来源于文件systemd的源代码hwdb/20-OUI.hwdb

predictable network network device name:
- src/udev/udev-builtin-net_id.c （在builtin_net_id中产生新的properties）
- src/udev/net/link-config.c （link_config_apply决定采用那个name policy - 来源于systemd.link unit）

Flash with `dd`:
```bash
dd if=<INPUT_FILE> of=<OUTPUT_FILE> bs=1M status=progress oflag=nocache iflag=nocache
```

Socat create two loop serial port:
```bash
socat -d -d pty,raw,echo=0,link=/home/gub3zhu/ttyBen0 pty,raw,echo=0,link=/home/gub3zhu/ttyBen1
```

Configure wiresharp:
```bash
sudo dpkg-reconfigure wireshark-common
sudo adduser $USER wireshark
```

Ubuntu settings:
```bash
# 配置Ctrl+Alt+T打开到terminal
sudo update-alternatives --config x-terminal-emulator

# 查看所有默认程序
sudo update-alternatives --get-selections

# 在bash使用python3作为默认到python，在.bashrc中加入：alias python=‘python3’

# 查看串口错误
sudo cat /proc/tty/driver/serial
```

`diff` usage:
```bash
diff RandomTest_0.out RandomTest_0.in | grep "<\|>"| wc -l
diff -I "#.*" RandomTest_0.{out,in} | grep "<\|>"| wc -l

# Recommand
diff -I "#.*" --suppress-common-lines --speed-large-files -y  RandomTest_0.{out,in} | wc -l

#sed -e 's/\r/\n/g' RandomTest_0.in > RandomTest_0_u.in
```

Department partition: `//10.54.128.19/zhu_stcn_dept_RND-fire$`

Add local time to ping result:
```bash
ping 192.168.1.22 | perl -nle 'print scalar(localtime), " ", $_'
```

Check kernel:
```bash
dpkg --list | grep linux-image
dpkg --list | grep linux-
dpkg --get-selections | grep linux
```

purge the removed kernels:
```bash
sudo apt purge linux-xxxxxxx
sudo dpkg --pruge linux-xxxxx
```


Replace string in found files:
```bash
grep -nrlI "XXX" . | xargs sed -i 's/<old_string>/<new_string>/g'
```

rsync usage:
```bash
rsync -ahvzPLK /home/benguan/NetDisks/MagicPanel/Yocto/source-mirror/ /home/benguan/Projects/yocto_baseline/source-mirror
# --size-only - 只检查大小，不检查修改时间
```


# Git

Recover all files to the version in the index to working tree:
```bash
git checkout-index -a
```

查看2个commit中一个文件的区别：
```bash
git <commit-id1> <commit-id2> [-- <file_path1> -- <file_path2> ...]
```

删除tag:
```bash
git tag -d XXXX
git push origin :refs/tags/XXXX
# 在push的时候带--follow-tags会把tag也push到remote
```

git比较2个branch:
```bash
# detail
git diff <old_branch>..<new_branch>
# overview
git diff --name-status <old_branch>..<new_branch>
```

log:
```bash
git log <old_branch>..<new_branch>
```
显示commit中的文件：
```bash
git log --stat --color --decorate
```

git删除local和remote的branch
```bash
# local:
git branch -D <branchname>
# remote:
git push origin :<branchname>
git push origin --delete <branchname>
```

让remote删除branch后，使用下面命令清除本地的remote branch
```bash
git branch -rd <reponame>/<branchname>
git fetch -p
# 或者
git remote prune <remote name>
```

显示没有被merge的branch
```bash
git branch --no-merged
```

查看local branch的upstream
```bash
git branch -vv
```

显示commit中的文件列表：
```bash
git log --stat
```

同步master到没push的feature branch：
```bash
git checkout <branchname>
git rebase master
```

Merge a range of commits (X ~ Y) from branch-A to branch-B via `git rebase`
```bash
git checkout branch-B
# get the most recent commit: M
git log -1
# merge the commits
git rebase --onto <commit before X> Y
# Update the HEAD to branch-B
git rebase HEAD branch-B
```


git 比较nothing和最新到代码(整个tree)
```bash
# option 1:
git diff 4b825dc642cb6eb9a060e54bf8d69288fbee4904 HEAD
# 4b825dc642cb6eb9a060e54bf8d69288fbee4904 是 一个 magic number, 通过 git hash-object -t tree /dev/null
# option 2:
# create a orpha branch
git checkout --orphan empty
# Remove all files from index
git read-tree --empty
# initial commit
git commit --allow-empty -m "Empty"
```

清除不存在到远程branch：
```bash
git remote prune origin
```

update the fork branch from the upstream:
```bash
git remote add upstream [upstream url]
git fetch upstream
git checkout master
git merge upstream/master
```

git undo a reset (or last n operation):
```bash
git reset HEAD@{N}
#N的值参考: git reflog
```

git undo a merge:
```bash
git reset --merge ORIG_HEAD
```

commit level:
- git reset - undo changes (avoid to use it if you collaborate with others on the same remote repository，用于丢弃私有branch中的commit)
    * --soft:  the staged snapshot and working directory are not altered in any way
    * --mixed: the staged snapshot is updated to match the specified commit, working directory is not affected. (default)
    * --hard:  the staged snapshot and working directory are both updated to match the specified commit
- git checkout - 用于切换working directory到指定状态
- git revert - undo a commit by creating a new commit, safe way to undo changes because it has no change of re-writing the commit history

file level:
```bash
git reset HEAD~2 foo.py # (把指定版本的foo.py放到staged snapshot里等待下次提交)， 文件级别到reset不支持--soft,--mixed,--hard, 因为staged snapshot 总是被update
```

git 修改commit:
```bash
# 修改最后一个commit:
git commit --amend
# 修改任意一个commit:
git rebase -i HEAD~N (或者commit id)
# 将想要修改的commit从pick改成edit
# 修改相关文件
git commit --amend
git rebase --continue
```

保存没commit的修改，然后做一些会修改history到操作，最后回复没commit的修改
```bash
git stash
# do the change
git stash apply/pop
```

查看staged files的diff(已经调用git add)
```bash
git diff --staged
```


从其他branch选择一些commit merge到当前branch：
```bash
git cherry-pick <commit>...
# commit1 is not included
git cherry-pick <commit1>..<commit2>
# commit1 is included
git cherry-pick <commit1>^..<commit2>
```

push all branches from a remote to a new remote:
```bash
# check out all branch in the source remote:
for remote in `git branch -r | grep -v master `; do git checkout -f --track $remote ;  done

git push --all <DEST REPO URL>
git push --tags <DEST REPO URL>
# clean up
git checkout master
for remote in `git branch | grep -v master `; do git branch -d $remote ;  done
```

update HEAD:
```bash
$ git remote set-head <remote_name> <branch_name>
```


# VIM
VIM:
- 如果只想使用内存不需要swap文件加上-n选项
- 查找或者替换光标所在的word快捷键： *
- 列模式编辑：
  - Ctrl + V to go into column mode
  - Select the columns and rows where you want to enter your text
  - Shift + i to go into insert mode in column mode
  - Type in the text you want to enter. Dont be discouraged by the fact that only the first row is changed.
  - Esc to apply your change (or alternately Ctrl+c)
- 垂直分屏：
  - vim -O file1 file2 ...
- 水平分屏：
  - vim -o file1 file2 ...
- 关闭分屏:
  - Ctrl+W c
- 关闭当前窗口(如果是最后一个窗口退出vim):
  - Ctrl+W q
- 在原窗口打开文件：
  - :open file
- 上下分割当前文件:
  - Ctrl+w, s
- 在上下分割打开文件:
  - :sp file
- 左右分割当前文件:
  - Ctrl+w, v
- 在新的垂直分屏打开文件:
  - :vsp file
- 在分屏窗口中切换:
  - Ctrl+w, 方向键
  - Ctrl+w, h/j/k/l (左/下/上/右)
  - Ctrl+w, w 移动到下一屏
- 移动分屏(注意大小写，将当前窗口移动到另外一个方向)
  - Ctrl+w, L 右移动
  - Ctrl+w, H 左移动
  - Ctrl+w, K 上移动
  - Ctrl+w, J 下移动
- 屏幕尺寸：
  - Ctrl+w, = 所有屏一样高
  - Ctrl+w, + 增加高度
  - Ctrl+w, - 减少高度
- 如果一个窗口打开多个文件：
  - :bn 下一个文件 (Ctrl+6)
  - :bp 上一个文件
  - :ls List all current buffers
  - :files List all current buffers
  - :b <BUF_NO> Switch to buffer
- 多个文件之间复制:
  - 源文件使用v进入visual模式，然后选定要复制内容，执行y复制
  - 在目标文件使用p粘贴
- Execute external commands: :! <command>, e.g. `:! ls -alh`
- Start a shell within vim: `:shell` (exit the shell will return to vim)

# Docker
Docker:
```bash
# install in Ubuntu 16.04
sudo apt install docker.io

# add your user to "docker" group in /etc/group.

# logout and login

# start daemon
sudo systemctl start docker

# create a new untagged image
docker import xxxxx.tar.gz

# run a image
$ docker run -i -t <image_id> /bin/bash
```

Frequently used Commands:
- list containers:                  `docker ps -a`
- list images:                      `docker images -a`
- creat a filesystem image:         `docker import`
- create a new container:           `docker create`
- start a container:                `docker start`
- run a command in a new container: `docker run`

Yocto image:
```bash
docker import /home/gub3zhu/Projects/yocto_pyro/poky/build_x86/tmp/deploy/images/mpc-x86-32/pctrl4-image-dev-mpc-x86-32.tar.gz mpc:test
docker create --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /lib/modules:/lib/modules:ro --device /dev/ttyS0 --net=host --name PCTRL4 mpc:test /sbin/init
docker start PCTRL4
docker exec -it PCTRL4 /bin/sh
```

# tmux
Star a new session:
```bash
tmux
tmux new
tmux new-session
```
Re-attach a detached session
```bash
tmux attach
tmux attach-session
```
Re-attach a attached session (detaching it from elsewhere)
```bash
tmux attach -d
tmux attach-session -d
```
Re-attach a attached session (keep it attached elsewhere)
```bash
tmux attach -d
tmux attach-session -d
```
Detach from current attached session: `Ctrl+b,d`

List sessions: `tmux ls` or `tmux list-sessions`

Split window/panel horizontally: `Ctrl+b, "`

Split window/panel vertically: `Ctrl+b, %`

Exit current window: `Ctrl+d`

Kill the current panel: `Ctrl+b, x`

# systemd

```bash
# Save the systemd sequence to SVG file
systemd-analyze plot > ~/sequence.svg
# Print a tree of the time critical chain of units
systemd-analyze critical-chain --no-pager
# List dependency of units
systemctl list-dependencies --no-pager
# List enabled services
systemctl list-unit-files --type=service --no-pager
```

# Yocto
Show the package dependency for image (GUI):
```bash
bitbake pctrl4-image-test -g -u taskexp
```


# Linux Kernel
```bash
ssh root@192.168.1.33 "mkdir -p /lib/modules/$(cat include/config/kernel.release)/kernel/<path_to_module>"
scp <path_to_module>/<module_name>.ko root@192.168.1.33:/lib/modules/$(cat include/config/kernel.release)/kernel/<path_to_module>
scp modules.builtin root@192.168.1.33:/lib/modules/$(cat include/config/kernel.release)/
scp modules.order root@192.168.1.33:/lib/modules/$(cat include/config/kernel.release)/
reboot
depmod
```
