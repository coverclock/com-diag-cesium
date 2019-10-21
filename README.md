# com-diag-cesium

## Copyright

Copyright 2018 by the Digital Aggregates Corporation, Arvada Colorado, USA.

## License

Licensed under the terms of the FSF GPL v2.

## Abstract

Cesium is not much more than a simple script that uses NTP and its ntpq
command to monitor in real-time the various NTP servers/clocks on my local
network. (I have a few, both home brew and commercial.)  It automatically
starts up providing the "pi" user is configured to automatically log in
at boot time. It runs on a Raspberry Pi with a 7" touch-sensitive LCD
display. It just sits on my desk and occasionally I touch the screen
to bring it out of power-save mode and check the display to see what my
clocks are doing.

My NTP clocks are Hourglass (uses a serial GPS receiver), Astrolabe (uses
a chip-scale cesium atomic clock), Obelisk (uses a home-brew WWVB receiver),
and Candleclock (uses a USB GPS receiver).

Recently I've installed Lady Heather, an open source GPS monitoring tool (see
link below), on this system. Now my .profile script brings up a second window
running Lady Heather on a USB GPS device at /dev/ttyUSB0 (I'm using a
NaviStar GR-701W).

Even more recently, I've added a third window to run my own Hazer
gpstool with a second USB GPS device at /dev/ttyACM0 (this one is a
GlobalSAT BU-353W10). Hazer's gpstool is built on top of the Hazer C
library and also my Diminuto C library.

## Photographs

<https://www.flickr.com/photos/johnlsloan/albums/72157691467251400>

## Repositories

<https://github.com/coverclock/com-diag-cesium>

<https://gitlab.com/NTPsec/ntpsec.git>

<https://github.com/coverclock/com-diag-hazer>

<https://github.com/coverclock/com-diag-diminuto>

## Distributions

<http://www.ke5fx.com/heather/readme.htm>

## Related

<https://github.com/coverclock/com-diag-hourglass>

<https://github.com/coverclock/com-diag-astrolabe>

<https://github.com/coverclock/com-diag-obelisk>

<https://github.com/coverclock/com-diag-candleclock>

## References

<https://www.ntpsec.org/white-papers/stratum-1-microserver-howto/>

## Contact

Chip Overclock    
<mailto:coverclock@diag.com>    
Digital Aggregates Corporation    
3440 Youngfield Street    
Suite 209    
Wheat Ridge CO 80033 USA    

## Notes

Enable auto-login (and SSH if you want it, I do) using the Pi's on-screen
menus.

    cd
    cd src
    apt install bison libevent-dev libcap-dev libssl-dev libreadline-dev
    git clone https://gitlab.com/NTPsec/ntpsec.git
    cd ntpsec
    ./waf configure --refclock=shm
    ./waf build
    ./waf install

    cd
    cd src
    git clone https://github.com/coverclock/com-diag-diminuto
    cd com-diag-diminuto/Diminuto
    make pristine depend all
    sudo make install

    cd
    cd src
    git clone https://github.com/coverclock/com-diag-hazer
    cd com-diag-hazer/Hazer
    make pristine depend all
    sudo make install

Install all the files in the overlay directory in the appropriate spots.

Install additional packages for which there are dependencies.

    sudo apt-get install inotify-tools

