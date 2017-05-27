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
            #echo $name.java
            rm -rf ./$path/$name.javac
            decodeFileTip $var
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
            cat ./$var > ./$path/$name.a
            rm -rf ./$var
            cp ./$path/$name.a ./$path/$name
            #echo $name
            rm -rf ./$path/$name.a
            decodeFileTip $var
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
            cat ./$var > ./$path/$name.a
            rm -rf ./$var
            cp ./$path/$name.a ./$path/$name
            rm -rf ./$path/$name.a
            decodeFileTip $var
        done
}
#######################################################################
#
# decode C file
#
#######################################################################
function decodeC(){
    java_list=`find code/* -name "*.c"`
    
    for var in $java_list
        do
            getFilePath $var
            getFileName $var            
            cat ./$var > ./$path/$name.a
            rm -rf ./$var
            cp ./$path/$name.a ./$path/$name
            rm -rf ./$path/$name.a
            decodeFileTip $var
        done
}
#######################################################################
#
# decode CPP file
#
#######################################################################
function decodeCPP(){
    java_list=`find code/* -name "*.cpp"`
    
    for var in $java_list
        do
            getFilePath $var
            getFileName $var            
            cat ./$var > ./$path/$name.a
            rm -rf ./$var
            cp ./$path/$name.a ./$path/$name
            rm -rf ./$path/$name.a
            decodeFileTip $var
        done
}
#######################################################################
#
# decode file tip
#
#######################################################################
function decodeFileTip(){
    echo "decode:$1"
}
#######################################################################
#
# main
#
#######################################################################

if [ "$1" == "" ];then
    echo "pls add source path!!!"
else
    rm -rfv code
    rm -rfv decode.zip
    
    cp -rv $1 code
    root=`pwd`
    
    decodeJava
    decodeXml
    decodeJni
    decodeC
    decodeCPP
    
    zip -r decode.zip ./code/*
    rm -rfv code
    
fi


