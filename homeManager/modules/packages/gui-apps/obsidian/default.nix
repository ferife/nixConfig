{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./core-plugins.nix
    ./hotkeys.nix
    ./obsidian.nix
    ./settings.nix
  ];

  hm = {
    obsidian = lib.mkDefault true;
  };
}
# rsync -rDL --progress "/home/fernandorf/Documents/test-git-vault/test-gen-vault/.obsidian" "/home/fernandorf/Documents/test-git-vault/test-gen-vault/backup" && find "/home/fernandorf/Documents/test-git-vault/test-gen-vault/backup" -name "*" -exec chmod 777 {} \;

