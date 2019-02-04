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

export EDITOR=vi

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
			exec lxterminal --command="$HOME/bin/gpsquery" --geometry=80x100
		) &
	fi
fi
