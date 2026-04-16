{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-comment = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-comment = {pkgs, ...}: {
    plugins.mini-comment = {
      enable = true;

      options = {
        # Do not put comment symbols on blank lines
        ignore_blank_line = true;

        # Only consider a line to be a comment line if the comment symbol is before all indent whitespace
        start_of_line = false;

        # Put a space between the comment symbol and first character
        pad_comment_parts = true;
      };
      mappings = {
        # Toggle comment (like `gcip` - comment inner paragraph) for both normal and visual modes
        comment = "gc";

        # Toggle comment on current line
        comment_line = "gcc";

        # Toggle comment on visual selection
        comment_visual = "gc";

        # Define 'comment' textobject (like `dgc` - delete whole comment block)
        # Works in visual mode if mapping differs from `comment_visual`
        textobject = "gc";
      };
    };
  };
}
