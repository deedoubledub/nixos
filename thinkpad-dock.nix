# nixos thinkpad dock configuration

{ config, pkgs, ... }:

{
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="usb", ACTION=="add|remove", ATTRS{idVendor}=="17ef", ATTRS{idProduct}=="1010", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/thinkpad-dock.sh"
    '';
  };
}

