#!/bin/bash
#
#Install The X WINDOWS of the archlinux
#
#The X windows is xfce4&lxdm
#
#




if [ $USER != "root" ]; then
	echo  "please run The Shell with root or sudo."
fi

echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------Install The X Windows of The archlinux.---------------+"
echo "+-----The X Windows is xfce4.--------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "                                                                          "
echo "                                                                          "
echo "                                                                          "


echo "+------------------------------------------------------------------------+"
echo "+-----------------Update The  Source of The Archlinux .------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -Syu
pacman -Syy

echo "+------------------------------------------------------------------------+"
echo "+--------Install The X Windows Server and The  Video Driver.-------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"

pacman -S xorg-server xf86-video-*

pacman -S mesa xf86-video-intel

echo "+------------------------------------------------------------------------+"
echo "+---------------------------Install The Audio Driver .-------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S alsa-utils

echo "+------------------------------------------------------------------------+"
echo "+---------------------------Install The Startx .-------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S xorg-xinit


echo "+------------------------------------------------------------------------+"
echo "+---------------------------Install The xfce4 .--------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"

pacman -S xfce4 xfce4-goodies

echo "+------------------------------------------------------------------------+"
echo "+---------------------------Install The lxdm.----------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S lxdm
systemctl enable lxdm.service

echo "+------------------------------------------------------------------------+"
echo "+-----------------Update The  Source of The Archlinux .------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"

echo -e "[archlinuxcn]\nSigLevel = Optional TrustedOnly\nServer = http://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
pacman -Syy 

echo "+------------------------------------------------------------------------+"
echo "+---------------------------Install The yaourt.--------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S yaourt


echo "+------------------------------------------------------------------------+"
echo "+----------Install  input method of The fcitx .--------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S fcitx 
pacman -S fcitx-sunpinyin 
pacman -S fcitx-im 
pacman -S fcitx-configtool


cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo -e "export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS="@im=fcitx" " >> ~/.xprofile
echo -e "export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS="@im=fcitx" " >> ~/.xinitrc

echo "+------------------------------------------------------------------------+"
echo "+--------- Install  The font of noto-fonts-cjk .-------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S noto-fonts-cjk



echo "+------------------------------------------------------------------------+"
echo "+------------------ Install  The KMIX Sound Mixer. ----------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -S kmix

# echo "+------------------------------------------------------------------------+"
# echo "+--------------- Install  The Chromium .---------------------------------+"
# echo "+------------------------------------------------------------------------+"
# echo "+------------------------------------------------------------------------+"
# pacman -S chromium


# echo "+------------------------------------------------------------------------+"
# echo "+--------------- Install  The flashplay of chromium .--------------------+"
# echo "+------------------------------------------------------------------------+"
# echo "+------------------------------------------------------------------------+"
# yaourt -S chromium-pepper-flash


echo "+------------------------------------------------------------------------+"
echo "+----------------Install  The NetworkManager .---------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
pacman -Syu networkmanager
pacman -S network-manager-applet
pacman -S dhclient
pacman -S gnome-keyring
pacman -S gnome-icon-theme
#If The X Windows is xfce4,be to install the xfce4-notifyd #
pacman -S xfce4-notifyd

pacman -S net-tools

systemctl enable NetworkManager
systemctl start NetworkManager

# The X Windows can use the lxqt&sddm too.#
# pacman -S lxqt 
# pacman -S sddm

echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------Install success，Reboot the System.-------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+--------------     -----------------  ------    ------------------------+"
echo "+----------  ------  ----------------  ----  ----------------------------+"
echo "+--------  ---------  ---------------  ---  -----------------------------+"
echo "+-------  -----------  --------------  -  -------------------------------+"
echo "+-------  ------------  -------------   ---------------------------------+"
echo "+--------  -----------  -------------  -  -------------------------------+"
echo "+---------  ----------  -------------  --  ------------------------------+"
echo "+-----------  -------  --------------  ---  -----------------------------+"
echo "+-------------  ----  ---------------  ----  ----------------------------+"
echo "+---------------   ------------------  -----    -------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"
echo "+------------------------------------------------------------------------+"

while true; do
        read -p "Are you Reboot The System[Y/n]:" YN
        if [ -n "$YN" ];then
                if [  $YN == "Y" -o   $YN == "y" -o $YN == "N" -o $YN == "n" ]; then
                        break;
                else
                echo "Please input the Y or n ."
                continue;
                fi
        else
                echo "Please input the Y or n ."
                continue;
        fi
done
if [ $YN == "y" -o $YN == "Y" ]; then
	echo "+---------------Install success，Reboot the System.-----------------------+"
	reboot 
else
	echo "+------------------------------------------------------------------------+"
	echo "+------------Install success，no to Reboot the System.-------------------+"
	echo "+------If go to the X window,please input startxfce4.--------------------+"
	echo "+------------------------------------------------------------------------+"
	echo "+------------------------------------------------------------------------+"
fi
