dir=$(pwd)
oldfiles=$(pwd)/old
files=".zshrc .vimrc .gitconfig template.tex"

mkdir -p $oldfiles

echo "moving old files to $oldfiles"

for file in $files; do
    echo "setting up $file"
    mv ~/$file $oldfiles/ 2>/dev/null
    ln -s $dir/$file ~/$file
done
