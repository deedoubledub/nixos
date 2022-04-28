# nixos network configuration

{ config, pkgs, ... }:

{
  networking.hostName = "frame"; # Define your hostname.

  # The global useDHCP flag is deprecated
  # Per-interface useDHCP will be mandatory in the future
  networking.useDHCP = false;
  networking.interfaces.wlp170s0.useDHCP = true;

  networking.networkmanager.enable = true;
}

