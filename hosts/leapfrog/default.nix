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
    ../../common/optional/pipewire.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/fwupd.nix
    ../../common/optional/qemu.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/docker.nix
    ../../common/optional/nix-alien.nix
    ../../common/locale.nix
  ];
}