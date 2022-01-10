# nixos gui configuration

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.disableWhileTyping = true;
  services.xserver.xkbOptions = "ctrl:nocaps,terminate:ctrl_alt_bksp";
  # kernel commandline for two-finger scrolling after suspend
  boot.kernelParams = ["psmouse.synaptics_intertouch=0"];

  # Enable the qtile window manager.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+qtile";
  services.xserver.windowManager.qtile.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";

  # Lock on suspend
  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand = "env XSECURELOCK_PASSWORD_PROMPT=time_hex XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_BLANK_TIMEOUT=30 XSECURELOCK_BLANK_DPMS_STATE=off XSECURELOCK_FONT='RobotoMono Nerd Font' ${pkgs.xsecurelock}/bin/xsecurelock";
}

