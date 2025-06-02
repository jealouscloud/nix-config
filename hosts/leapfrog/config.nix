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
    ../../common/optional/desktop/plasma.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/fwupd.nix
    ../../common/optional/qemu.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/docker.nix
    ../../common/optional/fingerprint.nix
    ../../common/optional/utils.nix
    ../../common/locale.nix
  ];
  networking.hostName = "leapfrog";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}