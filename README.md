To install:

```bash
apt-get install zsh # installl zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
for i in $( ls -a |grep -v "git"  |grep "[a-z].*" ); do nn=$(echo $i | sed s/^/./g); cp -fR $i ~/$nn; done; # copy shell config files to /home

```
