#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
SITE=$baseDir/../dist
# functions

# main
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
if [ ! -d $SITE/_site ]; then
    mkdir -p $SITE/_site
fi
nohup $baseDir/live.sh 2>&1 >>/dev/null &
cd $baseDir/../docfx_project
docfx serve --hostname 0.0.0.0 --port 8788 $SITE/_site
