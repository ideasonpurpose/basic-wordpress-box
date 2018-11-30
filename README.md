_This project just builds a base box. Our complete WordPress Vagrant environment is over here: [ideasonpurpose/basic-wordpress-vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant)_

# Basic WordPress Box

##### Version 1.6.0

This project's primary goal is to create an excepionally fast-to-spin-up Vagrant box for local WordPress development. To do achieve this, we've front-loaded as much boilerplate configuration as possible onto a small and clean base box. Server requirements for WordPress are very basic requirements and rarely change from site to site. Baking that boilerplate into the box makes more sense than compiling everything each time we spin up a new instance.

The box is a basic LAMP stack configured to run vanilla WordPress, modeled after managed WordPress hosting platforms like WP Engine or Flywheel. The generated Vagrant box is available on Hashicorp’s Vagrant Cloud at [app.vagrantup.com/ideasonpurpose](https://app.vagrantup.com/ideasonpurpose)

[Basic WordPress Vagrant](https://github.com/ideasonpurpose/basic-wordpress-vagrant) is a complete local WordPress development environment based on this box.

## Install and Build

For box development, please use the latest [Ansible development checkout][ansible-dev].

1.  Clone this repo `git clone https://github.com/ideasonpurpose/basic-wordpress-box`
2.  `cd basic-wordpress-box`
3.  Run `npm build` (or just `./build.sh`)
4.  Upload the output box `virtualbox-basic-wp.box` to [Hashicorp Vagrant Cloud](https://app.vagrantup.com/ideasonpurpose/boxes/basic-wp)

## More Information

The base box builds from the [Ubuntu Cloud Images](http://cloud-images.ubuntu.com) official Vagrant [Ubuntu Server 14.04 LTS (Trusty Tahr)](http://cloud-images.ubuntu.com/vagrant/trusty/current/) 32-bit image.

The initial build uses Vagrant and Ansible to provision an optimal WordPress distribution. Then a simple [Packer][] workflow freezes that box so it can be uploaded to [Vagrant Cloud][] and used for individual WordPress development. Builds take 20-25 minutes to complete.

## What’s installed

Mostly the bare minimum. No security considerations, just what’s needed to get WordPress running, some expected extensions and a few helpful extras:

* Apache 2.4.x
* PHP 7.2.x
  * All Errors visible
  * 30 minute max_execution_time
  * 100 MB max_upload_filesize
* MySQL 5.6.x
  * Query Cache disabled
* Git (latest)
* Ansible (for local provisioning on the VM)
* [Composer][]
* Debugging tools: [Kint][], [xDebug][] and [Tideways][]/[XHProf][]
* [wp-cli][] (latest)
* PHP-GD and PHP-Imagick ([GD][] and [ImageMagick][])

Man pages, locales and docs have all been stripped out to help shrink the size of the generated box.

## What’s Different?

Not much, the main difference from a production environment is that all PHP debugging and errors are enabled and visible. Even [Tideways][]/[XHProf](http://php.net/xhprof) is installed. **Errors should never pass silently. [Unless explicitly silenced.](https://www.python.org/dev/peps/pep-0020/)**

Server logs are configured to write to

## Local Testing

The build script will add the newly generated box to vagrant with the name `basic-wp`. To test locally, just reference the box in a Vagrantfile or run this:

    $ vagrant init basic-wp

For existing Vagrantfiles, remove or comment out the `box_version` and switch the box to `basic-wp`:

```
Vagrant.configure(2) do |config|
  # config.vm.box = "ideasonpurpose/basic-wp"
  # config.vm.box_version = ">= 1.2.1"
  config.vm.box = "basic-wp"
```

## Development Requirements

To generate updated versions of the basic-wp box, the following tools should be installed:

* [VirtualBox][]
* [Vagrant][]
* [Ansible][]
* [Packer][]

VirtualBox and Vagrant are downloads, Ansible and Packer are command-line tools and can be installed with a package manager. On a Mac, use homebrew: `brew install ansible packer`

## Acknowledgements

While much of this was built from my earlier [vagrant-dev-box](https://github.com/joemaller/vagrant-dev-box) project, the following projects were extremely helpful:

* Jeff Geerling's book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops), especially his [Ubuntu 14.04 Packer example](https://github.com/geerlingguy/packer-ubuntu-1404)
* The [Roots project](http://roots.io)
* HashiCorp’s [atlas-packer-vagrant-tutorial](https://github.com/hashicorp/atlas-packer-vagrant-tutorial)
* Ubuntu Wiki's [Reducing Ubuntu's Disk Footprint](https://wiki.ubuntu.com/ReducingDiskFootprint) helped shrink the output image

## About

[![iop_logo](https://avatars1.githubusercontent.com/u/2059022?s=100&v=4)][iop]

This project is sponsored by and used in production at [Ideas On Purpose][iop]

[iop]: http://ideasonpurpose.com
[gd]: http://libgd.github.io/
[imagemagick]: http://www.imagemagick.org/
[packer]: https://www.packer.io
[vagrant cloud]: https://app.vagrantup.com/ideasonpurpose
[vagrant]: https://www.vagrantup.com/
[virtualbox]: https://www.virtualbox.org/
[ansible]: http://docs.ansible.com/
[ansible-dev]: http://docs.ansible.com/ansible/intro_installation.html#running-from-source
[kint]: http://raveren.github.io/kint/
[xdebug]: https://xdebug.org/docs/
[xhprof]: http://php.net/xhprof
[tideways]: https://tideways.io/profiler/xhprof-for-php7-php5.6
[composer]: https://getcomposer.org/
[wp-cli]: http://wp-cli.org/
