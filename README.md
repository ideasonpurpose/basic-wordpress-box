*This project just builds a base box, our WordPress Vagrant environment is over here: [ideasonpurpose/basic-wordpress-vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant)*

# Basic WordPress Box

This project builds a basic LAMP box configured for vanilla WordPress installations and modeled after managed WordPress hosting platforms like WP Engine or Flywheel. The output Vagrant box is available on Hashicorp's Atlas at [atlas.hashicorp.com/ideasonpurpose](https://atlas.hashicorp.com/ideasonpurpose)

The primary purpose of this project is to front-load as much boilerplate configuration as possible, producing a clean base box with a stable, default WordPress environment which Vagrant can quickly spin up for local development.

For a complete, fast-to-spin-up local WordPress development environment based on this box, take a look at [Basic WordPress Vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant).

## Install and Build

1. Clone this repo `git clone https://github.com/ideasonpurpose/basic-wordpress-box`
2. `cd basic-wordpress-box`
3. Run `./build.sh`
4. Upload the output box `basic-wp.ovf` to [Hashicorp Atlas](https://atlas.hashicorp.com/help/vagrant/boxes/create)


## More Information
The base box is built on top of [Ubuntu Cloud Images'](http://cloud-images.ubuntu.com) official Vagrant [Ubuntu Server 14.04 LTS (Trusty Tahr)](http://cloud-images.ubuntu.com/vagrant/trusty/current/) 32-bit iso. 

The initial build uses Vagrant and Ansible to provision an optimal WordPress distribution. Next, a simple Packer workflow freezes that box so it can be uploaded to Atlas and used for individual WordPress development.

## What's installed
The bare minimum. No security considerations, just what's needed to get WordPress running:

* MySQL 5.5.44-0ubuntu0.14.04.1
* PHP 5.5.28
* Apache 2.4.16

Man pages, locales and docs have all be stripped out

## What's Different?

For starters, all PHP debugging and errors are enabled and visible. Even [XHProf](http://php.net/xhprof) is installed. Errors should never pass silently.
(Unless explicitly silenced.)[*](https://www.python.org/dev/peps/pep-0020/) 

### Local Testing
The build script will add the newly generated box to vagrant with the name `basic-wp`. To test locally, just reference the box in a Vagrant file or run this: 

    $ vagrant init basic-wp

### Acknowledgements

While much of this was built from my [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project, but these projects were extremely helpful:

* Jeff Geerling has posted a ton of examples to support his book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops). His [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404) was a great place to start from.
* The awesome [Roots project](http://roots.io) continues to inspire.
* HashiCorp's [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)  was also very instructive. 

## About

[![iop_logo](https://cloud.githubusercontent.com/assets/8320/9443542/944a8bce-4a4f-11e5-9d2f-54999b1687d5.png)][iop]  
This project is sponsored by and used in production at [Ideas On Purpose][iop]

[iop]: http://ideasonpurpose.com
