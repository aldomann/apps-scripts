#!/bin/bash
# Author: Alfredo Hernández <aldomann@gmail.com>
echo "Select the applications you want to install"
echo "0) Uninstall    [6]"
echo "1) Basics       [42] "
echo "2) Games        [5]"
echo "3) Exclusive    [16]"
echo "4) Science      [1]"
echo "5) Testing      [5]"
read CHOICE

case $CHOICE in
  0) 
		sudo aptitude purge firefox firefox-globalmenu firefox-locale-en firefox-locale-es tracker xul-ext-ubufox
		;;
	1) 
		sudo aptitude -y install bleachbit faience-icon-theme faience-theme fonts-droid gbrainy gdebi gimp gnac gnome-cards-data google-chrome-unstable google-earth-stable google-talkplugin hardinfo icedtea-7-plugin inkscape nautilus-image-converter oracle-java7-installer p7zip-full p7zip-rar pitivi quadrapassel skype sound-juicer spotify-client synaptic thunar ubuntu-tweak vineyard vlc wine aspell-ca aspell-en aspell-es hyphen-ca hyphen-en-us myspell-ca myspell-en-gb mythes-ca mythes-en-us wbritish wcatalan wspanish
		;;
	2) 
		sudo aptitude install gameconqueror hedgewars vbam-gtk wesnoth zsnes
		;;
	3) 
		sudo aptitude install arista bzr comix dropbox gcolor2 git google-musicmanager-beta gparted gtk-vector-screenshot menulibre nuvolaplayer ppa-purge screenruler sublime-text uberwriter undistract-me
		;;
	4)
		sudo aptitude install gelemental
		;;
	5)
		sudo aptitude install cutemupen mupen64plus software-centre pdftk pdfjam
		;;
	*) 
		echo "Choose a valid option"
		exit 1
		;;
	# Not in use [18]
		# adobe-flashplugin cantor chromium-browser minitube miro musique screenkey sparkleshare unetbootin libreoffice easytag gwoffice go-mtpfs gnome-clocks unoconv 
	# Quarantine [11]
		# arista easytag tucan gnome-clocks pitivi screenruler uberwriter gnac gwoffice gnome-documents circle
esac
