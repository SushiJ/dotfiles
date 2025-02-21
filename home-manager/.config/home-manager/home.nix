{ pkgs, ...}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "sushi";
  home.homeDirectory = "/home/sushi";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    pkgs.fish
    pkgs.obsidian
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
