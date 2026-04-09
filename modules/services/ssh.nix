{inputs, ...}: {
  # SSH is a tool used to send commands to a remote machine

  flake.modules.nixos.ssh = {pkgs, ...}: {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = true;
      };
    };
  };

  # flake.modules.homeManager.ssh = {pkgs, ...}: {};
}
