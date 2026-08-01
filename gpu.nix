# GPU: Intel HD 3000 (Sandy Bridge) — VA-API video decode.
{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ intel-vaapi-driver ];
  };
}
