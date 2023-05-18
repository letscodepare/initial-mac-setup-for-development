#!/bin/bash

# install xcode build tools

xcode-select --install

# # install homebrew

if test ! "$(command -v brew)"; then
        
        # Run as a login shell (non-interactive) so that the script doesn't pause for user input
        sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login

	## /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


brew bundle install
# install homebrew formulae

# install homebrew casks

# setup bash_profile and other dot files

# curl -O https://raw.githubusercontent.com/letscodepare/dotfiles/main/.bash_profile

# curl -O https://raw.githubusercontent.com/letscodepare/dotfiles/main/.gitignore

# configure git

git config --global user.name anthonyp

git config --global user.email dev.anthonypillos@gmail.com

git config --global core.editor nano

# install node version manager

if test ! "$(command -v nvm)"; then
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
fi

nvm install --lts

# global npm installs

nvm use stable
npm install -g gitignore license

# create dev folder

mkdir -p ~/dev/letscodepare
mkdir -p ~/dev/work

# create ~/bin folder

mkdir ~/bin

cp env.sh ~/bin/

# install Oh my Zsh
if test ! "$(command -v zsh)"; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# Force Change your default shell

chsh -s "$(which zsh)"

# add env.sh in .zshrc
echo -e 'source ~/bin/env.sh \n' >> ~/.zshrc

source ~/.zshrc

cp zsh-themes/letscodepare.zsh-theme ~/.oh-my-zsh/custom/themes/

#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#exec zsh