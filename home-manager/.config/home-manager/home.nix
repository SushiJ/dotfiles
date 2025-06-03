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
    # pkgs.babashka

    pkgs.cmake
    pkgs.clang_16
    pkgs.ninja
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
