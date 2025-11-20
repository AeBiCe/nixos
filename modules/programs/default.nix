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
      ohMyZsh = {
        enable = true;
        plugins = [ ];
        theme = "arrow";
      };
    };
    niri.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    hyprland.enable = true;
  };
}
