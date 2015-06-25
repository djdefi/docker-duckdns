#!/bin/bash

  #Search for custom config file, if it doesn't exist, copy the default one
  if [ -z "SUBDOMAIN" ]; then
    echo "Please pass both your subdomain and token as environment variables in your docker run command"
  fi
  
  #Get docker env timezone and set system timezone
  echo $TZ > /etc/timezone
  export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
  dpkg-reconfigure tzdata
