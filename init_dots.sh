# Declare all dot files to version control
# some examples of . files:
# .bashrc
# .bash_aliases
# .inputrc
# .gitconfig
# .ideavimrc
# .vimrc
declare -a arr=(".vimrc")

# Create symlinks from repo to HOME directory.
for i in "${arr[@]}"
do
    DOT_SOURCE=$(realpath $i);
    ln -sf $DOT_SOURCE ~/$i;
done
