#!/bin/bash

mkdir output

for i in ./*.pdf; do
    qpdf --empty --pages "$i" 2-z -- "output/$i"
    rm "$i"
done

cd output

qpdf --empty --pages *.pdf -- "the_book.pdf"

mv "the_book.pdf" ../

cd ..

rm -r output
