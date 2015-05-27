FROM fabito/sipsimple:latest

MAINTAINER Fábio Uechi <fabio.uechi@gmail.com>

RUN sudo apt-get install -y python-pip && \
    sudo pip install SpeechRecognition

CMD ["/bin/bash"] 