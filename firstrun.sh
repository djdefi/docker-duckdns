#!/bin/bash
  
  rm /config/duck.new.conf
  #Check to make sure the subdomain and token are set
  if [ -z "SUBDOMAINS" ] || [ -z "TOKEN" ]; then
    echo "Please pass both your subdomain(s) and token as environment variables in your docker run command. See docker info for more details."
    if [ -f /config/duck.conf ]; then
      echo "Retrieving variables from old duck.conf"
      tr -d '\r' < /config/duck.conf > /tmp/duck.conf
      . /tmp/duck.conf
      echo -e "SUBDOMAINS=$DOMAINS \nTOKEN=$TOKEN \n" > /config/duck.new.conf
    fi
  else
    echo "Retrieving subdomain and token from the environment variables"
    echo -e "SUBDOMAINS=$SUBDOMAINS \nTOKEN=$TOKEN \n" > /config/duck.new.conf
  fi
  
  #Get docker env timezone and set system timezone
  echo $TZ > /etc/timezone
  export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
  dpkg-reconfigure tzdata
