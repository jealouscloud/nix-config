{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
    ../../common/optional/desktop/xfce.nix
    ../../common/audio.nix
    ../../common/locale.nix
    ./virtualized.nix
  ];
}