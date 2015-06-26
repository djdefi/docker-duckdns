#!/bin/bash

  #Check to make sure the subdomain and token are set
  if [ -z "SUBDOMAIN" ]; then
    echo "Please pass both your subdomain and token as environment variables in your docker run command. See docker info for more details."
  elif [ -z "TOKEN" ]; then
    echo "Please pass both your subdomain and token as environment variables in your docker run command. See docker info for more details."
  else
    echo "Retrieving subdomain and token from the environment variables"
  fi
  
  #Get docker env timezone and set system timezone
  echo $TZ > /etc/timezone
  export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
  dpkg-reconfigure tzdata
