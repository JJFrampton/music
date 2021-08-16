# Should update to create newfiles in new directories
# not overwrite by default

# COLORS
DEFAULT='\e[39m'
BLUE='\e[34m'
MAGENTA='\e[35m'

USAGE="\n ${BLUE}DESCRIPTION:${DEFAULT} This utility is designed to clean file names of abnormal chars\n
\n
${BLUE}USAGE:${DEFAULT} ./clean.sh <action> [directory]\n
\n
${BLUE}DEFAULTS:${DEFAULT}\n
 - <manditory> [optional]\n
 - Default directory is not current, but all children\n
\n
${BLUE}ACTIONS:${DEFAULT}\n
${MAGENTA} - show - ${DEFAULT} lists the files that would be targeted\n
${MAGENTA} - dryrun - ${DEFAULT} shows the changes that would be made in <run>\n
${MAGENTA} - run - ${DEFAULT} mutates files, irriversable\n
"


if [ -z $1 ]; then echo -e ${USAGE}; exit 1; fi
ACTION=$1
if [ -z $2 ]; then
  DIR='*/*'
else
  DIR=$2
fi

case "$ACTION" in
  "show")
    for file in $DIR; do echo $file; done
    ;;
  "dryrun")
    for file in $DIR; do
      dest="${file//[[:space:]]-[[:space:]]/-}" \
      dest="${dest//[[:space:]]/_}" \
      && echo "${dest//[^[:alnum:]._\/-]/}"
    done
    ;;
  "run")
    for file in $DIR; do
      # replace ' - ' with '-'
      # replace ' ' with '_'
      # remove everything but alphanumeric and '._/-'
      # auto answer no to overwriting existing files
      dest="${file//[[:space:]]-[[:space:]]/-}" \
      && dest="${dest//[[:space:]]/_}" \
      && yes n | mv -i "$file" "${dest//[^[:alnum:]._\/-]/}"
    done
    ;;
  "showdir")
    for dir in ./*; do
      # replace ' - ' with '-'
      # replace ' ' with '_'
      # remove everything but alphanumeric and '._/-'
      # auto answer no to overwriting existing files
      dest="${dir//[[:space:]]-[[:space:]]/-}" \
      && dest="${dest//[[:space:]]/_}" \
      && echo "$dir" "${dest//[^[:alnum:]._\/-]/}"
    done
    ;;
  "rundir")
    for dir in ./*; do
      # replace ' - ' with '-'
      # replace ' ' with '_'
      # remove everything but alphanumeric and '._/-'
      # auto answer no to overwriting existing files
      dest="${dir//[[:space:]]-[[:space:]]/-}" \
      && dest="${dest//[[:space:]]/_}" \
      && yes n | mv -i "$dir" "${dest//[^[:alnum:]._\/-]/}"
    done
    ;;
  *)
    echo -e ${USAGE}
    ;;
esac
