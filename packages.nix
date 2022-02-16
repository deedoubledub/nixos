# nixos package installation

{ config, pkgs, ... }:

{
  # Automatic upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # Allow nonfree packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # system
    bind
    dos2unix
    file
    htop
    inetutils
    killall
    libnotify
    ncdu
    pciutils
    sshfs
    unzip
    usbutils
    wget
    xorg.xkill

    # console
    alacritty
    hiera-eyaml
    perl532Packages.AppClusterSSH
    screen
    tmux
    tree
    vim
    xclip
    yadm
    youtube-dl

    # development
    arduino
    csvkit
    docker-compose
    git
    go
    kubectl
    lens

    # window manager
    arandr
    dunst
    feh
    gsimplecal
    playerctl
    rofi
    xsecurelock
    xss-lock

    # themes
    nordic

    # gui
    appimage-run
    discord
    firefox
    flameshot
    gimp
    gnome.adwaita-icon-theme
    gnome.gnome-calculator
    gnome.nautilus
    google-chrome
    networkmanagerapplet
    pavucontrol
    remmina
    slack
    vlc
    ytmdesktop

    # trezor
    trezord
    trezor-suite
    trezor-udev-rules

    # network
    openconnect
    nmap-graphical
  ];

  # fonts
  fonts.fonts = with pkgs; [
    roboto-mono
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];

  # services
  services.gvfs.enable = true; # smb support in nautilus
}

