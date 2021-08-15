if [ -z $1 ]; then
  echo ""
  echo -e "Need to input a directory"
  echo -e "\tThis directory will be created"
  echo -e "\tand used as the target directory for the downloads"
  echo -e "$0 <dash-separated-directory> <youtube-url>"
  echo ""
  exit 1
fi
if [ -z $2 ]; then
  echo ""
  echo -e "Need to input a target youtube URL"
  echo -e "\tThis can be a single or a playlist"
  echo -e "$0 <dash-separated-directory> <youtube-url>"
  echo ""
  exit 1
fi
mkdir $1 \
  && cd $1 \
  && youtube-dl --yes-playlist -i -x -o %(title)s.%(ext)s $2

# For example for -o %(title)s-%(id)s.%(ext)s and an mp4 video with title
#        youtube-dl test video  and  id  BaW_jenozKcj,  this  will  result  in a
#        youtube-dl test video-BaW_jenozKcj.mp4 file created in the current  di-
#        rectory.

# cant get the hash to match and remove from song names
# the hash can only be seen on the song url, not the playlist
# so the following would not work for playlists
# regex='v=.*&'
# [[ $2 =~ $regex ]]
# echo ${BASHREMATCH[1]}
