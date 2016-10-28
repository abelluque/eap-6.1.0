#Use latest jboss/base-jdk:7 image as the base
FROM jboss/base-jdk:7

MAINTAINER Abel Luque <aluque@redhat.com>

# Set the JBOSS_VERSION env variable
ENV JBOSS_VERSION 6.1.0


# Install jboss-eap-6.1.0 in the image.
COPY install.sh /opt/jboss/install.sh
RUN /opt/jboss/install.sh

EXPOSE 8080 9990 9999

#
# The following directories can hold config/data, so lets suggest the user
# mount them as volumes.
VOLUME /opt/jboss/jboss-eap-6.1/standalone/configuration/

# lets default to the jboss-fuse dir so folks can more easily navigate to around the server install
WORKDIR /opt/jboss/jboss-eap-6.1/
CMD ./opt/jboss/jboss-eap/bin/standalone.sh
