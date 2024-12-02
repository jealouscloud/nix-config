{
  services.fprintd.enable = true;
  security.pam.services = {
    login.fprintAuth = true;
    xscreensaver.fprintAuth = true;
    sudo.fprintAuth = true;
  };
  # https://sbulav.github.io/nix/nix-fingerprint-authentication/
  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = true;
}