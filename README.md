Gradle Wrapper wrapper `gradle`
===

Entry script for Gradle that walks up the directory tree and calls the closest
Gradle wrapper if it exists, falling back on `/usr/bin/gradle` if no wrapper is
found.

The script assumes that all your Gradle wrappers have the file name `gradlew`
and that your system Gradle binary is `/usr/bin/gradle`.


Installation
---

Install as `gradle` somewhere that appears before `/usr/bin/gradle` in your
PATH. `/usr/local/bin/gradle` should probably work, for example.


Usage
---

Once installed, you can simply run `gradle` on the command line and you'll use
the wrapper if it exists.


License
---

This is free and unencumbered software released into the public domain;
see http://unlicense.org/
