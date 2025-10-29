{ pkgs, ... }:

{
  #Enable Logitech wireless protocol
  hardware.logitech.wireless.enable = true;

  environment.systemPackages = [ pkgs.vial ];

  services.udev = {

    packages = with pkgs; [
      qmk-udev-rules # the only relevant
      vial
    ]; # packages

  };
}
