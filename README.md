# Debian-Simple-MOTD-Monitor
This will set up a MOTD that displays the hostname (including the Debian version), IP address, uptime, and disk usage whenever a user logs in to the system.

Usage:

    Copy the above script with 
    
    wget https://raw.githubusercontent.com/Snake16547/Debian-Simple-MOTD-Monitor/main/setup.sh
    
    Make it executable with 
    
    chmod +x setup.sh
    
    Run it with 
    
    sudo ./setup.sh.

This will set up a MOTD that displays the hostname (including the Debian version), IP address, uptime, and disk usage whenever a user logs in to the system.

Explanation:

    Usage Function: Displays how to use the script.
    get_debian_version Function: Retrieves the Debian version from /etc/debian_version.
    create_motd_script Function: Creates the MOTD script /etc/profile.d/motd.sh that displays hostname, Debian version, IP address, uptime, and disk usage.
    Main Script:
        Checks if the script is run as root.
        Calls create_motd_script to generate the MOTD script.
        Provides feedback upon completion.
