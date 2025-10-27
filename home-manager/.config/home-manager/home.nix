{ _, ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "sushi";
  home.homeDirectory = "/home/sushi";

  home.sessionVariables = { EDITOR = "nvim"; };

  home.packages = [ ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
