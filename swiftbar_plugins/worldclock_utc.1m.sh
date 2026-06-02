#!/bin/bash
zone1="America/Los_Angeles"
zone2="America/New_York"
echo "Pacific $(TZ=$zone1 date +'%a %H:%M') / Eastern $(TZ=$zone2 date +'%a %H:%M')"
