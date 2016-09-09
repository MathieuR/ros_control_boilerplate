function findreplace() {
    grep -lr -e "$1" * | xargs sed -i "s/$1/$2/g" ;
}

function findreplacefilename() {
    find . -depth -name "*$1*" -exec bash -c 'for f; do base=${f##*/}; mv -- "$f" "${f%/*}/${base//'$1'/'$2'}"; done' _ {} +
}

findreplacefilename bioloid bioloid
findreplace bioloid bioloid
findreplace Bioloid Bioloid
findreplace BIOLOID BIOLOID

