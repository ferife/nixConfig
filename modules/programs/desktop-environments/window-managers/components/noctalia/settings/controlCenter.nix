{inputs, ...}: {
  # flake.modules.nixos.noctalia = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia = {lib, ...}: {
    programs.noctalia-shell.settings.controlCenter = {
      shortcuts = {
        left = [
          {id = "AirplaneMode";}
          {id = "Network";}
          {id = "Bluetooth";}
          {id = "WallpaperSelector";}
          {id = "NoctaliaPerformance";}
        ];
        right = [
          {id = "Notifications";}
          {id = "PowerProfile";}
          {id = "KeepAwake";}
          {id = "NightLight";}
        ];

        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
        ];
      };
    };
  };
}
