{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-plugins = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-plugins = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-cmdline
      nixvim-comment
      nixvim-completion
      nixvim-files
      nixvim-git
      nixvim-hardtime
      nixvim-intellitab
      nixvim-move
      nixvim-pairs
      # nixvim-precognition
      nixvim-spider
      nixvim-splitjoin
      nixvim-telescope
      nixvim-textobjects
      nixvim-todo-comments
      nixvim-which-key
      nixvim-yanky
    ];
  };
}
