# repl.it compile script for greenfoot projects
set -e # exit on errors

echo preparing...

# clean up any left over temp directories from the last build
rm -rf /tmp/greenfoot.*
# make a temp directory to hold the build
TEMPDIR=`mktemp -dt greenfoot.XXXXXXXXXX`
# create a directory to hold the compiled class files
mkdir -p $TEMPDIR/build
# create directories to hold uncompressed libraries
mkdir -p $TEMPDIR/lib/greenfoot
mkdir $TEMPDIR/lib/bluejcore

echo compiling...

# compile all class files into the build dir
javac *.java -d $TEMPDIR/build \
    -cp greenfoot/greenfoot.jar:greenfoot/bluejcore.jar 

echo packaging...

# extract the greenfoot .jar files into the tmp directory
unzip -q greenfoot/greenfoot.jar -d $TEMPDIR/lib/greenfoot
unzip -q greenfoot/bluejcore.jar -d $TEMPDIR/lib/bluejcore

# create an executable jar file including the greenfoot and bluej libraries
jar -cfe $TEMPDIR/Project.jar greenfoot.export.GreenfootScenarioMain \
    images/* -C settings . -C $TEMPDIR/build . \
    -C $TEMPDIR/lib/greenfoot . \
    -C $TEMPDIR/lib/bluejcore .

# cleanup build files
rm -r $TEMPDIR/build
rm -r $TEMPDIR/lib

echo running...

# run the packaged greenfoot project
java -jar $TEMPDIR/Project.jar
