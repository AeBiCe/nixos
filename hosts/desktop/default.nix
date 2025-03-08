{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/networking.nix
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  #Nvidia Settings
  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Hyprland
  programs.hyprland.enable = true;

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = { ls = "eza"; };
      ohMyZsh = {
        enable = true;
        plugins = [ ];
        theme = "arrow";
      };
    };
  };

  environment.systemPackages = with pkgs; [ git nixfmt-classic ];

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
