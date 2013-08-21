#!/bin/bash
# Author: Alfredo Hernández <aldomann@gmail.com>
echo "Select the applications you want to install"
echo "0) Uninstall [6]"
echo "1) Basics    [45] "
echo "2) Games     [3]"
echo "3) Exclusive [16]"
echo "4) Science   [1]"
echo "5) Testing   [2]"
read CHOICE

case $CHOICE in
	0) 
		sudo aptitude purge firefox firefox-globalmenu firefox-gnome-support firefox-locale-en firefox-locale-es xul-ext-ubufox
		;;
	1) 
		sudo aptitude install alacarte bleachbit faience-icon-theme faience-theme fonts-droid fonts-lmodern fonts-roboto gbrainy gdebi gimp gnome-cards-data google-chrome-unstable google-earth-stable google-talkplugin gstreamer1.0-plugins-ugly hardinfo icedtea-7-plugin inkscape nautilus-image-converter oracle-java7-installer p7zip pdfjam pdftk pitivi quadrapassel rar skype sound-juicer spotify-client synaptic vineyard vlc wine aspell-ca aspell-en aspell-es hyphen-ca hyphen-en-us myspell-ca myspell-en-gb mythes-ca mythes-en-us wbritish wcatalan wspanish
		;;
	2) 
		sudo aptitude install gameconqueror vbam-gtk zsnes
		;;
	3) 
		sudo aptitude install arista bzr comix dropbox gcolor2 git gnac google-musicmanager-beta gparted gtk-3-examples nuvolaplayer ppa-purge sublime-text-installer thunar uberwriter undistract-me
		;;
	4)
		sudo aptitude install gelemental
		;;
	5)
		sudo aptitude install cutemupen mupen64plus
		;;
	*) 
		echo "Choose a valid option"
		exit 1
		;;
esac
