# Desktop environment: locale, cursors, fonts, niri, ly, flatpak.
{ pkgs, ... }:
{
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.localBinInPath = true;

  environment.variables = {
    XCURSOR_THEME = "Nordzy-cursors";
    XCURSOR_SIZE = "24";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services.libinput.enable = true;

  programs.niri.enable = true;
  services.displayManager.ly.enable = true;
  services.flatpak.enable = true;
}
