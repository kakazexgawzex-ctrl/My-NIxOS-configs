{ pkgs-unstable, noctalia-pkg, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    noctalia-pkg
    brave-origin
    nordzy-cursor-theme
  ];
}
