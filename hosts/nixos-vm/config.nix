{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.framework-intel-core-ultra-series1
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ../../common/configuration.nix
    ../../common/boot-uefi.nix
    ../../common/optional/desktop/xfce.nix
    # ../../common/optional/desktop/plasma.nix
    #../../common/optional/desktop/hyprland.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/docker.nix
    ../../common/virtualized.nix
    ../../common/locale.nix
  ];
  networking.hostName = "nixos-vm";
}