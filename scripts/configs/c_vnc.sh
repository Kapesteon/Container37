 #!/bin/bash

set -e

echo "$VNC_PASSWD" | vncpasswd -f >> $PASSWD_PATH   #Create a hashed password with the dedicated command
chmod 600 $PASSWD_PATH                              #Change permission

