#!/bin/sh

set -e

./packages.rm.sh
./packages.minimal.sh
./packages.x11.sh
./packages.perf.sh

echo "postfix postfix/mailname string $(hostname)" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Local only'" | debconf-set-selections

exec apt-get --no-install-recommends    \
                             install -y \
   asciidoc                             \
   at                                   \
   autoconf                             \
   automake                             \
   build-essential                      \
   dictd                                \
   dict                                 \
   dict-gcide                           \
   gnupg-agent                          \
   inotify-tools                        \
   libcapture-tiny-perl                 \
   libcurl4-openssl-dev                 \
   libdir-self-perl                     \
   libemail-address-perl                \
   libemail-date-perl                   \
   libidn11-dev                         \
   libgmime-2.6-dev                     \
   libgpgme11-dev                       \
   libncursesw5-dev                     \
   libnotmuch-dev                       \
   libpam0g-dev                         \
   libpam-u2f                           \
   pamu2fcfg                            \
   libtalloc-dev                        \
   libtokyocabinet-dev                  \
   libtool                              \
   libxapian-dev                        \
   lua-filesystem                       \
   lynx                                 \
   manpages-dev                         \
   mitmproxy                            \
   notmuch                              \
   notmuch-mutt                         \
   openvpn                              \
   postfix                              \
   uuid-runtime                         \
   xmlto                                \
   xsltproc
