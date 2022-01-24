# nixos framework dock configuration

{ config, pkgs, ... }:

{
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="usb", ACTION=="add|remove", ATTRS{idVendor}=="05e3", ATTRS{idProduct}=="0620", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/dock.sh"
    '';
  };
}

