# Headless MusicIp in container with LMS
I forked this container from https://github.com/justifiably because I couldn't get it to work without personalising some of the files to suit my system.

Containers are are voodoo magic to me but I realised @justifiably's container was just not configured to work with my system and enable the magic "MusicIP Mix" option in the LMS.

To get this this to work and allow for LMS to import from your MusicIP database (usually 'default.m3lib') during scanning, I had to change:

1. Change the mmm.ini to reflect the correct location of the database (I store this in the root of music folder on NAS)
2. Work the volumes better so that I could access configs

See the Wiki for updated details.
I'm sure this could be done more elegantly but it worked for me, so on to next project.


## TODO

- ToDo: Tidy up container and info so that it's simple to use for others.
- ToDo: Build image
