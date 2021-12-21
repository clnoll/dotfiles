mkdir -p ~/Library/Application\ Support/xbar/plugins
cat > ~/Library/Application\ Support/xbar/plugins/worldclock_utc.1m.sh <<EOF
#!/bin/bash
zone="America/Los_Angeles"
echo "\$zone \$(TZ=\$zone date +'%a %I:%M')"
EOF
chmod +x ~/Library/Application\ Support/xbar/plugins/worldclock_utc.1m.sh
