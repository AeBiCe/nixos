{ config, ... }:

{
  #Nvidia Settings
  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.package =
    config.boot.kernelPackages.nvidiaPackages.production;
  services.xserver.videoDrivers = [ "nvidia" ];

}
