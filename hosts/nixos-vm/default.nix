{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ./virtualized.nix
  ];
}