# nixos network configuration

{ config, pkgs, ... }:

{
  networking.hostName = "quahog"; # Define your hostname.

  # The global useDHCP flag is deprecated
  # Per-interface useDHCP will be mandatory in the future
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  networking.networkmanager.enable = true;

  # manual /etc/hosts entries
  networking.extraHosts =
    ''
      192.168.5.10 webadvisornew.allegheny.edu
    '';
}

