{ pkgs, config, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.unstable.firefox;
    policies = {
      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
    };
    profiles."${config.home.username}" = {
      isDefault = true;
      id = 0;
      name = "${config.home.username}";
      settings = { "extensions.autoDisableScopes" = 0; };

      extensions = with pkgs.inputs.firefox-addons; [
        bitwarden
        darkreader
        floccus
        react-devtools
        reduxdevtools
        stylus
        ublock-origin
      ];
    };
  };

}
