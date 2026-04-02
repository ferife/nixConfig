# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.documentation {
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
    # Force install programs
  };
}
