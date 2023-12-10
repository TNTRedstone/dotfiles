# dotfiles
A project that lets you copy all my important dotfiles

# use
First, you need to clone the repo from your home folder:
```
cd ~
git clone https://github.com/TNTRedstone/dotfiles
```
Next, you need to rename it:
```
mv dotfiles .config-copyable
```
this is because in the installation script it references this name
Finally you need to run the script:
```
chmod +x copy-files-out-of-here.sh 
./copy-files-out-of-here.sh
```
Now, you will definitely not have some packages installed, I currently am too lazy to tell you what to install but running Christitustech's mybash installation script will get you pretty far, with that know if you are on fedora zoxide is on a copr repo
