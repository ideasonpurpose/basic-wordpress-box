
# Basic WordPress Box

This project builds a basic LAMP box modeled after WP-Engine's platform and configured for vanilla WordPress installations. The output box is available on Hashicorp's Atlas at [atlas.hashicorp.com/ideasonpurpose](https://atlas.hashicorp.com/ideasonpurpose)

The primary purpose of this project is to front-load as much boilerplate configuration as possible, producing a clean base box which can be spun up quickly to provide a stable, default WordPress environment. 


## Install and Build

1. Clone this repo `git clone http://github.com/joemaller/.................`
2. `cd basic-wordpress-box`
3. Run `./build.sh`
4. Upload the box to [Hashicorp Atlas](https://atlas.hashicorp.com/help/vagrant/boxes/create)


## More Information
The base box is built on top of [Ubuntu Cloud Images'](http://cloud-images.ubuntu.com) official Vagrant [Ubuntu Server 14.04 LTS (Trusty Tahr)](http://cloud-images.ubuntu.com/vagrant/trusty/current/) 32-bit iso. 


This repo is two things. The initial box is build using Vagrant and an Ansible playbook to provision an optimal WordPress distribution. Next, it's a Packer workflow which freezes that box so it can be uploaded to Atlas and used for individual WordPress development.

## What's installed
The bare minimum. No security considerations, just what's needed to get WordPress running:

* MySQL 5.5.44-0ubuntu0.14.04.1
* PHP 5.5.28
* Apache 2.4.16

### Acknowledgements

While much of this was built from my [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project, I could never have figured this all out on my own. These projects were extremely helpful:

* Jeff Geerling has posted a ton of examples to support his book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops). His [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404) was a great place to start from.
* The awesome [Roots project](http://roots.io) continues to inspire.
* HashiCorp's [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)  was also very instructive. 


---

##TODO: 
add UseDNS no to /etc/ssh/ssh_config
http://manpages.ubuntu.com/manpages/jaunty/en/man5/sshd_config.5.html
http://superuser.com/a/62437/193584