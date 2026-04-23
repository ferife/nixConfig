{inputs, ...}: {
  # expansion of cli system for desktop use

  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      system-cli

      # NIX
      stylix
      #
      # PROGRAMS
      # gdm
      # ghostty
      # gnome
      hyprland
      kde-connect
      # kde-plasma
      regreet
      # sddm
      #
      # SERVICES
      color-onedark
      #
      # SETTINGS
      bluetooth
      io-settings
      power-settings
      # x11
    ];
  };

  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      system-cli

      # NIX
      stylix
      #
      # PROGRAMS
      # audacity
      bat
      btop
      cheese
      chromium
      cmatrix
      # dolphin
      dust
      eclipse
      evince
      eza
      ghostty
      # gimp
      gnome-calculator
      gnome-clocks
      hyprland
      # imagemagick
      # jetuml
      kde-connect
      # kde-plasma
      keepassxc
      lazygit
      # libreoffice
      librewolf
      loupe
      # lsd
      mpv
      nautilus
      # neofetch
      noctalia
      obs-studio
      onlyoffice
      # openshot
      plantuml
      proton-mail
      # qbittorrent
      qutebrowser
      starship
      thunderbird
      tldr
      tor-browser
      # vlc
      # vs-code
      wpaperd
      yazi
      # yt-dlp
      zellij
      zoxide
      #
      # SERVICES
      color-onedark
      mullvad
      #
      # SETTINGS
      cursor
      notifications
    ];
  };
}
