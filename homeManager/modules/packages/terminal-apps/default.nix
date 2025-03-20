{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./command-tools
    ./terminal-emulators
    ./tui-apps
  ];
}
# TODO: Check out the following tools
# coreutils - Basic helper apps
# fd - replacement for find
# jq - Tool for formatting/querying JSON
# procs - ps replacement
# ripgrep - grep replacement
# zip

