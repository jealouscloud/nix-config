{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.lenovo-thinkpad

    ./hardware-configuration.nix
    ../../common/configuration.nix
    ../../common/boot-uefi.nix
    # ../../common/optional/desktop/xfce.nix
    ../../common/optional/desktop/plasma.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/yubikey.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/docker.nix
    ../../common/locale.nix
  ];
  networking.hostName = "work";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
