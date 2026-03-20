{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.obsidian {
      programs.obsidian.vaults.test-gen-vault.settings.corePlugins = [
        {
          name = "audio-recorder";
          enable = true;
        }
        {
          name = "backlink";
          enable = true;
        }
        {
          name = "bases";
          enable = true;
        }
        {
          name = "bookmarks";
          enable = true;
        }
        {
          name = "command-palette";
          enable = true;
        }
        {
          name = "editor-status";
          enable = true;
        }
        {
          name = "file-explorer";
          enable = true;
        }
        {
          name = "file-recovery";
          enable = true;
        }
        {
          name = "global-search";
          enable = true;
        }
        {
          name = "graph";
          enable = true;
        }
        {
          name = "note-composer";
          enable = true;
        }
        {
          name = "outgoing-link";
          enable = true;
        }
        {
          name = "outline";
          enable = true;
        }
        {
          name = "page-preview";
          enable = true;
        }
        {
          name = "properties";
          enable = true;
        }
        {
          name = "slash-command";
          enable = true;
        }
        {
          name = "switcher";
          enable = true;
        }
        {
          name = "tag-pane";
          enable = true;
        }
        {
          name = "templates";
          enable = true;
        }
        {
          name = "webviewer";
          enable = true;
        }
        {
          name = "word-count";
          enable = true;
        }
      ];
    })
  ];
}
