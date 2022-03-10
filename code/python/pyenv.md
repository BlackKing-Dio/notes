curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash



echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.bash_profile

echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile

source ~/.bash_profile



curl -O https://repo.continuum.io/archive/Anaconda3-4.1.0-Linux-x86_64.sh

