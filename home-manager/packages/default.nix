{ pkgs, ... }: {
  home.packages = with pkgs; [

    # Utils
    wiremix
    bluetui
    btop-cuda
    yazi
    fzf
    eza
    fastfetch
    bat
    quickemu
    ripgrep
    wl-clipboard
    fd
    fuzzel
    alacritty

    # Graphical Utils
    solaar
    czkawka

    # Graphics
    vulkan-tools
    vulkan-loader
    mesa

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
    qutebrowser
    brave
    obsidian
    heroic

    # PrivSec
    veracrypt
    mullvad
    keepassxc
    tomb

    # Development
    vim
    python3
    devenv
    direnv
    vscode

    # Gaming
    gamemode
    mangohud

    # Video
    ffmpeg
    vlc
    mpv

    #Fonts
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
    montserrat

  ];

  fonts.fontconfig.enable = true;
}
