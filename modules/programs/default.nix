{ config, pkgs, ... }:

{
  programs = {

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = { ls = "eza"; };
      dotDir = ".config/zsh"
      ohMyZsh = {
        enable = true;
        plugins = [ ];
        theme = "arrow";
      };
    };

    steam.enable = true;
    hyprland.enable = true;
  };
}
