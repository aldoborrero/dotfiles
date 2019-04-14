#!/usr/bin/env bash

# install deps
sudo apt update
sudo apt install -y \
  libxcb1-dev \
  libxcb-keysyms1-dev \
  libpango1.0-dev \
  libxcb-util0-dev \
  libxcb-icccm4-dev \
  libyajl-dev \
  libstartup-notification0-dev \
  libxcb-randr0-dev \
  libev-dev \
  libxcb-cursor-dev \
  libxcb-xinerama0-dev \
  libxcb-xkb-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  autoconf \
  xutils-dev \
  dh-autoreconf \
  unzip \
  nitrogen \
  rofi \
  binutils \
  gcc \
  make \
  pkg-config \
  fakeroot \
  cmake \
  xcb-proto \
  libxcb-ewmh-dev \
  wireless-tools \
  libiw-dev \
  libasound2-dev \
  libpulse-dev \
  libcurl4-openssl-dev \
  libmpdclient-dev \
  fonts-firacode \
  git

# use tmp
cd /tmp

# clone required libs
git clone --recursive https://github.com/Airblader/xcb-util-xrm.git
git clone https://www.github.com/Airblader/i3 i3-gaps
git clone https://github.com/jaagr/polybar

# install xcb-util-xrm
(cd xcb-util-xrm/ && ./autogen.sh && make && sudo make install && sudo ldconfig && sudo ldconfig -p)
rm -rf xcb-util-xrm

# install i3-gaps
(cd i3-gaps && autoreconf --force --install && rm -Rf build/ && mkdir build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install)
rm -fr i3-gaps

# install source code pro font
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp

# install font awesome
(mkdir fonts && cd fonts && wget https://use.fontawesome.com/releases/v5.0.13/fontawesome-free-5.0.13.zip && unzip fontawesome-free-5.0.13.zip && cd fontawesome-free-5.0.13 && sudo cp use-on-desktop/* /usr/share/fonts && sudo fc-cache -f -v)
rm -fr fonts

# install polybar
(cd polybar && USE_GCC=ON ENABLE_I3=ON ENABLE_ALSA=ON ENABLE_PULSEAUDIO=ON ENABLE_NETWORK=ON ENABLE_MPD=ON ENABLE_CURL=ON ENABLE_IPC_MSG=ON INSTALL=OFF INSTALL_CONF=OFF ./build.sh -f && cd build && sudo make install && make userconfig)
rm -fr polybar
