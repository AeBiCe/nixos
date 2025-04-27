{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Utils
    htop
    yazi
    fzf
    eza
    solaar
    fastfetch
    obsidian
    czkawka
    bat

    # Desktop utils
    waybar
    rofi

    #Hypr ecosystem
    hyprlock
    hypridle

    # Archives
    zip
    unzip
    rar

    # Operations
    ghostty
    filezilla
    mullvad-browser
    librewolf

    # PrivSec
    veracrypt
    mullvad-vpn
    keepassxc
    binwalk
    nmap
    nikto
    wireshark
    john
    hashcat
    lynis
    vulnix

    # Development
    vim
    python3
    devenv
    direnv
    vscode

    # Video
    ffmpeg
    vlc

    # Gaming
    heroic
    mangohud
    gamescope
  ];
}
