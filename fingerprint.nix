# nixos fingreprint reader configuration

{ config, pkgs, ... }:

{
  security.pam.services.login.fprintAuth = true;
}

