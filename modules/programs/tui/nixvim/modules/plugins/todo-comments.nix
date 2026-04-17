{inputs, ...}: {
  # todo-comments is a plugin by nvim allowing for highlighting, listing, and searching todo comments

  flake.modules.homeManager.nixvim-todo-comments = {pkgs, ...}: {
    plugins.telescope.enable = true; # Dependency

    plugins.todo-comments = {
      enable = true;
      settings.highlight.pattern = [".*<(KEYWORDS)s*:" ".*<(KEYWORDS)s*"];
      keymaps = {
        todoTelescope = {
          key = "<leader>td";
          options.desc = "Use Telescope to search for all todo comments";
        };
      };
    };
    # TODO: example
    # HACK: example
    # WARN: example
    # PERF: example
    # NOTE: example
    # TEST: example
  };
}
