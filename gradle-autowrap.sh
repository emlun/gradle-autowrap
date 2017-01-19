#!/bin/bash
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

SYSTEM_GRADLE=/usr/bin/gradle

working_dir=$(pwd)
gradle_cmd=$SYSTEM_GRADLE

while true; do
  if [[ -x ./gradlew ]]; then
    gradle_cmd="$(pwd)/gradlew"
    break
  else
    cd ..
    if [[ "$(pwd)" == '/' ]]; then
      break
    fi
  fi
done

cd "$working_dir"

if [[ "$gradle_cmd" != "$SYSTEM_GRADLE" ]] && hash realpath &>/dev/null; then
  relative_gradle_cmd=$(realpath --relative-to=$(pwd) ${gradle_cmd})
  if [[ "$relative_gradle_cmd" == 'gradlew' ]]; then
    echo 'Using ./gradlew'
  else
    echo "Using $relative_gradle_cmd"
  fi
else
  echo "Using $gradle_cmd"
fi
$gradle_cmd "$@"
