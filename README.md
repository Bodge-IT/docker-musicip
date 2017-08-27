# Headless MusicIp in container with LMS
I forked this container from https://github.com/justifiably because I couldn't get it to work without personalising some of the files to suit my system.

Containers are are voodoo magic to me but I realised justifiably's container was just not setup to work with my system, to enable the default "MusicIP Mix" option in LMS.

To get this this to work and allow for LMS to import from your MusicIP database (usually 'default.m3lib') during scanning, I had to change a couple of things.

1. Change the mmm.ini to reflect the correct location of the database (I store this in the root of music folder on NAS)
2. 

See the Wiki for updated details.


## TODO

- It would be nice to shrink the image perhaps, using alpine or a smaller debootstrap
- suexec (https://github.com/ncopa/su-exec) smaller than gosu

