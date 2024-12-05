# nixos gui configuration

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable picom
  services.picom.enable = true;

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Touchpad and keyboard tweaks
  services.libinput.touchpad.disableWhileTyping = true;
  services.xserver.xkb.options = "ctrl:nocaps,terminate:ctrl_alt_bksp";

  # Enable the qtile window manager.
  services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.defaultSession = "qtile";
  services.xserver.windowManager.qtile.enable = true;

  # Enable XRDP
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "qtile start -b x11";
  services.xrdp.openFirewall = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Lock on suspend
  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand = "env XSECURELOCK_PASSWORD_PROMPT=time_hex XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_BLANK_TIMEOUT=30 XSECURELOCK_BLANK_DPMS_STATE=off XSECURELOCK_FONT='RobotoMono' XSECURELOCK_NO_COMPOSITE=1 ${pkgs.xsecurelock}/bin/xsecurelock";

  # Enable polkit
  security.polkit.enable = true;
}

