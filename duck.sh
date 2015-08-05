#!/bin/bash


if [ -f /config/duck.new.conf ]; then
  tr -d '\r' < /config/duck.new.conf > /tmp/duck.new.conf
  . /tmp/duck.new.conf
  RESPONSE=`curl -s "https://www.duckdns.org/update?domains=$SUBDOMAINS&token=$TOKEN&ip="`
  if [ "$RESPONSE" = "OK" ]; then
  echo "Your IP was updated at "$(date)
  else
  echo "Something went wrong, please check your settings  "$(date)
  fi

else
  echo "Please enter your subdomain and token as environment variables in your docker run command. See info box for details."

fi
