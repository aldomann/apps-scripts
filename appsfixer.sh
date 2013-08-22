#!/bin/bash
# Author: Alfredo Hernández <aldomann@gmail.com>
echo "Select the fix you want to apply"
echo "1)  Bashrc - Add 'Binaries' to PATH"
echo "2)  *Directories - Create symbolic links"
echo "3)  Broadcom Wireless - Install firmware"
echo ""
echo "4)  Google Earth - Appearance"
echo "5)  VLC - Media keys"
echo "6)  VLC - GNOME interface"
echo "7)  Inkscape - Icons"
echo "8)  Wine - Smooth Fonts"
echo ""
echo "9)  Faience Icons - Extra icons"
echo "10) Faience GNOME Shell - Fonts"
echo "11) Applications - Add .desktop,.directory, .menu"
echo "12) Nautilus - Add scripts"
echo "13) GNOME Shell - Set-up app folders"
echo "14) GNOME - Set Faience/Roboto UI"
echo "15) GNOME - Set GNOME UI"
echo "16) GNOME Shell - Change window button layout [All:]"
read CHOICE

case $CHOICE in
	1)
		echo 'export PATH="$HOME/Dropbox/Binaries:$PATH"'>>'.bash_profile'
		echo ''>>'.bashrc'
		echo 'if [ -f ~/.bash_profile ]; then'>>'.bashrc'
		echo 'source ~/.bash_profile'>>'.bashrc'
		echo 'fi'>>'.bashrc'
		;;
	2)
		echo'WIP: links'
		;;
	3)
		sudo aptitude install b43-fwcutter firmware-b43-installer
		sudo rfkill unblock all
		# type into terminal: 'cat /etc/modprobe.d/* | grep bcm' and see if the term 'blacklist bcm43xx' is there; if it is, type 'sudo gedit /etc/modprobe.d/blacklist.conf' and put a # in front of the line: 'blacklist bcm43xx'
		;;
# --------------------------------------------------
	4)
		# Delete files
			cd /opt/google/earth/free
			sudo rm -rf libcurl.so.4 libGLU.so.1 libnss_mdns4_minimal.so.2 libQtCore.so.4 libQtGui.so.4 libQtNetwork.so.4 libQtWebKit.so.4
			cd $HOME
		# Replace libfreeimage
			wget http://ubuntuone.com/4eMEQzuvi3GYedUe8UBhLS
			sudo mv 4eMEQzuvi3GYedUe8UBhLS '/opt/google/earth/free/libfreeimage.so.3'
			sudo chown $USERNAME:$USERNAME '/opt/google/earth/free/googleearth'
			sudo chmod 777 '/opt/google/earth/free/googleearth'
			sudo sed -i '43 d' '/opt/google/earth/free/googleearth'
			sudo sed -i '42 d' '/opt/google/earth/free/googleearth'
			echo 'export LD_PRELOAD=libfreeimage.so.3'>>'/opt/google/earth/free/googleearth'
			echo 'LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./googleearth-bin "$@"'>>'/opt/google/earth/free/googleearth'
			sudo chown root '/opt/google/earth/free/googleearth'
			sudo chmod 755 '/opt/google/earth/free/googleearth'
		# Libraries
			# sudo aptitude install libqtwebkit4 libcurl4-openssl-dev
		;;
	5)
		vlcrc="$HOME/.config/vlc/vlcrc"
		sed -i 's/#global-key-play-pause=/global-key-play-pause=Media Play Pause/' $vlcrc
		sed -i 's/#global-key-next=/global-key-next=Media Next Track/' $vlcrc
		sed -i 's/#global-key-prev=/global-key-prev=Media Prev Track/' $vlcrc
		sed -i 's/#global-key-stop=/global-key-stop=Media Stop/' $vlcrc
		;;
	6)
		cd $HOME/.config/vlc/
		rm -rf vlc-qt-interface.conf
		echo '[General]'>>'vlc-qt-interface.conf'
		echo 'IsFirstRun=0'>>'vlc-qt-interface.conf'
		echo 'geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x1\0\0\0\0\x1\x8a\0\0\x1:\0\0\x3r\0\0\x1t\0\0\x1\x8a\0\0\x1:\0\0\x3r\0\0\x1t\0\0\0\0\0\0)'>>'vlc-qt-interface.conf'
		echo ''>>'vlc-qt-interface.conf'
		echo '[MainWindow]'>>'vlc-qt-interface.conf'
		echo 'pl-dock-status=true'>>'vlc-qt-interface.conf'
		echo 'status-bar-visible=false'>>'vlc-qt-interface.conf'
		echo 'playlist-visible=false'>>'vlc-qt-interface.conf'
		echo 'adv-controls=0'>>'vlc-qt-interface.conf'
		echo 'bgSize=@Size(489 0)'>>'vlc-qt-interface.conf'
		echo 'playlistSize=@Size(-1 -1)'>>'vlc-qt-interface.conf'
		echo 'MainToolbar1="64;39-5;64;38-5;65;"'>>'vlc-qt-interface.conf'
		echo 'MainToolbar2="3-5;0-7;4-5;37-5;64-4;10-5;7-5;33;34-4;64-4;19-5;20-5;64-4;36-4;"'>>'vlc-qt-interface.conf'
		echo 'AdvToolbar="12-5;11-5;13-5;14-5;"'>>'vlc-qt-interface.conf'
		echo 'FSCtoolbar="64-4;3-5;0-7;4-5;37-5;64;25-5;8-1;33-1;34;64-1;36-4;64-4;"'>>'vlc-qt-interface.conf'
		echo 'InputToolbar='>>'vlc-qt-interface.conf'
		echo 'ToolbarPos=0'>>'vlc-qt-interface.conf'
		echo ''>>'vlc-qt-interface.conf'
		echo '[ToolbarProfiles]'>>'vlc-qt-interface.conf'
		echo '1\ProfileName=VLC 2.x.x Style'>>'vlc-qt-interface.conf'
		echo '1\Value="0|64;39;64;38;65;|0-2;64;3;1;4;64;7;9;64;10;20;19;64-4;37;65;35-4;|12;11;13;14;|43;33-4;44;|0-2;64;3;1;4;64;37;64;38;64;8;65;25;35-4;34;"'>>'vlc-qt-interface.conf'
		echo '2\ProfileName=VLC 1.1.x Style'>>'vlc-qt-interface.conf'
		echo '2\Value="0|64;39;64;38;65;|0-2;64;3;1;4;64;7;10;9;64-4;20;19;64-4;37;65;35-4;|12;11;13;14;|5-1;33;6-1;|0-2;64;3;1;4;64;37;64;38;64;8;65;25;35-4;34;"'>>'vlc-qt-interface.conf'
		echo '3\ProfileName=VLC 0.8.x Style'>>'vlc-qt-interface.conf'
		echo '3\Value="1|64;39-1;64;38;|2-1;32-4;0-5;1-5;32-5;3-5;5-5;6-5;4-5;32-5;10-1;64-1;35-1;65;|12-1;11-1;13-1;14-1;|33;37-4;|0-5;1-5;32-1;1-5;5-1;6-1;4-5;32-1;12-5;11-1;65;34-4;35-1;"'>>'vlc-qt-interface.conf'
		echo '4\ProfileName=Minimalist Style'>>'vlc-qt-interface.conf'
		echo '4\Value="0|64;65;|0-7;64;3-1;1-5;4-1;64;12-5;64-5;37-5;38-5;64-4;10-1;65;36-4;|11-5;13-5;14-5;|5-1;33;6-1;|0-5;64;3-5;1-5;4-5;64;12-5;65;34-4;35-1;"'>>'vlc-qt-interface.conf'
		echo '5\ProfileName=One-Liner Style'>>'vlc-qt-interface.conf'
		echo '5\Value="0|64;38;65;|0-4;64;3;1;4;64;7;10;9;64-4;39;64-4;37;65;36-4;|12;11;14;13;|5-1;33;6-1;|0-2;64;3;1;4;64;37;64;38;64;8;65;25;35-4;34;"'>>'vlc-qt-interface.conf'
		echo '6\ProfileName=Simplest Style'>>'vlc-qt-interface.conf'
		echo '6\Value="0||36-4;65-4;0-7;4-5;1-5;65-4;7-5;|12-4;11;13;||36-4;65-4;0-5;4-5;1-5;65;8-5;"'>>'vlc-qt-interface.conf'
		echo '7\ProfileName=GNOME'>>'vlc-qt-interface.conf'
		echo '7\Value="0|64;39-5;64;38-5;65;|3-5;0-7;4-5;37-5;64-4;10-5;7-5;33;34-4;64-4;19-5;20-5;64-4;36-4;|12-5;11-5;13-5;14-5;||64-4;3-5;0-7;4-5;37-5;64;25-5;8-1;33-1;34;64-1;36-4;64-4;"'>>'vlc-qt-interface.conf'
		echo 'size=7'>>'vlc-qt-interface.conf'
		echo ''>>'vlc-qt-interface.conf'
		echo '[FullScreen]'>>'vlc-qt-interface.conf'
		echo 'pos=@Point(0 0)'>>'vlc-qt-interface.conf'
		echo 'screen=@Rect(0 0 0 0)'>>'vlc-qt-interface.conf'
		echo 'wide=false'>>'vlc-qt-interface.conf'
		cd $HOME
		;;
	7)
		# Backup icons-old.svg
		sudo mv '/usr/share/inkscape/icons/icons-old.svg' '/usr/share/inkscape/icons/icons.svg' 
		sudo mv '/usr/share/inkscape/icons/icons.svg' '/usr/share/inkscape/icons/icons-old.svg' 
		# sudo cp '/usr/share/inkscape/icons/tango_icons.svg' '/usr/share/inkscape/icons/icons.svg' 
		wget https://raw.github.com/gnome-design-team/gnome-icons/master/inkscape-symbolic/inkscape-icons.svg
		sudo mv inkscape-icons.svg '/usr/share/inkscape/icons/icons.svg'
		;;
	8)
		WINE=${WINE:-wine}
		WINEPREFIX=${WINEPREFIX:-$HOME/.wine}
		DIALOG=whiptail

		if [ ! -x "`which "$WINE"`" ]
		then
		    echo "Wine was not found. Is it really installed? ($WINE)"
		    exit 1
		fi

		if [ ! -x "`which "$DIALOG"`" ]
		then
		    DIALOG=dialog
		fi

		TMPFILE=`mktemp` || exit 1

		$DIALOG --menu \
		    "Please select font smoothing mode for wine programs:" 13 51\
		    4\
		        1 "Smoothing disabled"\
		        2 "Grayscale smoothing"\
		        3 "Subpixel smoothing (ClearType) RGB"\
		        4 "Subpixel smoothing (ClearType) BGR" 2> $TMPFILE

		STATUS=$?
		ANSWER=`cat $TMPFILE`

		if [ $STATUS != 0 ]
		then 
		    rm -f $TMPFILE
		    exit 1
		fi

		MODE=0 # 0 = disabled; 2 = enabled
		TYPE=0 # 1 = regular;  2 = subpixel
		ORIENTATION=1 # 0 = BGR; 1 = RGB

		case $ANSWER in
		    1) # disable
		        ;;
		    2) # enable
		        MODE=2
		        TYPE=1
		        ;;
		    3) # enable cleartype rgb
		        MODE=2
		        TYPE=2
		        ;;
		    4) # enable cleartype bgr
		        MODE=2
		        TYPE=2
		        ORIENTATION=0
		        ;;
		    *)
		        rm -f $TMPFILE
		        echo Unexpected option: $ANSWER
		        exit 1
		        ;;
		esac

		echo "REGEDIT4

		[HKEY_CURRENT_USER\Control Panel\Desktop]
		\"FontSmoothing\"=\"$MODE\"
		\"FontSmoothingOrientation\"=dword:0000000$ORIENTATION
		\"FontSmoothingType\"=dword:0000000$TYPE
		\"FontSmoothingGamma\"=dword:00000578" > $TMPFILE

		echo -n "Updating configuration..."

		$WINE regedit $TMPFILE 2> /dev/null

		rm -f $TMPFILE

		echo Ok
		;;
# --------------------------------------------------	
	9)
		wget http://dl.dropbox.com/u/1564319/faience-extra.tar.gz
		tar -xzf faience-extra.tar.gz
		cd faience-extra
		sudo cp -r Faience/. /usr/share/icons/Faience/
		sudo cp -r Faenza/. /usr/share/icons/Faenza/
		gtk-update-icon-cache		
		cd $HOME
		rm -rf faience-extra faience-extra.tar.gz
		;;
	10)
		sudo sed -i 's/font-family: ubuntu, cantarell, sans-serif;/font-family: roboto, droid sans, ubuntu, cantarell, sans-serif;/g' '/usr/share/themes/Faience/gnome-shell/gnome-shell.css'
			;;
	11)
		# Apps Desktops
		wget http://dl.dropbox.com/u/1564319/apps-desktops.tar.gz
		tar -xzf apps-desktops.tar.gz
		cd apps-desktops
		cp -r gnome-applications.menu $HOME/.config/menus
		cp -r *.desktop $HOME/.local/share/applications
		gtk-update-icon-cache
		cd $HOME
		rm -rf apps-desktops apps-desktops.tar.gz
		# Directories
		wget http://dl.dropbox.com/u/1564319/desktop-directories.tar.gz
		tar -xzf desktop-directories.tar.gz
		rm -rf $HOME/.local/share/desktop-directories
		mv desktop-directories $HOME/.local/share/desktop-directories
		rm -rf desktop-directories desktop-directories.tar.gz
		;;
	12)
		wget http://dl.dropbox.com/u/1564319/nautilus-scripts.tar.gz
		tar -xzf nautilus-scripts.tar.gz
		rsync -a nautilus-scripts/ $HOME/.local/share/nautilus/scripts/
		rm -rf nautilus-scripts nautilus-scripts.tar.gz
		nautilus -q
		;;
	13)
		gsettings set org.gnome.shell app-folder-categories "['Accessories', 'Games', 'Graphics', 'Internet', 'Multimedia', 'Office', 'System', 'Utilities']"
		;;
	14)
		dconf write /org/gnome/shell/overrides/button-layout "'close:'" && dconf write /org/gnome/desktop/interface/font-name "'Roboto 10'" && dconf write /org/gnome/desktop/interface/monospace-font-name "'Droid Sans Mono 10'" && dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Roboto Bold 10'" && dconf write /org/gnome/desktop/interface/gtk-theme "'Faience'" && dconf write /org/gnome/desktop/wm/preferences/theme "'Faience'" && dconf write /org/gnome/desktop/interface/icon-theme "'Faience'"
		;;
	15)
		dconf write /org/gnome/shell/overrides/button-layout "':close'" && dconf write /org/gnome/desktop/interface/font-name "'cantarell 10'" && dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Cantarell Bold 10'" && dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'" && dconf write /org/gnome/desktop/wm/preferences/theme "'Adwaita'" && dconf write /org/gnome/desktop/interface/icon-theme "'gnome'"
		;;
	16)
		dconf write /org/gnome/shell/overrides/button-layout "'close,minimize,maximize:'"
		;;


	*) 
		echo "Choose a valid option"
		exit 1
		;;
esac
