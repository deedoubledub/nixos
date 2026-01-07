# nixos unstable channel

{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config =  baseconfig; };
in
{
  environment.systemPackages = with pkgs; [
    # feishin
    (import (fetchTarball "channel:nixos-unstable") {}).feishin

    # neovim
    (import (fetchTarball "channel:nixos-unstable") {}).neovim
  ];
}

