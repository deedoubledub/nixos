# nixos bluetooth configuration

{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.hsphfpd.enable = true;
  services.blueman.enable = true;
}

