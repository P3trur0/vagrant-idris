#!/bin/bash -e
#set -e -x

# loading common utilities
source /home/vagrant/utils.sh

package_install() {
  if [ $# -eq 0 ]; then
    msg "No new packages needed for install..."
    return
  fi
  msg "Updating package list for apt-get..."
  apt-get update || true
  msg "Installing system packages [$*] using apt-get..."
  apt-get install -y $*
}

provision() {
  local GENERAL_UTILITIES="git vim nano wget curl unzip gcc"
  local CABAL_DEPENDENCIES="zlib1g zlib1g-dev zlibc pkg-config libgc-dev build-essential libtinfo-dev libz-dev libgmp-dev libgmpxx4ldbl gmp-doc libgmp10-doc libmpfr-dev"
  local PKGS_TO_INSTALL=$(check_exist $GENERAL_UTILITIES $CABAL_DEPENDENCIES)
  if [ ! -z "${PKGS_TO_INSTALL}" ]; then
    package_install ${PKGS_TO_INSTALL}
  fi
}

main() {
  provision
  exit 0
}

main
exit_err "Ouch... provision failed!"
