# nixos fingreprint reader configuration

{ config, pkgs, ... }:

{
  services.fprintd.enable = true;
}

