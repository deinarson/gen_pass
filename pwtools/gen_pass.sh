#!/bin/sh 

pw_lenght=$(shuf -i 12-20 -n 1)

mkpasswd -m sha-512  $(pwgen -nyc ${pw_lenght} 1|tee /dev/stderr)|tee /dev/stderr | base64 -w 0 ; echo