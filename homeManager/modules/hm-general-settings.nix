{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  config = lib.mkMerge [
    {
      home.enableNixpkgsReleaseCheck = true;

      home.sessionVariables = {
        HM_CONFIG_FILES_DIR = "/home/${userSettings.username}/${systemSettings.configFilesDirectory}";
        HM_CONFIG_SCRIPTS_DIR = "/home/${userSettings.username}/${systemSettings.scriptsDirectory}";
        HM_CONFIG_ASSETS_DIR = "/home/${userSettings.username}/${systemSettings.assetsDirectory}";
      };
    }
    (lib.mkIf config.hm.bash {
      programs.bash.initExtra = let
        files-dir = "export HM_CONFIG_FILES_DIR='/home/${userSettings.username}/${systemSettings.configFilesDirectory}'";
        scripts-dir = "export HM_CONFIG_SCRIPTS_DIR='/home/${userSettings.username}/${systemSettings.scriptsDirectory}'";
        assets-dir = "export HM_CONFIG_ASSETS_DIR='/home/${userSettings.username}/${systemSettings.assetsDirectory}'";
      in "${files-dir}\n${scripts-dir}\n${assets-dir}";
    })
  ];
}
