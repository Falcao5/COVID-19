#!/bin/bash

DIR="/data"

mkdir $DIR

if [ "$(ls -A $DIR)" ]; then
     echo "$DIR is not Empty. I'm gonna try to pull."
     git -C $DIR pull
else
    echo "$DIR is Empty. I'm gonna clone. This process may take a few minutes..."
    git clone https://github.com/pcm-dpc/COVID-19.git $DIR
fi
