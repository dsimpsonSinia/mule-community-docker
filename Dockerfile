# Mule requires java 8, use that base image
FROM openjdk:8

# Copy all of the mule runtime to the image
COPY ./mule-community-4.3.0 /opt/mule

# These folders are empty and git doesn't save them, we must create them in the container
RUN mkdir /opt/mule/apps & mkdir -p /opt/mule/domains/default & mkdir /opt/mule/lib/patches

VOLUME [ "/opt/mule/apps", "/opt/mule/logs", "/opt/mule/domains", "/opt/mule/lib/patches" ]

EXPOSE 80
EXPOSE 443

# Set the shell/bat file as the way to run this image
ENTRYPOINT [ "/opt/mule/bin/mule" ]
