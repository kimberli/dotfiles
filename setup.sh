dir=$(pwd)
oldfiles=$(pwd)/old
files=".zshrc .vimrc .gitconfig .tmux.conf .gitignore_global"

mkdir -p $oldfiles

echo "moving old files to $oldfiles"

for file in $files; do
    echo "setting up $file"
    mv ~/$file $oldfiles/ 2>/dev/null
    ln -sf $dir/$file ~/$file
done

# setup nvim
mkdir -p ~/.config/nvim
echo "setting up nvim"
mv ~/.config/nvim/init.vim $oldfiles/ 2>/dev/null
ln -sf ~/.vimrc ~/.config/nvim/init.vim
