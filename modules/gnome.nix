{ pkgs, ... }:

{
  # Enable X11 windowing system
  services.xserver.enable = true;

  # Enable GNOME DE and GNOME Display Manager
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    geary
    epiphany
    gnome-tour
    gnome-characters
    gnome-contacts
    gnome-font-viewer
    gnome-maps
    gnome-music
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
  ]);
}
