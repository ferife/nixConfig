{inputs, ...}: {
  # jq is a JSON processing tool

  flake.modules.homeManager.jq = {pkgs, ...}: {
    programs.jq.enable = true;
  };
}
