#!/bin/bash
# This code taken from:
# https://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick
# It allows setting the JDK version to use in the current process.
function setjdk() {
    if [ $# -ne 0 ]; then
	removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
	if [ -n "${JAVA_HOME+x}" ]; then
	    removeFromPath $JAVA_HOME
	fi
	export JAVA_HOME=`/usr/libexec/java_home -v $@`
	export PATH=$JAVA_HOME/bin:$PATH
    fi
}

function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}