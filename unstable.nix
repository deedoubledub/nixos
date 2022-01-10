# nixos unstable channel

{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config =  baseconfig; };
in
{
  environment.systemPackages = with pkgs; [
    # GlobalProtect VPN
    (import (fetchTarball "channel:nixos-unstable") {}).globalprotect-openconnect
    # bisq
    #(import (fetchTarball "channel:nixos-unstable") {}).bisq-desktop
  ];

  imports =
    [
      # GlobalProtect VPN
      <nixos-unstable/nixos/modules/services/networking/globalprotect-vpn.nix>
    ];

  disabledModules =
    [
      # GlobalProtect VPN
      "services/networking/globalprotect-vpn.nix"
    ];

  nixpkgs.config = baseconfig // {
    packageOverrides = pkgs: {
      # GlobalProtect VPN
      globalprotect-openconnect = unstable.globalprotect-openconnect;
    };
  };

  # GlobalProtect VPN
  services.globalprotect.enable = true;

}

