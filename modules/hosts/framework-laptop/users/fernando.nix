{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.laptop = {config, ...}: {
    imports = with inputs.self.modules.nixos;
    with inputs.self.factory; [
      fernandorf
      # (mount-cifs-nixos {
      #   host = "home-server.lan";
      #   resource = "home";
      #   destination = "/home/users/fernandorf/homeserver";
      #   credentialspath = "${config.age.secrets."homeserver-cred".path}";
      #   UID = "fernandorf";
      #   GID = "users";
      # })
    ];

    # age.secrets."homeserver-cred" = {
    #   file = "${self.inputs.secrets}/homeserver-cred.age";
    # };

    # ...

    home-manager.users.fernandorf = {
      ###
    };
  };
}
