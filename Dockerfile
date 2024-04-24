FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install --yes \
    openjdk-17-jre \
    curl \
    unzip \
    tree

ENV JAVA_HOME '/usr/lib/jvm/java-17-openjdk-amd64/'
ENV ANDROID_HOME '/android/sdk'

RUN mkdir -p $ANDROID_HOME && \
    curl https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip > $ANDROID_HOME/cmdline-tools.zip && \
    unzip $ANDROID_HOME/cmdline-tools.zip -d $ANDROID_HOME && \
    mkdir -p "$ANDROID_HOME/latest" && \
    mv $ANDROID_HOME/cmdline-tools/* $ANDROID_HOME/latest && \
    mv $ANDROID_HOME/latest $ANDROID_HOME/cmdline-tools && \
    rm $ANDROID_HOME/cmdline-tools.zip

RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses && \
    $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platform-tools" "build-tools;34.0.0" "platforms;android-34"