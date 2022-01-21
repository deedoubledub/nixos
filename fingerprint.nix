# nixos fingreprint reader configuration

{ config, pkgs, ... }:

{
  services.fprintd.enable = true;

  security.pam.services.login.fprintAuth = true;
}

