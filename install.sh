echo Installing TermuxVimIDE
echo Firstly pull all submodules:
git submodule update --init --recursive
git submodule update --recursive
echo "Do you want to delete old vim-files? [y/n]"
ask="a"
while [ \( "$ask" != "y" \) -o \( "$ask" != "n" \) -o \( "$ask" != "Y" \) -o \( "$ask" != "N" \) ]
do
    read -r ask
    if [ \( $ask == "y" \) -o \( $ask == "Y" \)  ];
        then
            rm -f ~/.vimrc
            rm -rf ~/.vim/
            mkdir ~/.vim/
            echo The old vim files have been deleted!
            break
    fi 
    if [ \( $ask == "n" \) -o \( $ask == "N" \)  ];
        then
            echo nothing has deleted, installtion aborted
            exit 1
        else
            echo Input was not correct
            echo "Do you want to delete old vim-files? [y/n]"
    fi
done
echo Copying TermuxVimIDE to ~/.vim/ 
cp -r ./* ~/.vim/
echo Copying .vimrc to ~/.vimrc
cp -f ./.vimrc ~/.vimrc 
echo Copying .tern-config to ~/.tern-config 
cp -f ./.tern-config ~/.tern-config 
echo Installing finished! 


