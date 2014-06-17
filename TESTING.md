Testing
=======

Bundler
-------

You need to install bundler before running the tests:

	gem install bundler

Afterwards, running the installer will install all dependencies defined in the Gemfile:

	bundle install

Testing
-------
The Rakefile contains a number of tasks that can be run individually or in groups. The default "rake" command will perform style
checks with Rubocop and Foodcritic, ChefSpec with rspec, and integration with Test Kitchen using the Vagrant driver. 

	$ rake -T
	rake                      # Run all style checks, unit tests and integration tests
	rake style                # Run all style checks
	rake style:chef           # Lint Chef cookbooks
	rake style:ruby           # Run Ruby style checks
	rake spec                 # Run unit tests
	rake integration:vagrant  # Run Test Kitchen with Vagrant

