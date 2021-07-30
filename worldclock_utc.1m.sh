#!/bin/bash
zone="America/Los_Angeles"
echo "$zone $(TZ=$zone date +'%a %H:%M')"
