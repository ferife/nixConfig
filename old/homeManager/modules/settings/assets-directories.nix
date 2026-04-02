{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      home.sessionVariables = let
        username = "${config.hm.specialArgs.user-settings.username}";
        files-dir = "${config.hm.specialArgs.system-settings.config-files-dir}";
        scripts-dir = "${config.hm.specialArgs.system-settings.scripts-dir}";
        assets-dir = "${config.hm.specialArgs.system-settings.assets-dir}";
      in {
        HM_CONFIG_FILES_DIR = "/home/${username}/${files-dir}";
        HM_CONFIG_SCRIPTS_DIR = "/home/${username}/${scripts-dir}";
        HM_CONFIG_ASSETS_DIR = "/home/${username}/${assets-dir}";
      };
    }
    (lib.mkIf config.hm.bash {
      programs.bash.initExtra = let
        files-dir = "export HM_CONFIG_FILES_DIR='/home/${config.hm.specialArgs.user-settings.username}/${config.hm.specialArgs.system-settings.config-files-dir}'";
        scripts-dir = "export HM_CONFIG_SCRIPTS_DIR='/home/${config.hm.specialArgs.user-settings.username}/${config.hm.specialArgs.system-settings.scripts-dir}'";
        assets-dir = "export HM_CONFIG_ASSETS_DIR='/home/${config.hm.specialArgs.user-settings.username}/${config.hm.specialArgs.system-settings.assets-dir}'";
      in "${files-dir}\n${scripts-dir}\n${assets-dir}";
    })
  ];
}
