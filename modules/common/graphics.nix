{
  #Nvidia Settings
  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
    offload.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:73:0:0"; # AMD iGPU
  };

}
