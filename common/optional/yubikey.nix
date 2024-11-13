{ pkgs, ... }: {
  # https://nixos.wiki/wiki/Yubikey
  environment.systemPackages = with pkgs; [ pkcs11-provider yubico-piv-tool ];
  services.pcscd.enable = true;
}
