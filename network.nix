# Networking: NetworkManager, DNS, time zone.
{ ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  # Cloudflare DNS (IPv4 only for now)
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.useHostResolvConf = false;

  time.timeZone = "Africa/Casablanca";
}
