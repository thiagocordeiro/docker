#!/bin/bash

git clone https://github.com/xdebug/xdebug.git /root/xdebug
cd /root/xdebug && ./rebuild.sh
rm -rf /root/xdebug

find / -name "php.ini" -type f -exec sh -c 'echo "" >> {}' \;
find / -name "php.ini" -type f -exec sh -c 'echo zend_extension=\"xdebug.so\" >> {}' \;
