{

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Disable CUPS.
  services.printing.enable = false;

  # Enable Ollama
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
}
