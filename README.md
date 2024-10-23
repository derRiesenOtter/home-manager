# Installation of home-manager

1. Follow the official installation instruction for the [nix package manager](https://nixos.org/download/)
3. Log in to the Mac App Store
3. [Create a new ssh-key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. [Add the ssh-key to the github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
5. Copy the configuration to the `~/.config` directory
```sh
mkdir -p ~/.config
cd ~/.config
git clone git@github.com:derRiesenOtter/nix-darwin.git
```
6. [Initialize home-manager](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone)
```sh 
cd ~/.config/home-manager/
nix run home-manager/master -- init --switch
```

# Updating of home-manager
## Updating the configuration
```sh
home-manager switch
```

## Upgrading the configuration
```sh 
nix flake update
```
