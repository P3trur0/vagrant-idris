# Vagrant template for Idris machine

## Purpose

Minimal Vagrant VM config for Idris development.

It loads a Virtualbox VM of Ubuntu 16.04 LTS and provisions with the following software:

* `ghc`
* `cabal`
* `idris`

Also, as utility, it provisions a shell with `liquidprompt`.

## Usage

Clone this repo in whatever directory you prefer, and from that directory:

```sh
# Provisions the VM
vagrant up

# SSH into the VM
vagrant ssh
```

Once you've done with your activities you can:

```sh
# Shut the VM down
vagrant halt

# Remove the VM completely.
vagrant destroy
```

## Compatibility

This VM has been tested using Vagrant 2.0.0 and Virtualbox 5.1.28 r117968 from a Windows 10 host.

Please let me know if it works for you on other platforms!

## Credits

In scaffolding this VM I took inspiration from `vagrant-haskell-minimal` by `jship`. It is available [here](https://github.com/jship/vagrant-haskell-minimal).

## Disclaimer

This repo is a quick and dirty configuration, please fill free to improve it according to your needs.  