# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Install OpenJDK and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk curl && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Tomcat version and installation directory
ENV TOMCAT_VERSION=v10.1.8
ENV TOMCAT_INSTALL_DIR=/opt/tomcat

# Download and extract Apache Tomcat
RUN curl -fsSL https://downloads.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz -o tomcat.tar.gz && \
    mkdir $TOMCAT_INSTALL_DIR && \
    tar -xf tomcat.tar.gz --strip-components=1 -C $TOMCAT_INSTALL_DIR && \
    rm tomcat.tar.gz

# Set the working directory to Tomcat bin
WORKDIR $TOMCAT_INSTALL_DIR/bin

# Start Apache Tomcat
CMD ["catalina.sh", "run"]
