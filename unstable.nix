# nixos unstable channel

{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config =  baseconfig; };
in
{
  environment.systemPackages = with pkgs; [
    # neovim
    (import (fetchTarball "channel:nixos-unstable") {}).neovim
  ];
}

