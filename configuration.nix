# nixos configuration

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <nixos-hardware/common/pc/ssd>

      ./base.nix
      ./network.nix
      ./bluetooth.nix
      ./gui.nix
      ./brightness.nix
      ./fingerprint.nix
      ./trezor.nix
      ./docker.nix
      ./users.nix
      ./packages.nix
      ./unstable.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}

