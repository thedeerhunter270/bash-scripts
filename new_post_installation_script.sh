#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	#echo "Updating and Upgrading"
	#apt-get update && sudo apt-get upgrade -y
	#apt install net-tools


	apt-get install dialog -y
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 75 16)
	options=(1 "Update and Upgrade" off  # any option can be set to default to "on"
             2 "SMPlayer" off    
	         3 "GIMP" off
	         4 "Audacious" off
	         5 "HTOP" off
	         6 "Youtube-dl" off
	         7 "Brave" off
	         8 "Veracrypt" off
	         9 "Ubuntu Restricted Extras" off
	         10 "Gnome Tweak Tool" off
	         11 "VLC" off
	         12 "Bashtop Snap" off
	         13 "Net Tools" off
             14 "Printer Driver" off)
	         
	         
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
		    
		    1)
	            		#Update and Upgrade
				echo "Updating and Upgrading"
                apt-get update && sudo apt-get upgrade -y
                            ;;		    
		    
	       	2)
	            		#Install SMPlayer
				echo "Installing SMPlayer"
				add-apt-repository ppa:rvm/smplayer -y
				apt update
				apt-get install smplayer smplayer-themes smplayer-skins -y
				;;
			3)
			    	#Install GIMP
				echo "Installing GIMP"
				apt install gimp -y
	            ;;
    		4)	
					#Install Audacious
				echo "Installing Audacious"
				apt install audacious -y
				;;
				
			5)
                    #Install htop
				echo "Installing htop"
				apt install htop -y
				;;

			6)
                    #Install Youtube-dl
				echo "Installing Youtube-dl"
				apt install python -y
				wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
                chmod a+rx /usr/local/bin/youtube-dl
				;;
				
			7)
                    #Install Brave
                echo "Installing Brave"    
				apt install apt-transport-https curl gnupg
                curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
                echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                apt update
                apt install brave-browser -y
                ;;
	
			8)
                    #Install Veracrypt
                echo "Installing Veracrypt"    
				add-apt-repository ppa:unit193/encryption -y
                sudo apt update -y
                apt install veracrypt -y
				;;
				
			9)
				#Ubuntu Restricted Extras
				echo "Installing Ubuntu Restricted Extras"
				apt install ubuntu-restricted-extras -y
				;;
            10)
				#Ubuntu Gnome Tweak Tool
				echo "Installing Gnome Tweak Tool"
				apt install gnome-tweak-tool -y
				;;
			11)
                    #Install VLC
				echo "Installing VLC"
				apt install vlc -y
				;;
            12)
                    #Install Bashtop
				echo "Installing Bashtop"
				snap install bashtop 
				;;
			13)
                    #Install Net Tools
				echo "Installing Net Tools"
                apt install net-tools				
                ;;	
            14)
                    #Install Printer Driver
				echo "Installing Printer Driver"
                wget http://download.ebz.epson.net/dsc/op/stable/debian/dists/lsb3.2/main/binary-amd64/epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb
                dpkg -i epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb
                ;;
	    esac
	done
fi
