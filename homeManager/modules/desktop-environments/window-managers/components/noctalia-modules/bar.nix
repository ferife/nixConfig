{
  config,
  lib,
  pkgs,
  ...
}: let
  enable-noctalia = config.hm.wm.components.noctalia;
in {
  config = lib.mkIf enable-noctalia {
    programs.noctalia-shell.settings.bar = {
      position = "top";
      widgets = {
        left = [
          {
            id = "Launcher";
            useDistroLogo = true;
            enableColorization = true;
          }
          {
            id = "Clock";
            formatHorizontal = "HH:mm:ss | ddd, MMM dd";
            formatVertical = "HH mm - MMM dd";
            tooltipFormat = "HH:mm:ss | ddd, MMM dd";
          }
          {
            id = "SystemMonitor";
            showNetworkStats = true;
          }
          {id = "ActiveWindow";}
          {id = "MediaMini";}
        ];
        center = [
          {
            id = "Workspace";
            labelMode = "name";
            showApplications = true;
            showApplicationsHover = true;
          }
        ];
        right = [
          {id = "VPN";}
          {id = "NotificationHistory";}
          {
            id = "Battery";
            displayMode = "graphic";
            showNoctaliaPerformance = true;
            showPowerProfiles = true;
          }
          {id = "Volume";}
          {id = "Brightness";}
          {id = "Spacer";}
          {id = "ControlCenter";}
        ];
      };
    };
  };
}
