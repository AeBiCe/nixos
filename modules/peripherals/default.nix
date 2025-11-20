{ pkgs, ... }:

{
  #Enable Logitech wireless protocol
  hardware.logitech.wireless.enable = true;
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };

  environment.systemPackages = [ pkgs.vial ];

  services.udev = {

    packages = with pkgs; [
      qmk-udev-rules # the only relevant
      vial
    ]; # packages

  };
}
