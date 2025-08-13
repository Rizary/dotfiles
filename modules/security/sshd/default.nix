{ pkgs, lib, config, ... }:
let
  ssh-path = lib.makeBinPath [
    pkgs.coreutils
    pkgs.gnused
    pkgs.gnugrep
    pkgs.git
    pkgs.openssh
  ];
in
{
  options.enableSshdAtBoot = lib.mkEnableOption "SSH daemon auto-start at boot";

  config.services.openssh.enable = true;
  config.services.openssh.permitRootLogin = "yes";
  config.services.openssh.passwordAuthentication = false;
  config.services.openssh.extraConfig = "PermitUserEnvironment yes";
  config.services.openssh.authorizedKeysFiles = [
    "/home/rizary/.ssh/nixos_kvm.pub"
    "/home/rizary/.ssh/nixos_kvm"
  ];
  config.systemd.services.sshd.wantedBy = lib.mkIf config.enableSshdAtBoot (lib.mkForce [ ]);

  config.primary-user.openssh.authorizedKeys.keys = [
    "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAA9Yo3SG5kZEzYOaaHrsAlIyYTL1B8gzLKcVdIhwl8fl2oUV3AaFwdsQcnasheqv1zrNlqOOpNiAVAejPAwpeCPNgChfKuip2CblFf8cefdVqXzie6ZUu6hSZaNXJ33JOu50EWPkwGIu0MAFRPdEO2qCj2YLyeBrPTCIZN2VrYv6ZvK/w== rizary@rizilab"
    #(builtins.extraBuiltins.publicSshKey pkgs config)
  ];

  config.primary-user.openssh.authorizedKeys.keyFiles = [
    /home/rizary/.ssh/nixos_kvm.pub
  ];

  config.primary-user.home-manager.home.file.".ssh/environment".text = "PATH=${ssh-path}";

}
