#!/bin/sh

#DATE=`date +'%d%m%Y'`
DATE="27062012"
STAGE_DIR="/home/jude/developer/gentoo-development/x86/uclibc/stages/"
MOST_RECENT_STAGE3=`ls $STAGE_DIR --sort=time | grep -vi content | grep -vi digest | grep -i stage3 | tail -n1 | sed s/.tar.bz2//g`

# catalyst vars
subarch="x86"
version_stamp="uclibc-$DATE"
rel_type="embedded"
profile="uclibc/x86"
snapshot="$DATE"
source_subpath="$rel_type/$MOST_RECENT_STAGE3"
#cflags="-Os -march=i386 -pipe"
chost="i386-gentoo-linux-uclibc"

# build snapshot for portage tree
echo "Generating Portage Snapshot"
#catalyst -s $DATE &> portage-snp.log
echo "Done"

# build stage1
echo -e "\nGenerating stage1"
target="\"stage1\""
`catalyst -p -C subarch=$subarch target=$target version_stamp=$version_stamp rel_type=$rel_type profile=$profile snapshot=$snapshot source_subpath=$source_subpath cflags=$cflags chost=$chost  &> stage1-build.log`
echo "Done"

# build stage2
#echo -e "\nGenerating stage2"
#target="\"stage2\""
#source_subpath="$rel_type/stage1-x86-$version_stamp"
#`catalyst -d -p -C subarch=$subarch target=$target version_stamp=$version_stamp rel_type=$rel_type profile=$profile snapshot=$snapshot source_subpath=$source_subpath cflags=$cflags chost=$chost  &> stage2-build.log`
#echo "Done"

#build stage3
#echo -e "\nGenerating stage3"
#target="\"stage3\""
#source_subpath="$rel_type/stage2-x86-$version_stamp"
#`catalyst -p -C subarch=$subarch target=$target version_stamp=$version_stamp rel_type=$rel_type profile=$profile snapshot=$snapshot source_subpath=$source_subpath cflags=$cflags &> stage3-build.log`
#echo "Done"

echo -e "\n\nAll Done"
