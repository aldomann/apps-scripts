#!/bin/bash
# Author: Alfredo Hernández <aldomann@gmail.com>
echo "Select the PPAs you want to add"
echo "1) Basic PPAs         [5]"
echo "2) Exclusive PPAs     [5]"
echo "3) Extra repositories [8]"
echo "4) Delete duplicated  [*]"
read CHOICE

case $CHOICE in
  1)
		sudo add-apt-repository ppa:cybolic/vineyard-testing && sudo add-apt-repository ppa:gnome3-team/gnome3 && sudo add-apt-repository ppa:tiheum/equinox && sudo add-apt-repository ppa:ubuntu-wine && sudo add-apt-repository ppa:webupd8team/java
		;;
	2)
		 sudo add-apt-repository ppa:menulibre-dev/devel && sudo add-apt-repository ppa:nilarimogard/webupd8 && sudo add-apt-repository ppa:nuvola-player-builders/unstable && sudo add-apt-repository ppa:tombeckmann && sudo add-apt-repository ppa:webupd8team/sublime-text-2
		;;
	3)
		echo 'deb http://linux.dropbox.com/ubuntu precise main #Dropbox'>>'extras.list'
		echo 'deb http://archive.getdeb.net/ubuntu quantal-getdeb apps #Getdeb Apps'>>'extras.list'
		echo 'deb http://archive.getdeb.net/ubuntu quantal-getdeb games #Getdeb Games'>>'extras.list'
		echo 'deb http://dl.google.com/linux/chrome/deb/ stable main #Google Chrome'>>'extras.list'
		echo 'deb http://dl.google.com/linux/earth/deb/ stable main #Google Earth'>>'extras.list'
		echo 'deb http://dl.google.com/linux/musicmanager/deb/ stable main #Google Music Manager'>>'extras.list'
		echo 'deb http://dl.google.com/linux/talkplugin/deb/ stable main #Google Talk Plug-in'>>'extras.list'
		echo 'deb http://repository.spotify.com stable non-free #Spotify'>>'extras.list'
		chmod 644 'extras.list'
		sudo chown root:root 'extras.list'
		sudo mv 'extras.list' '/etc/apt/sources.list.d/extras.list'
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5044912E 46D7E7CF 7FAC5991 94558F59
		;;
	4)
		cd /etc/apt/sources.list.d/
		sudo rm -rf *.save
		sudo rm -rf *dropbox*.list *google*.list
		;;
	*)
		echo "Choose a valid option"
		exit 1
		;;
	# Eventuals [4]
		# ppa:libreoffice
		# ppa:otto-kesselgulasch/gimp
		# ppa:videolan/master-daily
		# ppa:gnome3-team/staging

	# Not updated yet [2]
		# ppa:mohanr2222/circle
		# ppa:w-vollprecht
esac
