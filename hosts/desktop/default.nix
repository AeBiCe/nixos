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
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.initrd.luks.devices."luks-423e6fc2-f187-4bfc-803e-beec312d678f".device =
    "/dev/disk/by-uuid/423e6fc2-f187-4bfc-803e-beec312d678f";

  fileSystems."/home/n5/data" = {
    device = "/dev/disk/by-uuid/d82c4e39-72a1-4408-ace8-9db2ea8c5f35";
    fsType = "ext4";
    options = [ "noatime" "nodev" "nosuid" ];
  };

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
