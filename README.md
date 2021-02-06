# Dotfiles (Configuration files)

My Arch Linux config files

# Usage

- Clone the repo (and init submodules)

  ```bash
  git clone --recurse-submodules https://github.com/AloisCRR/dotfiles.git
  ```

- Create a symbolic link for every folder

  ```bash
  ln -sf ~/path/to/dotfiles/.config/* ~/.config/
  ```

## Root user folders config

`etc`, `xorg` and `usr` folder files need root permissions, so theres no good idea to make a sym link of those. I'll try to order the folder as equal as it is in the linux folder, to easily copy and paste.

## How to remove a submodule

- Delete the section referring to the submodule from the .gitmodules file
- Stage the changes via git add .gitmodules
- Delete the relevant section of the submodule from `.git/config`.
- Run `git rm --cached path_to_submodule` (no trailing slash)
- Run `rm -rf .git/modules/path_to_submodule`
- Commit the changes with `git commit -m "Removed submodule"`
- Delete the now untracked submodule files `rm -rf path_to_submodule`
