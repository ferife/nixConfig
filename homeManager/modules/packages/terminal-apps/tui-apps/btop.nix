{
  config,
  lib,
  ...
}:
{
	options = {
		btopModule.enable = lib.mkEnableOption "btop, a detailed TUI resource monitor";
	};

	config = lib.mkMerge [

    (lib.mkIf (config.btopModule.enable) { programs.btop.enable = true; })

  ];
}
