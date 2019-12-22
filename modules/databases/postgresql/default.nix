{ ... }:
{
  services.postgresql = {
    enable = true;
    extraConfig = ''
      log_directory = '/tmp/pg_log'
      log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'
      log_statement = 'all'
    '';
  };
}
