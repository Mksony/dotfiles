function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    mkdir -p .config-backup
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

brew bundle --file ".Brewfile"

curl -o- -L https://yarnpkg.com/install.sh | bash

# to avoid problems setting zsh as default shell
sudo echo "$(which zsh)" >> /etc/shells
chsh -s $(which zsh)

bash ~/.macos