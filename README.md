# documentation intallation script pour packages dans linux

## comment faire de ce install script facilement le vôtre

le install script parse un fichiers txt (packagePac.txt)
- avant de lancer le script , remplacez les noms des packages que vous utilisez dans ce fichier.
- si vous utilisez un autre package manager changez la commande "sudo pacman -S" dans le for loop

## étapes de l'installation

1) donner permission au scripts de s'executer

chmod u+x install_script.sh 

2) lancer le install script

./install_script.sh

### postnotes 

  - le reste des étapes consiste à importer vos dotfiles(fichiers de configurations) avec le système de votre choix.
  - perso j'utilise un repo git et je crée des simlinks (ex:config_script.sh)
  - il existe d'autre système comme stow et chezmoi qui sont plus robustes/maléables.
