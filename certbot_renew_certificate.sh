#!/bin/bash
#Execute: bash certbot_enable.sh

systemctl list-timers --all

certbotService="/etc/systemd/system/timers.target.wants/certbot.service"

if [ -L $certbotService ]; then
  echo "=> File exist, you do not need to make any other configuration"
else
  echo "=> File doesn´t exist"
  read -p 'Do you want to create the renewal files?(Y/N) ' answer
  isrenewal=${answer,,}

  if [ $isrenewal = "y" ]; then
   echo "=> Next Step"
  else
   echo "=> Cancelled operation"
  fi
fi