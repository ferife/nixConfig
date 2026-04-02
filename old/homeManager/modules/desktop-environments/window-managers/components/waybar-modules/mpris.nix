{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.playerctl = lib.mkForce true;

    programs.waybar = {
      settings.mainBar = {
        "mpris" = {
          format = " <span size=\"large\" >{player_icon}{status_icon}</span> {dynamic} ";
          format-stopped = "{status_icon}";
          # format-playing-len = 40;
          # format-paused-len = 40;
          dynamic-len = 60;
          tooltip = true;
          tooltip-format = "{player} - {status}\nTitle: {title}\nArtist: {artist}\nAlbum: {album}\nPosition: {position}\nLength: {length}";
          player-icons = {
            "default" = "󰝚 ";
            "firefox" = "󰈹 ";
            "vlc" = "󰕼 ";
          };
          status-icons = {
            "playing" = "󰐊";
            "paused" = "󰏤";
            "stopped" = "󰓛";
          };
          dynamic-importance-order = ["artist" "title" "position" "length" "album"];
        };
      };
    };
  };
}
