DIR='./'
if [ -z $1 ]; then
  DIR='*/*'
else
  DIR=$1
fi
# find ${DIR}*.opus | cut -d'.' -f1 | xargs -I {} ffmpeg -i "{}".opus "{}".m4a
for file in ${DIR}; do
  filename=$(basename -- "$file")
  pathname=$(dirname -- "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"
  echo "${pathname}/${filename}.${extension} -> ${pathname}/${filename}.m4a"
  if [ ! $extension == '.m4a' ]; then
    ffmpeg -i ${pathname}/${filename}.${extension} ${pathname}/${filename}.m4a
  fi
done
