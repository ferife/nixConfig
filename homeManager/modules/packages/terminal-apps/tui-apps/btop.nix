{
  config,
  lib,
  ...
}:
{
	options = {
		btop.enable = lib.mkEnableOption "btop, a detailed TUI resource monitor";
	};

	config = lib.mkMerge [
    (lib.mkIf (config.btop.enable) { programs.btop.enable = true; })
  ];
}
