#!/bin/bash

# loading common utilities
source /home/vagrant/utils.sh

liquid_prompt() {
    if [ ! -f ~/runonce ] #here the check is on the home directory
    then
		msg ':::: setting up liquidprompt to vagrant machine ::::'
		msg "Installing liquidprompt..."
		cd ~
		git clone https://github.com/nojhan/liquidprompt.git
    echo "Setting up liquidprompt to the .bashrc folder"
		echo '# Only load Liquid Prompt in interactive shells, not from a script or from scp'  >> ~/.bashrc
		echo '[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt' >> ~/.bashrc
		touch ~/runonce	#avoid script to be provisioned more than once
	else
		msg "::: liquidprompt already provisioned :::"
	fi
}

idris() {
	sudo add-apt-repository ppa:hvr/ghc --yes
  sudo apt-get update
  sudo apt-get install ghc-7.10.3 cabal-install-2.0 --yes
  msg "GHC and Cabal installed"
 
  export PATH=/opt/ghc/7.10.3/bin/:/opt/cabal/2.0/bin/:$PATH

  msg "Setting environment variables after installation..."

	msg "Installing idris ..."
  cabal update
	cabal install idris
	msg "Idris installed!"

  echo 'export PATH=/opt/ghc/7.10.3/bin/:/opt/cabal/2.0/bin/:$HOME/.cabal/bin/:$PATH' >> /home/vagrant/.bashrc
  source /home/vagrant/.bashrc

  msg "GHC, Cabal and Idris set to environment path ==> $PATH"
}


main() {
	idris
  liquid_prompt
  exit 0
}

main
exit_err "Ouch... LiquidPrompt provision failed!"
