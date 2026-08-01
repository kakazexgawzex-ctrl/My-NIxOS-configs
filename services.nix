# System services: audio, thermal, power, zram.
{ ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.thermald.enable = true;
  services.power-profiles-daemon.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 100;
  };
}
