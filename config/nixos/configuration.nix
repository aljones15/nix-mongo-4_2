# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: 
  # this package is not in unstable yet
  let mongo4_2 = pkgs.callPackage /home/liminal18/Programs/mongo4/4_2/v4_2.nix {
    boost = pkgs.boost;
    Security = pkgs.Security;
    CoreFoundation = pkgs.CoreFoundation;
    cctools = pkgs.cctools;
    sasl = pkgs.cyrus_sasl; 
  };
  in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./audio.nix
    ];
  # Use the gummiboot efi boot loader.
  boot.loader.systemd-boot.enable = true;  
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";
  services.localtime.enable = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # add Apache tomcat webserver
  # services.tomcat.enable = true;
  # services.tomcat.package = pkgs.tomcat85;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "en_US";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.synaptics.enable = true;
  # services.xserver.synaptics.twoFingerScroll = true;
  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };

  # MariaDB Config
  services.mysql = {
    enable = true;
    dataDir = "/var/db/mysql";
    package = pkgs.mysql;
  };

  # MongoDB Config 
  services.mongodb.enable = true;
  services.mongodb.package = mongo4_2;
  # Redis Config
  services.redis.enable = true;

  # Postgresql Config
  # services.postgresql.enable = true;
  # services.postgresql.package = pkgs.postgresql94;

  users.extraUsers.liminal18 = {
    isNormalUser = true;
    home = "/home/liminal18";
    description = "liminal18";
    extraGroups = ["wheel" "networkmanager" "audio" "docker"];
    openssh.authorizedKeys.keys = [
         "bitbucket"
         "id_rsa"
    ];
  };
 
  networking = {
    enableIPv6 = true;
    wireless.enable = true;
    nameservers = ["8.8.8.8" "8.8.8.4"];
    extraHosts =
      ''
        127.0.0.1 example.credential-repository.localhost
        127.0.0.1 authorization.localhost
        127.0.0.1 issuer.veres.localhost
        127.0.0.1 verifier.veres.localhost
        127.0.0.1 wallet.veres.localhost
        127.0.0.1 bedrock.localhost
      '';
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "20.03";
  system.autoUpgrade.enable = true;
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    inconsolata
    liberation_ttf
    dejavu_fonts
    bakoma_ttf
    gentium
    ubuntu_font_family
    terminus_font
  ]; 
  nixpkgs.config.allowUnfree = true;
  hardware.bluetooth.enable = false;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  users.users.liminal18.packages = [
    pkgs.steam
    pkgs.wpa_supplicant_gui
  ];
}
