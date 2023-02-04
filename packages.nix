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
    iotop
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
    perl536Packages.AppClusterSSH
    screen
    tmux
    tree
    vim
    xclip
    yadm
    yt-dlp

    # development
    arduino
    csvkit
    docker-compose
    git
    go
    hugo
    jq
    k9s
    kubectl
    kubeseal
    texlive.combined.scheme-full
    virt-manager
    zathura

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
    kate
    networkmanagerapplet
    obs-studio
    pavucontrol
    remmina
    vlc
    ytmdesktop

    # trezor
    trezord
    trezor-suite
    trezor-udev-rules

    # network
    openconnect
    nmap
    wireguard-tools
  ];

  # fonts
  fonts.fonts = with pkgs; [
    roboto-mono
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];

  # steam
  programs.steam = {
    enable = true;
  };

  # services
  services.gvfs.enable = true; # smb support in nautilus
}

