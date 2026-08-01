{ pkgs, ... }:
let
  freesmlauncher-src = pkgs.fetchurl {
    url = "https://github.com/FreesmTeam/FreesmLauncher/releases/download/2.2.2/FreesmLauncher-Linux-x86_64.AppImage";
    sha256 = "c4e9e7513e606057903e4eaba901148f8e07c0f0c4c4d7bc4c3feafe47170514";
  };
  freesmlauncher-extracted = pkgs.appimageTools.extract {
    pname = "freesmlauncher";
    version = "2.2.2";
    src = freesmlauncher-src;
  };
in {
  environment.systemPackages = [
    (pkgs.appimageTools.wrapType2 {
      pname = "freesmlauncher";
      version = "2.2.2";
      src = freesmlauncher-src;
      extraInstallCommands = ''
        install -Dm644 ${freesmlauncher-extracted}/share/applications/org.freesmlauncher.FreesmLauncher.desktop $out/share/applications/org.freesmlauncher.FreesmLauncher.desktop
        install -Dm644 ${freesmlauncher-extracted}/share/icons/hicolor/256x256/apps/org.freesmlauncher.FreesmLauncher.png $out/share/icons/hicolor/256x256/apps/org.freesmlauncher.FreesmLauncher.png
      '';
    })
    pkgs.openjdk21
  ];
}
