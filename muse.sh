#!/bin/bash

# create folders for output and backup
mkdir output source_files

for i in ./*.pdf; do
  #cut the first page in every source pdf and send it to output
    qpdf --empty --pages "$i" 2-z -- "output/$i"
  #back up source files
    mv "$i" "source_files/"
done

# go to output
cd output

# combine all files into one
qpdf --empty --pages *.pdf -- "the_book.pdf"

# move new file into the parenting directory
mv "the_book.pdf" ../

# return to the parenting directory
cd ..

# archive back up
zip -r -s 64 "source_files.zip" "source_files"

# clean up
rm -r output source_files
