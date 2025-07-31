{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.proton-mail {
    # This file refers to apps by the company Proton, as in Proton Mail, Proton Calendar, etc.
    # This does NOT refer to Proton, the program maintained by Valve that allows games made for Windows to run on Linux

    home.packages = with pkgs; [
      protonmail-desktop
    ];
  };
}
