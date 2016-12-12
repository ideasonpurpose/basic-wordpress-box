*This project just builds a base box, our WordPress Vagrant environment is over here: [ideasonpurpose/basic-wordpress-vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant)*

# Basic WordPress Box
##### Version 1.2.0

This project builds a basic LAMP box configured for vanilla WordPress installations and modeled after managed WordPress hosting platforms like WP Engine or Flywheel. The generated Vagrant box is available on Hashicorp’s Atlas at [atlas.hashicorp.com/ideasonpurpose](https://atlas.hashicorp.com/ideasonpurpose)

The primary design goal of this project is to front-load as much boilerplate configuration as possible, producing a clean base box with a stable, default WordPress environment which can be quickly brought up and torn down for local maintenance and development.

[Basic WordPress Vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant) is a complete, fast-to-spin-up local WordPress development environment based on this box.

## Install and Build
Please use the latest [Ansible development checkout][ansible-dev] to build boxes.

1. Clone this repo `git clone https://github.com/ideasonpurpose/basic-wordpress-box`
2. `cd basic-wordpress-box`
3. Run `./build.sh`
4. Upload the output box `virtualbox-basic-wp.box` to [Hashicorp Atlas](https://atlas.hashicorp.com/help/vagrant/boxes/create)


## More Information
The base box is built on top of [Ubuntu Cloud Images’](http://cloud-images.ubuntu.com) official Vagrant [Ubuntu Server 14.04 LTS (Trusty Tahr)](http://cloud-images.ubuntu.com/vagrant/trusty/current/) 32-bit image.

The initial build uses Vagrant and Ansible to provision an optimal WordPress distribution. Next, a simple [Packer][] workflow freezes that box so it can be uploaded to Atlas and used for individual WordPress development.

## What’s installed
The bare minimum. No security considerations, just what’s needed to get WordPress running and a few helpful extras:

* Apache 2.4.x
* PHP 7.0.x
  * All Errors visible
  * 30 minute max_execution_time
  * 100 MB max_upload_filesize
* MySQL 5.6.x
  * Query Cache disabled
* Debugging tools: [Kint][], [xDebug][] and [Tideways][]/[XHProf][]
* [wp-cli](http://wp-cli.org/)
* PHP-GD and PHP-Imagick ([GD][] and [ImageMagick][])

Man pages, locales and docs have all been stripped out to help shrink the size of the generated box. 

## What’s Different?

For starters, all PHP debugging and errors are enabled and visible. Even [XHProf](http://php.net/xhprof) is installed. Errors should never pass silently. ([Unless explicitly silenced.](https://www.python.org/dev/peps/pep-0020/))

[WP-CLI](http://wp-cli.org/) is also available. It's proven useful for tweaking settings and speeding development.

## Local Testing
The build script will add the newly generated box to vagrant with the name `basic-wp`. To test locally, just reference the box in a Vagrantfile or run this:

    $ vagrant init basic-wp

For existing Vagrantfiles, remove or comment out the `box_version` and switch the box to `basic-wp`:

```
Vagrant.configure(2) do |config|
  # config.vm.box = "ideasonpurpose/basic-wp"
  # config.vm.box_version = ">= 0.0.9"
  config.vm.box = "basic-wp"
```

## Development Requirements
To generate updated versions of the basic-wp box, the following tools should be installed: 

* [VirtualBox][]
* [Vagrant][]
* [Ansible][] (v2 or greater, or [run from source][ansible-dev])
* [Packer][]

VirtualBox and Vagrant are downloads, Ansible and Packer are command-line tools and can be installed with a package manager. On a Mac, use homebrew: `brew install ansible packer`

## Acknowledgements

While much of this was built from my earlier [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project, the following projects were extremely helpful:

* Jeff Geerling has posted a ton of examples to support his book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops). His [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404) was a great place to start.
* The awesome [Roots project](http://roots.io) continues to inspire.
* HashiCorp’s [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)  was also very instructive.
* The Ubuntu Wiki page on [Reducing Ubuntu's Disk Footprint](https://wiki.ubuntu.com/ReducingDiskFootprint) was a big help in shrinking the output image.

## About

[![iop_logo](https://cloud.githubusercontent.com/assets/8320/9443542/944a8bce-4a4f-11e5-9d2f-54999b1687d5.png)][iop]  
This project is sponsored by and used in production at [Ideas On Purpose][iop]

[iop]: http://ideasonpurpose.com
[gd]: http://libgd.github.io/
[imagemagick]: http://www.imagemagick.org/
[packer]: https://www.packer.io
[vagrant]: https://www.vagrantup.com/
[virtualbox]: https://www.virtualbox.org/
[ansible]: http://docs.ansible.com/
[ansible-dev]: http://docs.ansible.com/ansible/intro_installation.html#running-from-source
[kint]: http://raveren.github.io/kint/
[xdebug]: https://xdebug.org/docs/
[xhprof]: http://php.net/xhprof
[tideways]: https://tideways.io/profiler/xhprof-for-php7-php5.6
