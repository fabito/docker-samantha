FROM fabito/sipsimple:latest

MAINTAINER Fábio Uechi <fabio.uechi@gmail.com>

RUN sudo apt-get install -y git sox libsox-fmt-mp3 flac zsh python-pip python-dev libffi-dev python-numpy python-pyaudio && \
    sudo pip install SpeechRecognition cffi pysoundfile

# Install oh-my-zhs
ENV ZSH ${HOME}/.oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
ADD home/ ${HOME}/
RUN sudo chown -R ${uid}:${gid} ${HOME}

# Install fasd
RUN \
  sudo git clone https://github.com/clvv/fasd.git /usr/local/fasd &&\ 
  sudo ln -s /usr/local/fasd/fasd /usr/bin/fasd

# Define default command.
CMD ["zsh"]