#!/bin/bash
## Script to automate the configuration of mp4_automator into the LinuxServer.io DockerBase Image of Radarr.
## Installs the dependencies (but not the script itself) for sickbeard_mp4_automator (https://github.com/mdhiggins/sickbeard_mp4_automator) into the container.

# Add repositories and update
apt-get install -qy software-properties-common python-software-properties
add-apt-repository -y ppa:mc3man/xerus-media

apt-get -q update
apt-get -q update --fix-missing
apt-get -qy dist-upgrade

# Install dependencies
apt-get install -qy git
apt-get install -qy gcc
apt-get install -qy musl-dev
apt-get install -qy libffi-dev
apt-get install -qy libssl-dev
apt-get install -qy python-dev
apt-get install -qy ffmpeg
apt-get install -qy python-pip
pip install --upgrade pip
pip install requests 
pip install requests[security]
pip install requests-cache
pip install babelfish
pip install 'guessit<2'
pip install 'subliminal<2'
pip install stevedore
pip install python-dateutil
pip install qtfaststart

# Take ownership of the mp4automator and config directories
chown -R 1000:1000 /mp4automator
chown -R 1000:1000 /config
