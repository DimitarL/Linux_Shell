#!/bin/bash

echo "<table>"
echo "<tr>"
echo "<th>Username</th>"
echo "<th>User ID</th>"
echo "<th>Group ID</th>"
echo "<th>login shell</th>"
echo "<th>home dir</th>"
echo "</tr>"

while read line; do

username=$(echo $line | cut -d ':' -f 1)
userID=$(echo $line | cut -d ':' -f 3)
groupID=$(echo $line | cut -d ':' -f 4)
homeDir=$(echo $line | cut -d ':' -f 6)
loginShell=$(echo $line | cut -d ':' -f 7)

echo "<tr>"
echo "<th>$username</th>"
echo "<th>$userID</th>"
echo "<th>$groupID</th>"
echo "<th>$homeDir</th>"
echo "<th>$loginShell</th>"
echo "</tr>"
done < <(cat /etc/passwd)

echo "</table>"

exit 0
