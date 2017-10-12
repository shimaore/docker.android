FROM debian:testing
MAINTAINER Stéphane Alnet <stephane@shimaore.net>

# Inspired by and based on:
# https://github.com/lfuelling/android-sdk-docker
# https://github.com/Kallikrein/dockerfiles/blob/master/cordova/Dockerfile
# https://github.com/oren/docker-cordova/blob/master/Dockerfile

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    openjdk-8-jdk-headless \
    lib32stdc++6 lib32z1 \
    ca-certificates \
    curl \
    git \
    make \
    unzip \
    zip \
  && \
  rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install Android SDK.
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_ZIP sdk-tools-linux-3859397.zip
RUN \
  curl -O https://dl.google.com/android/repository/$ANDROID_ZIP && \
  unzip -d $ANDROID_HOME $ANDROID_ZIP && \
  rm $ANDROID_ZIP
ENV PATH $PATH:$ANDROID_HOME/tools

RUN \
  (yes | ${ANDROID_HOME}/tools/bin/sdkmanager --update) && \
  /usr/local/android-sdk-linux/tools/bin/sdkmanager --list && \
  (yes | ${ANDROID_HOME}/tools/bin/sdkmanager \
    'build-tools;26.0.2' \
    'platforms;android-25' \
  )
RUN \
  curl -s "https://get.sdkman.io" | bash && \
  source "/root/.sdkman/bin/sdkman-init.sh" && \
  sdk install gradle 4.2.1
