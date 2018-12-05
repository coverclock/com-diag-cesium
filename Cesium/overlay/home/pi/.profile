# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -n "$DISPLAY" ]; then
	(
		sleep 60
		exec lxterminal --command="$HOME/bin/ntpquery" --geometry=98x25
	) &
	if [ -c "/dev/ttyUSB0" ]; then
		(
			sleep 60
			exec heather -1u -rxu -br=9600 -tz=-7MST/MDT -b=1 -gm
		) &
	fi
	if [ -c "/dev/ttyACM0" ]; then
		(
			sleep 60
			exec lxterminal --command="/usr/local/bin/gpstool -D /dev/ttyACM0 -b 9600 -8 -n -1 -F -t 10 -M 4 -W '\$PUBX,00' -W '\$PUBX,03' -W '\$PUBX,04' -W '\$PUBX,40,GSV,0,0,0,1,0,0' -W '\$PUBX,40,VTG,0,0,0,1,0,0' -W '\\xb5\\x62\\x06\\0\\0\\0' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x01\\x20\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x01\\x21\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x01\\x22\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x0d\\x01\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x0d\\x03\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x0a\\x09\\x01' -W '\\xb5\\x62\\x06\\x01\\x03\\0\\x01\\x03\\x01' -W '\\xb5\\x62\\x06\\x39\\x08\\0\\xf7\\x56\\xb1\\x96\\x1e\\x63\\0\\0' -W '\\xb5\\x62\\x0a\\x04\\0\\0' -W '\\xb5\\x62\\x06\\x06\\0\\0' -W '\\xb5\\x62\\x06\\x31\\0\\0' -W '\\xb5\\x62\\x06\\x3e\\0\\0'" --geometry=80x50
		) &
	fi
fi
