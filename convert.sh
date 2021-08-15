DIR='./'
if [ -z $1 ]; then
  DIR='*/'
else
  DIR=$1
fi
find ${DIR}*.opus | cut -d'.' -f1 | xargs -I {} ffmpeg -i "{}".opus "{}".m4a
