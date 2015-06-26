#!/bin/bash

if [ ! -z "$SUBDOMAIN" ]; then
  RESPONSE=`curl -s "https://www.duckdns.org/update?domains=$SUBDOMAIN&token=$TOKEN&ip="`
  if [ "$RESPONSE" = "OK" ]; then
  echo "Your IP was updated at "$(date)
  else
  echo "Tried to use subdomain and token from environment values but something went wrong, check your settings  "$(date)
  fi

elif [ -f /config/duck.conf ]; then
  echo "duck.conf found! Using old school method to update IP. Please consider passing subdomain and token as environment values in the future as the duck.conf method is depracated."
  tr -d '\r' < /config/duck.conf > /tmp/duck.conf
  . /tmp/duck.conf
  RESPONSE=`curl -s "https://www.duckdns.org/update?domains=$DOMAINS&token=$TOKEN&ip="`
  if [ "$RESPONSE" = "OK" ]; then
  echo "Your IP was updated at "$(date)
  else
  echo "Tried to use existing duck.conf file but something went wrong, check your settings  "$(date)
  fi

else
  echo "Please enter your subdomain and token as environment variables in your docker run command. See info box for details."

fi
