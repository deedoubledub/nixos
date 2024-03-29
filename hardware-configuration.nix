{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1'';

  # Use latest kernel for hardware support
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # battery life tweaks
  boot.kernelParams = [ "mem_sleep_default=s2idle" ];

  # enable fwupd for firmware updates
  services.fwupd.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-label/NIXROOT";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/.swapfile"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
