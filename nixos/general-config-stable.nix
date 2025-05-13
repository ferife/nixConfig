# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [./minimal-config.nix];

  config = lib.mkMerge [
    {
      # Networking

      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networking.networkmanager.enable = true;
    }
    {
      # Location information

      # Set your time zone.
      time.timeZone = "${systemSettings.timezone}";

      # Select internationalisation properties.
      i18n.defaultLocale = "${systemSettings.locale}";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "${systemSettings.locale}";
        LC_IDENTIFICATION = "${systemSettings.locale}";
        LC_MEASUREMENT = "${systemSettings.locale}";
        LC_MONETARY = "${systemSettings.locale}";
        LC_NAME = "${systemSettings.locale}";
        LC_NUMERIC = "${systemSettings.locale}";
        LC_PAPER = "${systemSettings.locale}";
        LC_TELEPHONE = "${systemSettings.locale}";
        LC_TIME = "${systemSettings.locale}";
      };
    }
    {
      # X11

      # Enable the X11 windowing system.
      services.xserver.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    }
    {
      # IO Device settings

      # Enable CUPS to print documents.
      # services.printing.enable = true;

      # Enable sound with pipewire.
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };

      # Enable touchpad support (enabled default in most desktopManager).
      # services.xserver.libinput.enable = true;
    }
    {
      # Flakes & nixpkgs

      nix.settings.experimental-features = ["nix-command" "flakes"];
      nixpkgs.config.allowUnfree = true;
    }
    {
      # SUID Wrappers

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };
    }
    {
      # SSH and Firewalls

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      # This would allow me to ssh into this computer from any other device
      # services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;
    }
    {
      # Firmware

      # Enable software for updating firmware
      services.fwupd.enable = true;
    }
    {
      # Documentation

      # The following installs documentation for all existing nixos options
      documentation.man.enable = true;
      documentation.doc.enable = true;
      documentation.nixos = {
        enable = true;

        # The following will cause the docs to include all custom options created within my config
        extraModuleSources = [
          ./modules
        ];
      };
      # FIXME: The above will cause errors with stylix
      # Ensure that ONLY MY documentation is generated, not the docs for stylix or anything else
    }
    {
      # Force install programs

      # The following lines enable certain programs that I consider essential for the minimum installation of a computer using this config
      nixos.git = lib.mkForce true;
      nixos.fastfetch = lib.mkForce true;
      nixos.homeManager = lib.mkForce true;
      nixos.nh.enable = lib.mkForce true;
    }
  ];
}
