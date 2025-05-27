{ pkgs, ... }: {
  home.packages = with pkgs; [
    #Fonts
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.symbols-only

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
    qutebrowser

    # Desktop utils
    waybar
    rofi

    #Hypr ecosystem
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    hyprcursor

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
    tomb

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

    # Kickstart.nvim requirements
    ripgrep
    libgcc
    wl-clipboard
    xclip
    fd
  ];

  fonts.fontconfig.enable = true;
}
