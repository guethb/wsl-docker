export PATH=$PATH:~/bin
alias dr=/usr/bin/docker
function wp { echo $1 | sed -e 's#^\([a-zA-Z]\)#/mnt/\l&#' | sed -e 's#:##' | sed -e 's#\\#/#g' | sed -e 's#\(\s\)#\\\1#g'; }
alias drclean='dr stop $(dr ps -q); dr rm $(dr ps -aq)'
function drc { /usr/bin/docker exec -it $1 /bin/bash; }
function drtar { zcat $1 | /usr/bin/docker run --mount source=$2,target=/mnt -i -w /mnt -a stdin ubuntu:focal /bin/bash -c 'tar xpf -'; }
(wsl.exe -u root service docker status || wsl.exe -u root service docker start) 2>&1 > /dev/null
