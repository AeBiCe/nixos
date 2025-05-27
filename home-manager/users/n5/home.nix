{ config, pkgs, ... }: {

  imports = [ ../../packages ];

  home.username = "n5";
  home.homeDirectory = "/home/n5";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.11";
  # home.file."${config.xdg.configHome}" = {
  #   source = ../../../dotfiles;
  #   recursive = true;
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. 
  home.sessionVariables = { EDITOR = "nvim"; };

  # Set custom zsh config path
  programs.zsh.enable = true;
  programs.zsh.dotDir = ".config/zsh";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
