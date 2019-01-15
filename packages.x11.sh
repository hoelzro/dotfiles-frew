#!/bin/sh

sudo snap install keepassxc

exec apt-get --no-install-recommends    \
                             install -y \
   rofi                                 \
   feh                                  \
   firefox                              \
   fonts-lohit-knda                     \
   gnome-system-monitor                 \
   gnome-power-manager                  \
   gtk2-engines                         \
   i3lock                               \
   libghc-xmonad-contrib-dev            \
   libghc-taffybar-dev                  \
   libfile-readbackward-perl            \
   libio-all-perl                       \
   pavucontrol                          \
   pcmanfm                              \
   flameshot                            \
   suckless-tools                       \
   taffybar                             \
   terminator                           \
   ttf-ancient-fonts                    \
   vim-gtk                              \
   vlc                                  \
   xautolock                            \
   xbacklight                           \
   xcalib                               \
   xdotool                              \
   xfonts-terminus                      \
   xfonts-terminus-oblique              \
   xsel                                 \
   xinput                               \
   xmonad
