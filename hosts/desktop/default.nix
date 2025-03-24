{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/gnome.nix
    ../../modules/programs
    ../../modules/peripherals
    ../../modules/services
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.initrd.luks.devices."luks-c62a52e5-ae0f-4516-8390-0e246d53859c".device =
    "/dev/disk/by-uuid/c62a52e5-ae0f-4516-8390-0e246d53859c";

  # Network Hostname.
  networking.hostName = "nixos";

  # Define trusted users for devenv to automatically manage binary caches
  nix.settings.trusted-users = [ "root" "n5" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.n5 = {
    isNormalUser = true;
    description = "n5";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ git nixfmt-classic just ];

  # Home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.n5 = import ../../home-manager/users/n5/home.nix;

  system.stateVersion = "24.11";

}
