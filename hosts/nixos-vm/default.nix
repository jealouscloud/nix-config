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
    ../../common/xfce.nix
    ../../common/audio.nix
    ../../common/locale.nix
    ./virtualized.nix
  ];
}