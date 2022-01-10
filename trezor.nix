# nixos trezor configuration

{ config, pkgs, ... }:

{
  services.trezord.enable = true;
}

