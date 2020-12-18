/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install Brewfile


curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

echo "source ~/.iterm2_shell_integration.zsh" >> ~/.zshrc
