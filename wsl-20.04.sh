echo "Setting up development environment"

# First create an ssh key
# ssh-keygen -t rsa -b 4096 -C "me@example.com"
# ssh-add ~/.ssh/id_rsa

# Set up the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


apt-get update && apt-get upgrade
sudo add-apt-repository ppa:kelleyk/emacs
apt-get install -y emacs27 \
                   docker-ce \
                   docker-ce-cli \
                   containerd.io
                   
echo "Setup complete"
