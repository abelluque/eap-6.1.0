#!/bin/bash

cd /opt/jboss

unzip /tmp/jboss-eap-6.1.0.zip
chmod a+x jboss-eap-6.1/bin/*
#ln -s /opt/jboss/jboss-eap-6.1 jboss-eap


rm /opt/jboss/install.sh
