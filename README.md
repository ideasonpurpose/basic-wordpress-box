A basic LAMP box configured for vanilla WordPress. Modeled after the basic evirnment at WP-Engine.

Much of this was built from my [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project. The goal is to create a base box that can be spun up quickly from scratch and provide a stable, default WordPress environment for quick development. The environment was chosen to match WP-Engine's platform as closely as possible.

The primary purpose of this project is to frontload configuration and provisioning as much as possible so a baseline box can be spun up quickly. 



[Ubuntu's Cloud Images](http://cloud-images.ubuntu.com) were the base for this box. I built from the [Ubuntu Server 14.04 LTS (Trusty Tahr) daily build](http://cloud-images.ubuntu.com/vagrant/trusty/current/) because there's just no reason for me to be compiling this from scratch. I used the 32-bit version since this is going to be emulated with limited memory and nothing in WordPress is especially computationally taxing. There's just no reason to bother with 64-bit addressing for this. 

This Vagrant box is just a zip file, so I extracted it to get to the OVF inside. The Ubuntu Cloud image OVF is version 2
(not sure what's going to happen since the OVF is clearly a wrapper for the VMDK larger VMDK) (Is it OVF v1? If so, this will need to be roundtripped out of Vagrant to get a v2 OVF.)


This repo is two things. First, it's a VagrantFile which configures the base Ubuntu 14.04 box with an optimal WorPress distribution. Next, it's a Packer workflow which freezes that box so it can be used with other Vagrant workflows. 

Packer is capable of provisioning, but it's kind of yucky. By building out hte initia. box with Ansible as any old Vagrant box, 

Packer runs the provisioners locally, which requires Ansible to jump through some annoying hoops before it can run. Individually listing every role in the packer template is really tedious and easy to forget about until the build fails. 

# TODO:

* Remove VBoxGuestAdditions.iso and run a cleanup to zero space and reduce box size
* set hostname
* Set a default wp-config.php file with overrides for `WP_HOME` and `WP_SITEURL` so pages won't redirect back to the real site. 
* Autoload wp-content/mysql.sql if it exists. 



### Open Issues
WP-Engine installs a slightly out-of-date copy of the [Force Strong Passwords]() plugin to `mu-plugins`. I'm not sure what to do about this. Installing the plugin normally on top of the mu-plugins copy throws a fatal error if activated. For now, the plugin is still in mu-plugins since WP-Engine will prevent deploying internally. 

### Acknowledgements

I didn't figure this all out on my own. These were hugely helpful:

* Jeff Geerling has posted a ton of examples to support his book, [... ...](#). This also drew heavily from his [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404)

HashiCorp's [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)  was very instructive. 

