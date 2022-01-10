# nixos users configuration

{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dwagner = {
    isNormalUser = true;
    extraGroups = [ "dialout" "docker" "networkmanager" "video" "wheel" ];
  };
}

