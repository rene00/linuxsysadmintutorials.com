#!/bin/bash
# http://www.linuxsysadmintutorials.com/use-boxcar-to-send-nagios-alerts
# a copypasta of https://github.com/jedda/OSX-Monitoring-Tools/blob/master/notify_by_boxcar.sh
# Rene Cunningham <rene@linuxsysadmintutorials.com>

while getopts "e:h:m:" optionName; do
  case "$optionName" in
    e) boxcarEmail=( "$OPTARG" );;
    h) host=( "$OPTARG" );;
    m) message=( "$OPTARG" );;
  esac
done

curl --sslv3 --data-urlencode "email=$boxcarEmail" \
  --data-urlencode "&notification[from_screen_name]=$host" \
  --data-urlencode "&notification[message]=$message" \
  https://boxcar.io/devices/providers/MH0S7xOFSwVLNvNhTpiC/notifications
