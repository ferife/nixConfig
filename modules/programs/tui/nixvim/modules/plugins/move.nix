{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-move = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-move = {pkgs, ...}: {
    plugins.mini-move = {
      # Move text around with ease
      mappings = {
        # Move visual selection in visual mode
        # The mappings below are Alt (Meta) + hjkl
        left = "<M-h>";
        down = "<M-j>";
        up = "<M-k>";
        right = "<M-l>";

        # Move the current line in normal mode
        line_left = "<M-h>";
        line_down = "<M-j>";
        line_up = "<M-k>";
        line_right = "<M-l>";
      };
      # Auto reindent selection during linewise vertical movement
      options.reindent_linewise = true;
    };
  };
}
