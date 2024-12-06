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
    ../../common/boot-uefi.nix
    ../../common/optional/desktop/xfce.nix
    # ../../common/optional/desktop/plasma.nix
    #../../common/optional/desktop/hyprland.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/docker.nix
    ../../common/locale.nix
  ];
  networking.hostName = "nixos-vm";
}