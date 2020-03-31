#!/bin/bash

mkdir output source_files

for i in ./*.pdf; do
    qpdf --empty --pages "$i" 2-z -- "output/$i"
    mv "$i" "source_files/"
done

cd output

qpdf --empty --pages *.pdf -- "the_book.pdf"

mv "the_book.pdf" ../
cd ..

zip -r -s 64 "source_files.zip" "source_files"

rm -r output source_files
