# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# Core system config: boot, kernel, users, nix settings.
# Everything else is split into modules:
#   apps.nix      - applications / system packages
#   desktop.nix   - locale, cursors, niri, ly, flatpak
#   gpu.nix       - graphics / VA-API
#   network.nix   - NetworkManager, DNS, time zone
#   services.nix  - audio, thermal, power, zram

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./apps.nix
      ./desktop.nix
      ./gpu.nix
      ./network.nix
      ./services.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda"; # or "nodev" for efi only
    forceInstall = true; # fixes "attempted to read outside of hd0" boot errors
    copyKernels = true; # copy kernel/initrd into /boot so GRUB can read them reliably
  };
   boot.plymouth.enable = true;
   boot.kernelParams = [ "mitigations=off" "nowatchdog" "elevator=bfq" ];

  # Use zen kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # for future this enables nix.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;

  # enable Zsh becuz apprently nix fucking needs correct order and stuff

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
   users.users.watrib = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ]; # Enable 'sudo' for the user.
     packages = with pkgs; [
       tree
     ];
   };

  # Allow Unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow firmware to turn on wifi on extra (binary firmware)
  hardware.enableAllFirmware = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "26.05"; # Did you read the comment?

}
