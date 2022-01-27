# nixos framework dock configuration

{ config, pkgs, ... }:

{
  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="thunderbolt", ATTRS{vendor}=="0x177", ATTRS{device}=="0x428a", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/tbdock.sh"
      ACTION=="remove", SUBSYSTEM=="thunderbolt", ENV{DEVPATH}=="/devices/pci0000:00/0000:00:0d.3/domain1/1-0/1-3", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/tbdock.sh"
    '';
  };
}

