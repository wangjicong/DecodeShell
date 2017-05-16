#/!bin/sh

#######################################################################
#
# get file path
#
#######################################################################
function getFilePath(){
    str=$1
    path=${str%/*}
}
#######################################################################
#
# get file name
#
#######################################################################
function getFileName(){
    str=$1
    full_name=${str##*/}
    name=${full_name%.java}
}
#######################################################################
#
# decode java file
#
#######################################################################
function decodeJava(){
    java_list=`find code/* -name "*.java"`
    
    for var in $java_list
        do
            getFilePath $var
            getFileName $var
            cat ./$var > ./$path/$name.javac
            rm -rf ./$var
            cp ./$path/$name.javac ./$path/$name.java
            rm -rf ./$path/$name.javac
        done
}
#######################################################################
#
# decode xml file
#
#######################################################################
function decodeXml(){
    java_list=`find code/* -name "*.xml"`
    
    for var in $java_list
        do
            getFilePath $var
            getFileName $var
            cat ./$var > ./$path/$name.xmlc
            rm -rf ./$var
            cp ./$path/$name.xmlc ./$path/$name.xml
            rm -rf ./$path/$name.xmlc
        done
}
#######################################################################
#
# decode xml file
#
#######################################################################
function decodeJni(){
    java_list=`find code/* -name "*.jni"`
    
    for var in $java_list
        do
            getFilePath $var
            getFileName $var
            cat ./$var > ./$path/$name.jnic
            rm -rf ./$var
            cp ./$path/$name.jnic ./$path/$name.jni
            rm -rf ./$path/$name.jnic
        done
}
#######################################################################
#
# main
#
#######################################################################

if [ "$1" == "" ];then
    echo "pls add source path!!!"
else

    rm -rf source.zip
    rm -rf code
    rm -rf decode.zip

    find $1 -name "*.java" | xargs zip source.zip
    find $1 -name "*.xml" | xargs zip source.zip
    find $1 -name "*.mk" | xargs zip source.zip
    find $1 -name "*.png" | xargs zip source.zip
    find $1 -name "*.jpg" | xargs zip source.zip
    find $1 -name "*.jni" | xargs zip source.zip
    
    unzip source.zip -d code
    
    rm -rf source.zip
    root=`pwd`
    
    decodeJava
    decodeXml
    decodeJni
    
    zip -r decode.zip ./code/*
    rm -rf code
    
fi


