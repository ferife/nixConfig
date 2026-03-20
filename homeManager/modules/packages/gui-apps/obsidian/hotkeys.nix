{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.obsidian {
      programs.obsidian.vaults.test-gen-vault.settings.hotkeys = lib.mkMerge [
        {
          "editor:open-help" = [
            {
              modifiers = ["Mod" "Shift"];
              key = "H";
            }
          ];
          "editor:insert-footnote" = [
            {
              modifiers = ["Alt" "Mod"];
              key = "F";
            }
          ];
          "editor:insert-table" = [
            {
              modifiers = ["Alt" "Mod"];
              key = "T";
            }
          ];
          "markdown:add-alias" = [
            {
              modifiers = ["Mod"];
              key = "A";
            }
          ];
        }
        (lib.mkIf (lib.any (x: x.name == "backlink") config.programs.obsidian.vaults.test-gen-vault.settings.corePlugins) {
          "backlink:open" = [
            {
              modifiers = ["Mod" "Shift"];
              key = "B";
            }
          ];
        })
      ];
    })
  ];
}
