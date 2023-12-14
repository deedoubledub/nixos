# nixos gui configuration

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable picom
  services.picom.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Touchpad and keyboard tweaks
  services.xserver.libinput.touchpad.disableWhileTyping = true;
  services.xserver.xkbOptions = "ctrl:nocaps,terminate:ctrl_alt_bksp";

  # Enable the qtile window manager.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+qtile";
  services.xserver.windowManager.qtile.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";

  # Lock on suspend
  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand = "env XSECURELOCK_PASSWORD_PROMPT=time_hex XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_BLANK_TIMEOUT=30 XSECURELOCK_BLANK_DPMS_STATE=off XSECURELOCK_FONT='RobotoMono' XSECURELOCK_NO_COMPOSITE=1 ${pkgs.xsecurelock}/bin/xsecurelock";
}

