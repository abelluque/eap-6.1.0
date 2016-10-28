#Use latest jboss/base-jdk:7 image as the base
FROM jboss/base-jdk:7

MAINTAINER Abel Luque <aluque@redhat.com>

# Set the JBOSS_VERSION env variable
ENV JBOSS_VERSION 6.1.0


# Install jboss-eap-6.1.0 in the image.
COPY install.sh /opt/jboss/install.sh
COPY jboss-eap-6.1.0.zip /tmp/
RUN /opt/jboss/install.sh

COPY files/billersplus-connector-emulador.war /opt/jboss/jboss-eap-6.1/standalone/deployments/

EXPOSE 8080 9990 9999

#
# The following directories can hold config/data, so lets suggest the user
# mount them as volumes.
#VOLUME /opt/jboss/jboss-eap/standalone/configuration/

# lets default to the jboss-fuse dir so folks can more easily navigate to around the server install
WORKDIR /opt/jboss/jboss-eap-6.1/
CMD /opt/jboss/jboss-eap-6.1/bin/standalone.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0
