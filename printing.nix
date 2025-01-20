# nixos network configuration

{ config, pkgs, ... }:

{
  # enable printer autodiscovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
  };
}
