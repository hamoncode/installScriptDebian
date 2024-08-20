#!/bin/sh

# Remove existing .zshrc file and create symlink
if [ -f ~/.zshrc ]; then
    rm -f ~/.zshrc || { echo "Erreur: impossible de supprimer .zshrc"; exit 1; }
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc || { echo "Erreur: problème lors de la création du symlink pour .zshrc"; exit 1; }

# Remove existing applications directory and create symlink
if [ -d ~/.local/share/applications ]; then
    rm -rf ~/.local/share/applications || { echo "Erreur: impossible de supprimer le dossier applications"; exit 1; }
fi
ln -s ~/.dotfiles/applications ~/.local/share/applications || { echo "Erreur: problème lors de la création du symlink pour applications"; exit 1; }

# Remove existing fonts directory and create symlink
if [ -d ~/.local/share/fonts ]; then
    rm -rf ~/.local/share/fonts || { echo "Erreur: impossible de supprimer le dossier fonts"; exit 1; }
fi
ln -s ~/.dotfiles/fonts ~/.local/share/fonts || { echo "Erreur: problème lors de la création du symlink pour fonts"; exit 1; }

# Remove existing .config directory and create symlink
if [ -d ~/.config ]; then
    rm -rf ~/.config || { echo "Erreur: impossible de supprimer le dossier .config"; exit 1; }
fi
ln -s ~/.dotfiles/.config ~/.config || { echo "Erreur: problème lors de la création du symlink pour .config"; exit 1; }

# Clone external plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { echo "Erreur: problème lors du clonage de zsh-autosuggestions"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "Erreur: problème lors du clonage de zsh-syntax-highlighting"; exit 1; }
git clone https://github.com/marlonrichert/zsh-autocomplete.git || { echo "Erreur: problème lors du clonage de zsh-autocomplete"; exit 1; }

# fix manuel du dernier pluggin  
mv ./zsh-autocomplete ~/.oh-my-zsh/plugins || { echo "erreur durant le fix zsh-autocomplete"; exit 1; }

# doom emacs config
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# permission
chmod 644 ~/.dotfiles/.wallpaper.png || { echo "erreur durant l'assignation de permission .pgn"; exit 1; }
chmod 644 ~/.dotfiles/.wallpaper.jpg || { echo "erreur durant l'assignation de permission .jpg"; exit 1; }

echo "Configuration réussie!"
