# Dotfiles (Configuration files)

My Arch Linux config files

# Usage

- Clone the repo

  ```bash
  git clone https://github.com/AloisCRR/dotfiles.git && cd dotfiles
  ```

- Create a symbolic link for every folder

  ```bash
  ln -sf ~/path/to/dotfiles/.config/* ~/.config/
  ```

## Root user folders config

`etc`, `xorg` and `usr` folder files need root permissions, so theres no good idea to make a sym link of those. I'll try to order the folder as equal as it is in the linux folder, to easily copy and paste.

## Submodules

This repo uses submodules (git projects within git project), to clone it properly you have to:

```bash
git clone --recurse-submodules https://github.com/AloisCRR/dotfiles
```
