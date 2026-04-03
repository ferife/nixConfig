{
  self,
  lib,
  ...
}: {
  flake.modules = lib.mkMerge [
    (self.factory.user "fernandorf" true)
    {
      nixos.fernandorf = {
        imports = with self.modules.nixos; [
          # developmentEnvironment
        ];
        users.users.fernandorf = {
          group = "audio";
        };
      };

      # darwin.fernandorf = {
      #   imports = with self.modules.darwin; [
      #     # drawingApps
      #     # developmentEnvironment
      #   ];
      # };

      homeManager.fernandorf = {pkgs, ...}: {
        imports = with self.modules.homeManager; [
          # home manager modules imported here
          system-minimal

          alejandra
          cursor
          fzf
          ghostty
          hyprland
          jq
          keepassxc
          lazygit
          librewolf
          nh
          noctalia
          ripgrep
          starship
          stylix
          zoxide
          zsh
        ];
        home.packages = [pkgs.mediainfo];
      };
    }
  ];
}
