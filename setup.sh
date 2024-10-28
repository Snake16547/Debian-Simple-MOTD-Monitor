#!/bin/bash

# MOTD setup script for Debian systems

# Function to display usage
usage() {
    echo "Usage: $0"
    echo "  This script sets up a MOTD (Message of the Day) for Debian systems."
}

# Function to get Debian version
get_debian_version() {
    debian_version=$(cat /etc/debian_version)
    echo "$debian_version"
}

# Function to create MOTD script
create_motd_script() {
    cat > /etc/profile.d/motd.sh <<'EOF'
#!/bin/bash

# MOTD script for Debian systems

# Get hostname
hostname=$(hostname)

# Get Debian version
debian_version=$(cat /etc/debian_version)

# Get IP address
ip_address=$(hostname -I | cut -d ' ' -f 1)

# Get uptime
uptime=$(uptime -p)

# Get current system time
current_time=$(date +"%Y-%m-%d %H:%M:%S")

# Get disk usage details
disk_usage=$(df -h / | awk 'NR==2 {print "Usage: "$5"\tTotal: "$2"\tUsed: "$3"\tFree: "$4}')

# Display MOTD with styling
echo -e "\033[1;32m=== System Status ===\033[0m"
echo -e "\033[1;34mHostname:\033[0m $hostname (Debian $debian_version)"
echo -e "\033[1;34mIP Address:\033[0m $ip_address"
echo -e "\033[1;34mUptime:\033[0m $uptime"
echo -e "\033[1;34mCurrent Time:\033[0m $current_time"
echo -e "\033[1;34mDisk Usage:\033[0m $disk_usage"
EOF

    chmod +x /etc/profile.d/motd.sh
}

# Main script

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Display usage if incorrect number of arguments
if [ "$#" -ne 0 ]; then
    usage
    exit 1
fi

# Create MOTD script
create_motd_script

echo "MOTD setup complete. The MOTD will be displayed at login."