{ config, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = true;
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:73:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
