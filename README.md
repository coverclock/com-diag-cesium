# com-diag-cesium

## Copyright

Copyright 2018 by the Digital Aggregates Corporation, Arvada Colorado, USA.

## License

Licensed under the terms of the FSF GPL v2.

## Abstract

Cesium is not much more than a simple script that uses NTP and its ntpq
command to monitor in real-time the various NTP servers/clocks on my local
network. (I have a few, both home brew and commercial.)  It automatically
starts up when the "pi" user is configured to automatically log in
at boot time. It runs on a Raspberry Pi with a 7" touch-sensitive LCD
display. It just sits on my desk and occasionally I touch the screen
to bring it out of power-save mode and check the display to see what my
clocks are doing.

## Photographs

<https://www.flickr.com/photos/johnlsloan/albums/72157691467251400>

## Repositories

<https://github.com/coverclock/com-diag-cesium>

<https://gitlab.com/NTPsec/ntpsec.git>

## Distributions

<http://www.ke5fx.com/heather/readme.htm>

## Related

<https://github.com/coverclock/com-diag-hazer>

<https://github.com/coverclock/com-diag-diminuto>

<https://github.com/coverclock/com-diag-hourglass>

<https://github.com/coverclock/com-diag-astrolabe>

<https://github.com/coverclock/com-diag-obelisk>

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

    cd
    cd src
    apt install bison libevent-dev libcap-dev libssl-dev libreadline-dev
    git clone https://gitlab.com/NTPsec/ntpsec.git
    cd ntpsec
    ./waf configure --refclock=shm
    ./waf build
    ./waf install
