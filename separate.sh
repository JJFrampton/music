for dir in */; do
  for file in ${dir}/*; do
    filename=$(basename -- "$file")
    # pathname=$(dirname -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    [ ! -d ${dir%?}-m4a ] && mkdir ${dir%?}-m4a
    if [ "$extension" = 'm4a' ];then
      echo "${dir}/${filename}.${extension} -> ${dir%?}-m4a/${filename}.m4a"
      mv ${dir}${filename}.${extension} ${dir%?}-m4a/${filename}.${extension}
    fi
  done
done
