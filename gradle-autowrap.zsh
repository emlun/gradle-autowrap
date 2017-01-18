#!/usr/bin/zsh
#
# Entry script for Gradle that walks up the directory tree and calls the
# closest Gradle wrapper if it exists, falling back on /usr/bin/gradle if no
# wrapper is found.
#
# Install as "gradle" somewhere that appears before /usr/bin/gradle in your
# PATH. /usr/local/bin/gradle should probably work, for example. Then simply
# run `gradle` on the command line and you'll use the wrapper if it exists.
#
# Author: Emil Lundberg <lundberg.emil@gmail.com> <https://keybase.io/emlun>
# This is free and unencumbered software released into the public domain;
# see http://unlicense.org/

setopt extended_glob nullglob

wrapper=$(echo (../)#./gradlew)

last_wrapper=''
for w in $(echo $wrapper); do
  last_wrapper=$w
done

if [[ -x "$last_wrapper" ]]; then
  echo "Using $last_wrapper"
  $last_wrapper "$@"
else
  echo "Using /usr/bin/gradle"
  /usr/bin/gradle "$@"
fi
