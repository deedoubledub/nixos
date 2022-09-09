# nixos framework dock configuration

{ config, pkgs, ... }:

{
  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="thunderbolt", ATTRS{vendor}=="0x177", ATTRS{device}=="0x428a", ENV{DOCK}="work", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/dock.sh"
      ACTION=="remove", SUBSYSTEM=="thunderbolt", ENV{DEVPATH}=="/devices/pci0000:00/0000:00:0d.3/domain1/1-0/1-3", ENV{DOCK}="", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/dock.sh"
      ACTION=="add", SUBSYSTEM=="thunderbolt", ATTRS{vendor}=="0x177", ATTRS{device}=="0x4294", ENV{DOCK}="home", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/dock.sh"
      ACTION=="remove", SUBSYSTEM=="thunderbolt", ENV{DEVPATH}=="/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1", ENV{DOCK}="", RUN+="${pkgs.bash}/bin/bash /home/dwagner/.local/bin/dock.sh"
    '';
  };
}

