#!/bin/bash
file="/home/kingo/Downloads/vscode-insider.tar.gz"

curl -L https://vscode-update.azurewebsites.net/latest/linux-x64/insider --output $file

if [ -z "$file" ]
    then
        echo "No file supplied, add the file"
        exit 1

fi

if [[ $file == *.tar.gz ]]
    then
        # Proceed, it's a tar.gz file
        # Make a temp directory for the vscode archive
        mkdir /home/kingo/temp
        tar -xzf "$file" -C /home/kingo/temp
        # Move into the app folder
        rm -rf /home/kingo/Apps/code-insider/*
        rsync -avhP /home/kingo/temp/VSCode-linux-x64/* /usr/share/code-insiders
        # Delete the temp folder, cleanup
        rm -rf /home/kingo/temp
        rm $file
        exit 0
else    
    echo "The file is not a .tar.gz archive"
    exit 1
fi