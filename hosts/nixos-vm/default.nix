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
    ../../common/desktop/plasma.nix
    ../../common/audio.nix
    ../../common/locale.nix
    ./virtualized.nix
  ];
}