#!/bin/bash

function print_dylib_info() {
  echo
  echo
  echo ====================================
  echo About dylib "$1":
  echo ====================================
  if test -e "$1"
  then echo "$1" exists.
  else echo "$1" does not exist.
       return
  fi
  echo ls -l "$1" :
  ls -l "$1"
  echo file "$1" :
  file "$1"
  echo otool -L "$1" :
  otool -L "$1"
  if test -L "$1"
  then echo "$1" is a symbolic link, it points to $(readlink "$1") .
  fi
}

for dylib in "$@"
do print_dylib_info "$dylib"
done
