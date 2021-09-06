# Mule requires java 8, use that base image
FROM openjdk:8-jdk

# Copy all of the mule runtime to the image
COPY ./mule-community-4.3.0 /opt/mule

# Set the shell/bat file as the way to run this image
ENTRYPOINT [ "/opt/mule/bin/mule" ]
