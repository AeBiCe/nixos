{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/gnome.nix
    ../../modules/programs
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

  #Nvidia Settings
  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Disable CUPS.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #Enable Logitech wireless protocol
  hardware.logitech.wireless.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.n5 = {
    isNormalUser = true;
    description = "n5";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ git nixfmt-classic just ];

  # Home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.n5 = import ../../home-manager/users/n5/home.nix;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "24.11";

}
