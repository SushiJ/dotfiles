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
    pkgs.ruff
    pkgs.uv
    pkgs.babashka

    pkgs.cmake
    pkgs.ninja
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
