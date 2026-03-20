{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.obsidian {
      programs.obsidian.vaults.test-gen-vault.settings.app = {
        strictLineBreaks = true;
        showLineNumber = true;
        vimMode = true;
        attachmentFolderPath = "/Attachments";
        alwaysUpdateLinks = true;
      };
    })
  ];
}
