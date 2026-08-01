# Home-manager config: user dotfiles and programs.
# Managed with nixos-rebuild switch --flake /etc/nixos#nixos
{ pkgs, ... }: {
  home.username = "watrib";
  home.homeDirectory = "/home/watrib";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # visually unused - starship overrides the prompt
      plugins = [ "git" ];
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      anifetch() {
        command anifetch ~/Downloads/nix-spin-nixos.gif -W 50 -H 50 -c ~/.config/fastfetch/main.jsonc "$@"
      }
    '';
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      lt = "eza --tree --icons";
    };
  };

  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
}
