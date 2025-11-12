# nixos package installation

{ config, pkgs, ... }:

{
  # Automatic upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # Allow nonfree packages.
  nixpkgs.config.allowUnfree = true;

  # Allow insecure electron-24.8.6
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
  ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # system
    alsa-utils
    bind
    dos2unix
    file
    htop
    inetutils
    iotop
    killall
    libnotify
    ncdu
    p7zip
    pciutils
    pv
    restic
    sshfs
    unzip
    usbutils
    wget
    xorg.xkill
    zip

    # console
    alacritty
    gnupg
    minicom
    pass
    perl540Packages.AppClusterSSH
    screen
    sshpass
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
    nodejs_24
    openssl
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
    bitwarden
    discord
    firefox
    flameshot
    gimp
    adwaita-icon-theme
    gnome-calculator
    indicator-sound-switcher
    nautilus
    google-chrome
    kdePackages.kate
    networkmanagerapplet
    obs-studio
    pavucontrol
    polkit_gnome
    remmina
    vlc
    #ytmdesktop

    # games
    clonehero

    # trezor
    trezord
    trezor-suite
    trezor-udev-rules

    # network
    nmap
    #openfortivpn
    #openfortivpn-webview
    wireguard-tools
  ];

  # fonts
  fonts.packages = [
    pkgs.nerd-fonts.roboto-mono
  ];

  # steam
  programs.steam = {
    enable = true;
  };

  # services
  services.gvfs.enable = true; # smb support in nautilus
}

