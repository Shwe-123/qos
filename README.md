**README**

1. Contents
-----------
The following are the source code that implements the qos element in Click:

1. elements/aqm/aaqm.cc - The source code for the element AAQM that implements QoS with buffer management.
2. elements/aqm/aaqm.hh - Header file for aaqm.cc
3. stats.sh - A shell script to monitor packet statistics from AAQM.
4. aaqm.click - A click configuration that uses the element AAQM.

This package was tested on Ubuntu 14.04 LTS version.
2. How to compile
------------------
To add a new element click does not require to change it's existing make file.

Installing click requires gcc and kernel headers.
To install them:
\#sudo apt-get install build-essential linux-headers-$(uname -r)

Navigate to the root directory "click-master"

Configure click to compile as a kernel module.

\#./configure --enable-linuxmodule.

Generate element list

\#make elemlist

Compile and Install

\#make install

(Note: if any of the above commands fail with a 'Permission denied' message, run them with sudo privileges.
For ex: sudo make install. )

3. How to run
-------------

Use the click configuration file aaqm.click to test AAQM element.
                                                                                                                             
To load the click module.
\#click-install aaqm.click

To unload the click module
\#click-uninstall

(Note: Since click-install loads a kernel module to OS, the user might appopriate sudo permission for this operation)

4. Getting packet statistics
----------------------------
AAQM has handlers that specifies the number of packets dropped and current queue size for each queue.

Ex: To get the packet drops for Queue1
Using the aaqm.click
\#cat /click/aaqm/drops1

The stats.sh script can be used to monitor the packet statistics continuously.
(Note: the stats.sh script is written specifically for the click configuration aaqm.click)

Ex:
\#sh stats.sh
Packet statistics


queue    input  count  drop  output
 
queue1      0       0       0       0

queue2      0       0       0       0

queue3      0       0       0       0

queue4      0       0       0       0

queue5      0       0       0       0

 Output rate: 0 pkts/sec
 
 Output rate: 0 bits/sec
 

The stats are also logged into a file called log.

