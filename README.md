A basic LAMP box configured for vanilla WordPress. Modelled after the basic evirnment at WP-Engine.

Much of this was built from my [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project. The goal is to create a base box that can be spun up quickly from scratch and provide a stable, default WordPress environment for quick development. The environment was chosen to match WP-Engine's platform as closely as possible.

The primary purpose of this project is to frontload configuration and provisioning as much as possible so a baseline box can be spun up quickly. 



[Ubuntu's Cloud Images](http://cloud-images.ubuntu.com) were the base for this box. I built from the [Ubuntu Server 14.04 LTS (Trusty Tahr) daily build](http://cloud-images.ubuntu.com/vagrant/trusty/current/) because there's just no reason for me to be compiliung this from scratch. I used the 32-bit version since this is going to be emulated with limited memory and nothing in WordPress is especially computationally taxing. There's just no reason to bother with 64-bit addressing for this. 

This repo is two things. First, it's a VagrantFile which configures the base Ubuntu 14.04 box with an optimal WorPress distribution. Next, it's a Packer workflow which freezes that box so it can be used with other Vagrant workflows. 

Packer runs the provisioners locally, which means that Ansible needs to  jump through some silly hoops before it can run. Indivually listing every role in the packer template is really tedious and easy to forget about until the build fails. 





### Acknowledgements

I didn't figure this all out on my own. These were hugely helpful:

* Jeff Geerling has posted a ton of examples to support his book, [... ...](#). This also drew heavily from his [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404)

HashiCorp's [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)  was very instructive. 

