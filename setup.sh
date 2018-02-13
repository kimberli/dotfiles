dir=$(pwd)
oldfiles=$(pwd)/old
files=".zshrc .vimrc .gitconfig .tmux.conf .gitignore_global"

mkdir -p $oldfiles

echo "moving old files to $oldfiles"

for file in $files; do
    echo "setting up $file"
    mv ~/$file $oldfiles/ 2>/dev/null
    ln -s $dir/$file ~/$file
done

# setup nvim
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
