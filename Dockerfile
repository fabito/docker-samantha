FROM fabito/sipsimple:latest

MAINTAINER Fábio Uechi <fabio.uechi@gmail.com>

RUN sudo apt-get install -y git sox flac zsh python-pip python-pyaudio && \
    sudo pip install SpeechRecognition 

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