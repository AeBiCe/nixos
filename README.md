# nixos
My configuration for NixOs

> [!WARNING]
> Not intended to be used by others as of now. Still heavily worked upon.

# Improvements backlog
- [x] Split the configuration in better way.
- [x] Break out the contents of home.nix and configuration.nix
- [ ] Add [Sops-nix](https://github.com/Mic92/sops-nix) to sensitive parts of the config. 
- [ ] Separate DE (Hyprland and GNOME) configs
- [ ] Add dotfiles
- [ ] Harden the OS (CIS?)
- [ ] Setup a better development environment
- [ ] Look into add / configuring a security based profile for pentesting and forensics
- [ ] Investigate [Impermanence](https://github.com/nix-community/impermanence)
- [ ] Setup CI for automated upgrade of flake.lock. Testing should be a part of the CI.
- [ ] Setup a binary cache or investigate [cachix](https://www.cachix.org/)

# Repositories for inspiration
- https://github.com/Misterio77/nix-config
- https://github.com/Misterio77/nix-starter-configs
- https://github.com/ryan4yin/nix-config
	- The i3-kickstarter branch is a simpler
- https://github.com/Athena-OS
	- Seems great for a Kali Linux alternative

# Credit
- Huge credit to my dear friend [Emil](https://github.com/emilhem) that introduces me to the Nix jungle. Linux has never been this fun.
- A big thank you to to [Ryan Yin](https://github.com/ryan4yin) for his great book on Nix and Flakes which was an immense help to get started. The book can be found here: https://nixos-and-flakes.thiscute.world/
